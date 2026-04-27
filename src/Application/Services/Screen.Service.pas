unit Screen.Service;

interface
uses
  SysUtils, Windows, System.Classes, System.SyncObjs,
  Vcl.Graphics, Winapi.GDIPAPI, Winapi.GDIPOBJ, Winapi.GDIPUTIL,
  ActiveX, AxCtrls, Math,
  System.Generics.Collections; // TThreadedQueue

const
  TILE_COUNT = 50;
  TILE_COLS  = 10;
  TILE_ROWS  = TILE_COUNT div TILE_COLS; // 5

type
  TTileChecksum = Cardinal;

  TTileInfo = record
    Index    : Integer;
    Bounds   : TRect;
    Checksum : TTileChecksum;
    Changed  : Boolean;
  end;

  TTileBuffer = array[0..TILE_COUNT - 1] of TTileChecksum;

  TCapturePacket = record
    Bitmap  : TBitmap;
    Tiles   : array[0..TILE_COUNT - 1] of TTileInfo;
    ScaledW : Integer;
    ScaledH : Integer;
  end;

  TDeltaPacket = class
    Stream     : TMemoryStream;
    ChangedIdx : array of Integer;
    TileW      : Integer;
    TileH      : Integer;
    Cols       : Integer;
    Rows       : Integer;
    ScaledW    : Integer;
    ScaledH    : Integer;
    constructor Create;
    destructor  Destroy; override;
  end;

  TOnDelta = procedure(Packet: TDeltaPacket) of object;

  { ── Fila thread-safe no generics ── }
  TCaptureQueue = class
  private
    FItems    : array[0..3] of TCapturePacket;
    FHead     : Integer;
    FTail     : Integer;
    FCount    : Integer;
    FLock     : TCriticalSection;
    FNotEmpty : TEvent;
  public
    constructor Create;
    destructor  Destroy; override;
    procedure Push(const Item: TCapturePacket);
    function  Pop(out Item: TCapturePacket; TimeoutMs: Cardinal): Boolean;
  end;

  { ── Thread A: print GDI ── }
  TCaptureThread = class(TThread)
  private
    FBitmapA : TBitmap;
    FBitmapB : TBitmap;
    FCurrent : Integer;
    FScaled  : Integer;
    FQueue   : TCaptureQueue;
    procedure BuildTileBounds(var Tiles: array of TTileInfo; W, H: Integer);
    function  ActiveBmp: TBitmap;
  protected
    procedure Execute; override;
  public
    constructor Create(AQueue: TCaptureQueue; AScaled: Integer = 1);
    destructor  Destroy; override;
  end;

  { ── Thread B: XOR checksum + encode ── }
  TDiffEncodeThread = class(TThread)
  private
    FQueue        : TCaptureQueue;
    FPrevChecksum : TTileBuffer;
    FQuality      : Integer;
    FGDIPToken    : ULONG_PTR;
    FJpgClsid     : TGUID;
    FOnDelta      : TOnDelta;
    function  XorChecksumTile(ABmp: TBitmap; const R: TRect): TTileChecksum;
    procedure EncodeTile(ABmp: TBitmap; const R: TRect;
                         AStream: TMemoryStream; Quality: Integer);
  protected
    procedure Execute; override;
  public
    constructor Create(AQueue: TCaptureQueue; AQuality: Integer;
                       AOnDelta: TOnDelta);
    destructor  Destroy; override;
  end;

  TScreenService = class
  private
    class var FQueue         : TCaptureQueue;
    class var FCaptureThread : TCaptureThread;
    class var FDiffThread    : TDiffEncodeThread;
  public
    class procedure Start(AScaled: Integer = 1; AQuality: Integer = 75;
                          AOnDelta: TOnDelta = nil);
    class procedure Stop;
    class procedure CaptureScreenToStream(AStream: TMemoryStream;
      Quality: Integer; AScaled: Integer = 1; ACompareHash: Boolean = False);
  end;

implementation

{ TDeltaPacket }

constructor TDeltaPacket.Create;
begin
  inherited;
  Stream := TMemoryStream.Create;
  SetLength(ChangedIdx, 0);
end;

destructor TDeltaPacket.Destroy;
begin
  Stream.Free;
  inherited;
end;

{ TCaptureQueue }

constructor TCaptureQueue.Create;
begin
  inherited;
  FHead     := 0;
  FTail     := 0;
  FCount    := 0;
  FLock     := TCriticalSection.Create;
  FNotEmpty := TEvent.Create(nil, False, False, '');
