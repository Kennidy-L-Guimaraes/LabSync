unit Screen.Service;

interface
uses  Command.Parser, SysUtils, Windows, Dialogs, Command.Logs, System.IOUtils,
  Types, Vcl.Imaging.jpeg, Vcl.Graphics, Vcl.ExtCtrls, System.Classes, Math,
  Winapi.GDIPAPI, Winapi.GDIPOBJ, Winapi.GDIPUTIL, ActiveX, AxCtrls;
 type
   TScreenService = class
    public
     {Public Declarations}
     class var FScaledBmp : TBitmap;
     class var FJpg       : TJPEGImage;
     class var FLastHash  : Cardinal;
     class var FJpgClsid   : TGUID;      //PEG  GDI+
     class var FGDIPlusToken : ULONG_PTR; //token
     class procedure CaptureScreenToStream(AStream: TMemoryStream;
  Quality: Integer; AScaled: Integer = 1; ACompareHash: Boolean = False);
     class function HashBitmap(ABmp: TBitmap): Cardinal;
      class constructor Create;
      class destructor Destroy;
   end;

implementation

{ TScreenService }

class procedure TScreenService.CaptureScreenToStream(AStream: TMemoryStream;
  Quality: Integer; AScaled: Integer = 1; ACompareHash: Boolean = False);
var
  DC            : HDC;
  ScreenW       : Integer;
  ScreenH       : Integer;
  ScaledW       : Integer;
  ScaledH       : Integer;
  Hash          : Cardinal;
  EncoderParams : TEncoderParameters;
  QualityParam  : Integer;
  GDIStream     : IStream;
  NativeBitmap  : Pointer;
  Status        : GpStatus;
begin
  if AScaled <= 0 then AScaled := 1;
  ScreenW := GetSystemMetrics(SM_CXSCREEN);
  ScreenH := GetSystemMetrics(SM_CYSCREEN);
  ScaledW := ScreenW div AScaled;
  ScaledH := ScreenH div AScaled;

  if (FScaledBmp.Width <> ScaledW) or (FScaledBmp.Height <> ScaledH) then
  begin
    FScaledBmp.PixelFormat := pf32bit;
    FScaledBmp.Width       := ScaledW;
    FScaledBmp.Height      := ScaledH;
  end;

  //Print
  DC := GetDC(0);
  try
    SetStretchBltMode(FScaledBmp.Canvas.Handle, HALFTONE);
    StretchBlt(FScaledBmp.Canvas.Handle, 0, 0, ScaledW, ScaledH,
      DC, 0, 0, ScreenW, ScreenH, SRCCOPY);
  finally
    ReleaseDC(0, DC);
  end;

  // Hash
  if ACompareHash then
  begin
    Hash := HashBitmap(FScaledBmp);
    if Hash = FLastHash then
      Exit;
    FLastHash := Hash;
  end;

  //wrapper TGPBitmap
  Status := GdipCreateBitmapFromHBITMAP(FScaledBmp.Handle, 0, NativeBitmap);
  if Status <> Ok then
    raise Exception.CreateFmt('GdipCreateBitmapFromHBITMAP FAIL: %d', [Ord(Status)]);
  try
    QualityParam := Quality;
    EncoderParams.Count := 1;
    EncoderParams.Parameter[0].Guid           := EncoderQuality;
    EncoderParams.Parameter[0].Type_          := EncoderParameterValueTypeLong;
    EncoderParams.Parameter[0].NumberOfValues := 1;
    EncoderParams.Parameter[0].Value          := @QualityParam;

    GDIStream := TStreamAdapter.Create(AStream, soReference);

    Status := GdipSaveImageToStream(
      NativeBitmap,
      GDIStream,
      @FJpgClsid,
      @EncoderParams
    );
    if Status <> Ok then
      raise Exception.CreateFmt('GdipSaveImageToStream FAIL: %d', [Ord(Status)]);
  finally
    GdipDisposeImage(NativeBitmap);  //Free bitmap GDI+
  end;
end;

class constructor TScreenService.Create;
var
  StartInput : GdiplusStartupInput;
begin
  FScaledBmp := TBitmap.Create;
  FJpg       := TJPEGImage.Create;
  FLastHash  := 0;

  //GDI+
  StartInput.GdiplusVersion           := 1;
  StartInput.DebugEventCallback       := nil;
  StartInput.SuppressBackgroundThread := False;
  StartInput.SuppressExternalCodecs   := False;
  GdiplusStartup(FGDIPlusToken, @StartInput, nil);
  GetEncoderClsid('image/jpeg', FJpgClsid);
end;

class destructor TScreenService.Destroy;
begin
  FScaledBmp.Free;
  FJpg.Free;
  GdiplusShutdown(FGDIPlusToken);
  inherited;
end;

class function TScreenService.HashBitmap(ABmp: TBitmap): Cardinal;
var
  Row : PByteArray;
  Y   : Integer;
  X   : Integer;
  hash: Cardinal;
begin
  hash := 5381;
  for Y := 0 to ABmp.Height - 1 do
  begin
    Row := ABmp.ScanLine[Y];
    for X := 0 to (ABmp.Width * 3) - 1 do  //pf24bit = 3 bytes p/ pixel
      hash := ((hash shl 5) + hash) + Row[X];        //djb2 hash
  end;
  Result := hash;
end;

end.
