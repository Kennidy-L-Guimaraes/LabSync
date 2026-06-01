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

    function LoadFile: TStringList;
    procedure SaveFile(const SL: TStringList);
  public
    constructor Create;
    procedure Initialize;
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
   BasePath := TPathService.PathLabSync('Server');
   ForceDirectories(BasePath);
   Result := TPath.Combine(BasePath, 'LabSyncServer.config');
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