end;

destructor TCaptureQueue.Destroy;
begin
  FLock.Free;
  FNotEmpty.Free;
  inherited;
end;

procedure TCaptureQueue.Push(const Item: TCapturePacket);
begin
  FLock.Enter;
  try
    if FCount = Length(FItems) then
    begin
      FHead := (FHead + 1) mod Length(FItems);
      Dec(FCount);
    end;
    FItems[FTail] := Item;
    FTail  := (FTail + 1) mod Length(FItems);
    Inc(FCount);
  finally
    FLock.Leave;
  end;
  FNotEmpty.SetEvent;
end;

function TCaptureQueue.Pop(out Item: TCapturePacket;
  TimeoutMs: Cardinal): Boolean;
begin
  Result := False;
  if FNotEmpty.WaitFor(TimeoutMs) <> wrSignaled then
    Exit;
  FLock.Enter;
  try
    if FCount = 0 then
      Exit;
    Item  := FItems[FHead];
    FHead := (FHead + 1) mod Length(FItems);
    Dec(FCount);
    if FCount > 0 then
      FNotEmpty.SetEvent;
    Result := True;
  finally
    FLock.Leave;
  end;
end;

{ TCaptureThread }

constructor TCaptureThread.Create(AQueue: TCaptureQueue; AScaled: Integer);
begin
  inherited Create(True);
  FQueue   := AQueue;
  FScaled  := Max(AScaled, 1);
  FBitmapA := TBitmap.Create;
  FBitmapB := TBitmap.Create;
  FCurrent := 0;
  FreeOnTerminate := False;
  Priority := tpHigher;
end;

destructor TCaptureThread.Destroy;
begin
  FBitmapA.Free;
  FBitmapB.Free;
  inherited;
end;

function TCaptureThread.ActiveBmp: TBitmap;
begin
  if FCurrent = 0 then Result := FBitmapA else Result := FBitmapB;
end;

procedure TCaptureThread.BuildTileBounds(var Tiles: array of TTileInfo;
  W, H: Integer);
var
  TW, TH, Col, Row, Idx: Integer;
begin
  TW := W div TILE_COLS;
  TH := H div TILE_ROWS;
  for Row := 0 to TILE_ROWS - 1 do
    for Col := 0 to TILE_COLS - 1 do
    begin
      Idx := Row * TILE_COLS + Col;
      Tiles[Idx].Index  := Idx;
      Tiles[Idx].Bounds := Rect(Col * TW, Row * TH,
                                Col * TW + TW, Row * TH + TH);
      if Col = TILE_COLS - 1 then Tiles[Idx].Bounds.Right  := W;
      if Row = TILE_ROWS - 1 then Tiles[Idx].Bounds.Bottom := H;
      Tiles[Idx].Changed  := False;
      Tiles[Idx].Checksum := 0;
    end;
end;

procedure TCaptureThread.Execute;
var
  DC      : HDC;
  SW, SH  : Integer;
  ScW, ScH: Integer;
  Bmp     : TBitmap;
  Pkt     : TCapturePacket;
begin
  SW  := GetSystemMetrics(SM_CXSCREEN);
  SH  := GetSystemMetrics(SM_CYSCREEN);
  ScW := SW div FScaled;
  ScH := SH div FScaled;

  while not Terminated do
  begin
    Bmp := ActiveBmp;

    if (Bmp.Width <> ScW) or (Bmp.Height <> ScH) then
    begin
      Bmp.PixelFormat := pf32bit;
      Bmp.Width  := ScW;
      Bmp.Height := ScH;
    end;

    DC := GetDC(0);
    try
      SetStretchBltMode(Bmp.Canvas.Handle, HALFTONE);
      StretchBlt(Bmp.Canvas.Handle, 0, 0, ScW, ScH,
                 DC, 0, 0, SW, SH, SRCCOPY);
    finally
      ReleaseDC(0, DC);
    end;

    Pkt.Bitmap  := Bmp;
    Pkt.ScaledW := ScW;
    Pkt.ScaledH := ScH;
    BuildTileBounds(Pkt.Tiles, ScW, ScH);

    FQueue.Push(Pkt);

    FCurrent := 1 - FCurrent;
    Sleep(1);
  end;
end;

{ TDiffEncodeThread }

constructor TDiffEncodeThread.Create(AQueue: TCaptureQueue;
  AQuality: Integer; AOnDelta: TOnDelta);
var
  SI: GdiplusStartupInput;
