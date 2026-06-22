unit ServerConfig.Service;

interface

uses System.Classes, System.SysUtils, System.IOUtils, Winapi.ShlObj, Path.Service,
  Command.Logs, ID.Service;
type
 TServerConfig = class
   private
    {Private Declarations}
    FFilePath: string;
    FLog      : Tlog;
    FID       : TID;
    function GetPathConfig: string;
    function LoadFile: TStringList;
    procedure SaveFile(const SL: TStringList);
   public
    {Public Declarations}
    constructor Create;
    destructor Destroy;
    procedure Initialize;
    function  GetServerOption(const Server: string): string;
    procedure SetServerOption(const Server, ServerValue: string);
    function  GetPortOption(const Port: string): string;
    procedure SetPortOption(const Port, PortValue: string);
 end;

implementation

{ TServerConfig }

constructor TServerConfig.Create;
begin
  FFilePath := GetPathConfig;
  FLog       := TLog.Create;
  FID        := TID.Create;
end;

destructor TServerConfig.Destroy;
begin
 Flog.Free;
 FId.Free;
 inherited;
end;

function TServerConfig.GetPathConfig: string;
var
  BasePath: string;
begin
   BasePath := TPathService.PathLabSync('Server');
   ForceDirectories(BasePath);
   Result := TPath.Combine(BasePath, 'LabSync-Server.config');
end;

function TServerConfig.GetPortOption(const Port: string): string;
var
  SL: TStringList;
begin
  SL := LoadFile;
  try
    Result := SL.Values[Port];
  finally
    SL.Free;
  end;
end;

function TServerConfig.GetServerOption(const Server: string): string;
var
  SL: TStringList;
begin
  SL := LoadFile;
  try
    Result := SL.Values[Server];
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
    SL.Values['Server'] := '127.0.0.1';
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

procedure TServerConfig.SetPortOption(const Port, PortValue: string);
var
  SL       : TStringList;
  TimeStamp: string;
  StartTime: TDateTime;
  Config   : string;
begin
  StartTime := now;
  SL        := LoadFile;
  Config    := ('New Port: '+ PortValue);
  try
   SL.Values[Port] := PortValue;
   SaveFile(SL);
   TimeStamp   := FormatDateTime('yyyymmdd_hhnnss', Now);
   Flog.ConfigLog(TimeStamp, FID.GetID, Config); //Make a good log :)
  finally
  end;
end;

procedure TServerConfig.SetServerOption(const Server, ServerValue: string);
var
  SL       : TStringList;
  TimeStamp: string;
  StartTime: TDateTime;
  Config   : string;
begin
  StartTime := now;
  FID        := TID.Create;
  SL        := LoadFile;
  Config    := ('New Server: '+ ServerValue);
  try
   SL.Values[Server] := ServerValue;
   SaveFile(SL);
   TimeStamp   := FormatDateTime('yyyymmdd_hhnnss', Now);
   Flog.ConfigLog(TimeStamp, FID.GetID, Config);
  finally
  end;
end;

end.
