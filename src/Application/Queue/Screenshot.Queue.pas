unit Screenshot.Queue;

interface
uses
  System.SyncObjs,
  System.Generics.Collections,
  System.SysUtils,
  System.Classes;

type
  TScreenshotStreamQueue = class
  private
    class var FQueue    : TQueue<TMemoryStream>;
    class var FLock     : TCriticalSection;
    class var FMaxItems : Integer;
    class var FHighPressure: Boolean;
  public
    class constructor Create;
    class destructor  Destroy;
    class procedure Enqueue(AStream: TMemoryStream);
    class function  Dequeue(out AStream: TMemoryStream): Boolean;
    class function  Count: Integer;
    class procedure TrimIfNeeded;
    class property  MaxItems: Integer read FMaxItems write FMaxItems;
    class function  IsUnderPressure: Boolean;
  end;

implementation

class constructor TScreenshotStreamQueue.Create;
begin
  FQueue    := TQueue<TMemoryStream>.Create;
  FLock     := TCriticalSection.Create;
  FMaxItems := 3;
end;

class destructor TScreenshotStreamQueue.Destroy;
begin
  while FQueue.Count > 0 do
    FQueue.Dequeue.Free;
  FQueue.Free;
  FLock.Free;
end;

class procedure TScreenshotStreamQueue.Enqueue(AStream: TMemoryStream);
begin
  FLock.Enter;
  try
    FQueue.Enqueue(AStream);

    //Detects pressure before removal from the list.
    FHighPressure := FQueue.Count >= FMaxItems;

    TrimIfNeeded;
  finally
    FLock.Leave;
  end;
end;

class function TScreenshotStreamQueue.IsUnderPressure: Boolean;
begin
  FLock.Enter;
  try
    Result := FHighPressure;
  finally
    FLock.Leave;
  end;
end;

class function TScreenshotStreamQueue.Dequeue(out AStream: TMemoryStream): Boolean;
begin
  Result := False;
  FLock.Enter;
  try
    if FQueue.Count > 0 then
    begin
      AStream := FQueue.Dequeue;
      Result  := True;
    end;
  finally
    FLock.Leave;
  end;
end;

class function TScreenshotStreamQueue.Count: Integer;
begin
  FLock.Enter;
  try
    Result := FQueue.Count;
  finally
    FLock.Leave;
  end;
end;

class procedure TScreenshotStreamQueue.TrimIfNeeded;
begin
  while FQueue.Count > FMaxItems do
    FQueue.Dequeue.Free;
end;

end.