begin
  inherited Create(True);
  FQueue    := AQueue;
  FQuality  := AQuality;
  FOnDelta  := AOnDelta;
  FillChar(FPrevChecksum, SizeOf(FPrevChecksum), 0);
  FreeOnTerminate := False;

  SI.GdiplusVersion           := 1;
  SI.DebugEventCallback       := nil;
  SI.SuppressBackgroundThread := False;
  SI.SuppressExternalCodecs   := False;
  GdiplusStartup(FGDIPToken, @SI, nil);
  GetEncoderClsid('image/jpeg', FJpgClsid);
end;

destructor TDiffEncodeThread.Destroy;
begin
  GdiplusShutdown(FGDIPToken);
  inherited;
end;

function TDiffEncodeThread.XorChecksumTile(ABmp: TBitmap;
  const R: TRect): TTileChecksum;
var
  Y    : Integer;
  X    : Integer;
  Row  : PCardinal;
  Acc  : Cardinal;
  PixW : Integer;
begin
  Acc  := 0;
  PixW := R.Right - R.Left;
  for Y := R.Top to R.Bottom - 1 do
  begin
    Row := PCardinal(ABmp.ScanLine[Y]);
    Inc(Row, R.Left);
    for X := 0 to PixW - 1 do
    begin
      Acc := Acc xor Row^;
      Acc := (Acc shl 1) or (Acc shr 31); // rotate left — diferencia posição
      Inc(Row);
    end;
  end;
  Result := Acc;
end;

procedure TDiffEncodeThread.EncodeTile(ABmp: TBitmap; const R: TRect;
  AStream: TMemoryStream; Quality: Integer);
var
  TileBmp       : TBitmap;
  NativeBitmap  : Pointer;
  EncoderParams : TEncoderParameters;
  QP            : Integer;
  GDIStream     : IStream;
  Status        : GpStatus;
begin
  TileBmp := TBitmap.Create;
  try
    TileBmp.PixelFormat := pf32bit;
    TileBmp.Width  := R.Right  - R.Left;
    TileBmp.Height := R.Bottom - R.Top;

    BitBlt(TileBmp.Canvas.Handle, 0, 0, TileBmp.Width, TileBmp.Height,
           ABmp.Canvas.Handle, R.Left, R.Top, SRCCOPY);

    Status := GdipCreateBitmapFromHBITMAP(TileBmp.Handle, 0, NativeBitmap);
    if Status <> Ok then
      raise Exception.CreateFmt('GdipCreateBitmapFromHBITMAP tile: %d',
                                 [Ord(Status)]);
    try
      QP := Quality;
      EncoderParams.Count := 1;
      EncoderParams.Parameter[0].Guid           := EncoderQuality;
      EncoderParams.Parameter[0].Type_          := EncoderParameterValueTypeLong;
      EncoderParams.Parameter[0].NumberOfValues := 1;
      EncoderParams.Parameter[0].Value          := @QP;

      GDIStream := TStreamAdapter.Create(AStream, soReference);
      Status := GdipSaveImageToStream(NativeBitmap, GDIStream,
                                      @FJpgClsid, @EncoderParams);
      if Status <> Ok then
        raise Exception.CreateFmt('GdipSaveImageToStream tile: %d',
                                   [Ord(Status)]);
    finally
      GdipDisposeImage(NativeBitmap);
    end;
  finally
    TileBmp.Free;
  end;
end;

procedure TDiffEncodeThread.Execute;
var
  Pkt       : TCapturePacket;
  Delta     : TDeltaPacket;
  CurrCk    : TTileChecksum;
  i         : Integer;
  AnyChange : Boolean;
  IdxCount  : Integer;
begin
  while not Terminated do
  begin
    if not FQueue.Pop(Pkt, 100) then
      Continue;

    AnyChange := False;
    IdxCount  := 0;
    Delta     := TDeltaPacket.Create;
    try
      Delta.ScaledW := Pkt.ScaledW;
      Delta.ScaledH := Pkt.ScaledH;
      Delta.Cols    := TILE_COLS;
      Delta.Rows    := TILE_ROWS;
      Delta.TileW   := Pkt.ScaledW div TILE_COLS;
      Delta.TileH   := Pkt.ScaledH div TILE_ROWS;

      SetLength(Delta.ChangedIdx, TILE_COUNT); //allocate maximum, then cut.

      for i := 0 to TILE_COUNT - 1 do
      begin
        CurrCk := XorChecksumTile(Pkt.Bitmap, Pkt.Tiles[i].Bounds);

        if CurrCk <> FPrevChecksum[i] then
        begin
          AnyChange           := True;
          FPrevChecksum[i]    := CurrCk;
          Delta.ChangedIdx[IdxCount] := i;
          Inc(IdxCount);
          EncodeTile(Pkt.Bitmap, Pkt.Tiles[i].Bounds,
                     Delta.Stream, FQuality);
        end;
      end;

      SetLength(Delta.ChangedIdx, IdxCount); //Ajust

      if AnyChange and Assigned(FOnDelta) then
        FOnDelta(Delta)
      else
        Delta.Free;
    except
      Delta.Free;
      raise;
    end;
  end;
