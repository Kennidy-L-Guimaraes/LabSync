unit ServerConfig.Service;

interface

uses System.Classes, System.SysUtils, System.IOUtils, Winapi.ShlObj, Path.Service;
type
 TServerConfig = class
   private
    {Private Declarations}
    FFilePath: string;
    function GetPathConfig: string;
    function LoadFile: TStringList;
    procedure SaveFile(const SL: TStringList);
   public
    {Public Declarations}
    constructor Create;
    procedure Initialize;
    function  GetServerOption(const Key: string): string;
    procedure SetServerOption(const Key, value: string);
 end;

implementation

{ TServerConfig }

constructor TServerConfig.Create;
begin
  FFilePath := GetPathConfig;
end;

function TServerConfig.GetPathConfig: string;
var
  BasePath: string;
begin
   BasePath := TPathService.PathLabSync('Machine');
   ForceDirectories(BasePath);
   Result := TPath.Combine(BasePath, 'LabSync-HostNode.config');
end;

function TServerConfig.GetServerOption(const Key: string): string;
var
  SL: TStringList;
begin
  SL := LoadFile;
  try
    Result := SL.Values[Key];
  finally
    SL.Free;
  end;
end;

procedure TServerConfig.Initialize;
 var
  SL: TStringList;
begin
  if FileExists(FFilePath) then
    Exit;
  SL := TStringList.Create;
  try
    SL.Values['Server'] := 'https://company.com:5555';
    SaveFile(SL);
  finally
    SL.Free;
  end;
end;

function TServerConfig.LoadFile: TStringList;
begin
  Result := TStringList.Create;
  if FileExists(FFilePath) then
    Result.LoadFromFile(FFilePath);
end;

procedure TServerConfig.SaveFile(const SL: TStringList);
begin
 SL.SaveToFile(FFilePath);
end;

procedure TServerConfig.SetServerOption(const Key, value: string);
var
  SL: TStringList;
begin
  SL := LoadFile;
  try
   SL.Values[Key] := value;
   SaveFile(SL);
  finally
  SL.Free;
  end;
end;

end.
