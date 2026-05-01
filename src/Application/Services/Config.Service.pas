unit Config.Service;

interface
uses
  System.Classes, System.SysUtils, System.IOUtils, Winapi.ShlObj, Path.Service;

type
  TOptionState = (osEnabled, osDisabled);

  TConfig = class
  private
    FFilePath: string;
    function GetPathConfig: string;
    function OptionStateToStr(Value: TOptionState): string;
    function StrToOptionState(const Value: string): TOptionState;

    function LoadFile: TStringList;
    procedure SaveFile(const SL: TStringList);
  public
    constructor Create;
    procedure Initialize;
    procedure SetOption(const Key: string; Value: TOptionState);
    function  GetOption(const Key: string): TOptionState;
    function  GetOptionAsDisplay(const Key: string): string;

    function  AlreadyStarted: Boolean;
    procedure SetStarted(Value: Boolean);
  end;

implementation

{ TConfig }

constructor TConfig.Create;
begin
  FFilePath := GetPathConfig;
end;

function TConfig.GetPathConfig: string;
var
  BasePath: string;
begin
  BasePath := TPathService.PathLabSync('Machine');
   ForceDirectories(BasePath);
   Result := TPath.Combine(BasePath, 'LabSync.config');
end;

procedure TConfig.Initialize;
var
  SL: TStringList;
begin
  if FileExists(FFilePath) then
    Exit;

  SL := TStringList.Create;
  try
    SL.Values['Started'] := 'False';
    SaveFile(SL);
  finally
    SL.Free;
  end;
end;

function TConfig.OptionStateToStr(Value: TOptionState): string;
begin
  case Value of
    osEnabled  : Result := 'Enabled';
    osDisabled : Result := 'Disabled';
  end;
end;

function TConfig.StrToOptionState(const Value: string): TOptionState;
begin
  if SameText(Value, 'Enabled') then
    Result := osEnabled
  else
    Result := osDisabled;
end;

function TConfig.LoadFile: TStringList;
begin
  Result := TStringList.Create;

  if FileExists(FFilePath) then
    Result.LoadFromFile(FFilePath);
end;

procedure TConfig.SaveFile(const SL: TStringList);
begin
  SL.SaveToFile(FFilePath);
end;

procedure TConfig.SetOption(const Key: string; Value: TOptionState);
var
  SL: TStringList;
begin
  SL := LoadFile;
  try
    SL.Values[Key] := OptionStateToStr(Value);
    SaveFile(SL);
  finally
    SL.Free;
  end;
end;

function TConfig.GetOption(const Key: string): TOptionState;
var
  SL: TStringList;
begin
  SL := LoadFile;
  try
    Result := StrToOptionState(SL.Values[Key]);
  finally
    SL.Free;
  end;
end;

function TConfig.GetOptionAsDisplay(const Key: string): string;
begin
  case GetOption(Key) of
    osEnabled  : Result := 'Enabled';
    osDisabled : Result := 'Disabled';
  end;
end;

function TConfig.AlreadyStarted: Boolean;
var
  SL: TStringList;
begin
  SL := LoadFile;
  try
    Result := SameText(SL.Values['Started'], 'True');
  finally
    SL.Free;
  end;
end;

procedure TConfig.SetStarted(Value: Boolean);
var
  SL: TStringList;
begin
  SL := LoadFile;
  try
    if Value then
      SL.Values['Started'] := 'True'
    else
      SL.Values['Started'] := 'False';
    SaveFile(SL);
  finally
    SL.Free;
  end;
end;
end.