end;

{ TScreenService }

class procedure TScreenService.Start(AScaled, AQuality: Integer;
  AOnDelta: TOnDelta);
begin
  Stop;
  FQueue         := TCaptureQueue.Create;
  FCaptureThread := TCaptureThread.Create(FQueue, AScaled);
  FDiffThread    := TDiffEncodeThread.Create(FQueue, AQuality, AOnDelta);
  FCaptureThread.Start;
  FDiffThread.Start;
end;

class procedure TScreenService.Stop;
begin
  if Assigned(FCaptureThread) then
  begin
    FCaptureThread.Terminate;
    FCaptureThread.WaitFor;
    FreeAndNil(FCaptureThread);
  end;
  if Assigned(FDiffThread) then
  begin
    FDiffThread.Terminate;
    FDiffThread.WaitFor;
    FreeAndNil(FDiffThread);
  end;
  FreeAndNil(FQueue);
end;

class procedure TScreenService.CaptureScreenToStream(AStream: TMemoryStream;
  Quality: Integer; AScaled: Integer; ACompareHash: Boolean);
var
  Bmp           : TBitmap;
  DC            : HDC;
  SW, SH        : Integer;
  ScW, ScH      : Integer;
  NativeBitmap  : Pointer;
  EncoderParams : TEncoderParameters;
  QP            : Integer;
  GDIStream     : IStream;
  Token         : ULONG_PTR;
  Clsid         : TGUID;
  SI            : GdiplusStartupInput;
  Status        : GpStatus;
begin
  if AScaled <= 0 then AScaled := 1;
  SW  := GetSystemMetrics(SM_CXSCREEN);
  SH  := GetSystemMetrics(SM_CYSCREEN);
  ScW := SW div AScaled;
  ScH := SH div AScaled;

  Bmp := TBitmap.Create;
  try
    Bmp.PixelFormat := pf32bit;
    Bmp.Width  := ScW;
    Bmp.Height := ScH;
    DC := GetDC(0);
    try
      SetStretchBltMode(Bmp.Canvas.Handle, COLORONCOLOR);
      StretchBlt(Bmp.Canvas.Handle, 0, 0, ScW, ScH,
                 DC, 0, 0, SW, SH, SRCCOPY);
    finally
      ReleaseDC(0, DC);
    end;

    SI.GdiplusVersion           := 1;
    SI.DebugEventCallback       := nil;
    SI.SuppressBackgroundThread := False;
    SI.SuppressExternalCodecs   := False;
    GdiplusStartup(Token, @SI, nil);
    try
      GetEncoderClsid('image/jpeg', Clsid);
      Status := GdipCreateBitmapFromHBITMAP(Bmp.Handle, 0, NativeBitmap);
      if Status <> Ok then
        raise Exception.CreateFmt('GdipCreateBitmapFromHBITMAP: %d',
                                   [Ord(Status)]);
      try
        QP := Quality;
        EncoderParams.Count := 1;
        EncoderParams.Parameter[0].Guid           := EncoderQuality;
        EncoderParams.Parameter[0].Type_          := EncoderParameterValueTypeLong;
        EncoderParams.Parameter[0].NumberOfValues := 1;
        EncoderParams.Parameter[0].Value          := @QP;
        GDIStream := TStreamAdapter.Create(AStream, soReference);
        Status := GdipSaveImageToStream(NativeBitmap, GDIStream,
                                        @Clsid, @EncoderParams);
        if Status <> Ok then
          raise Exception.CreateFmt('GdipSaveImageToStream: %d',
                                     [Ord(Status)]);
      finally
        GdipDisposeImage(NativeBitmap);
      end;
    finally
      GdiplusShutdown(Token);
    end;
  finally
    Bmp.Free;
  end;
end;

end.
