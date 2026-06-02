unit Server.Controller;

interface
uses Config.Service, ID.Service, ServerConfig.Service, SysUtils, DateUtils, Classes;
type
 TServerControll = class
  private
   {Private Declarations}
    FConfig       : TConfig;
    FServerConfig : TServerConfig;
    FID     : TID;
  public
   {Public Declarations}
    function GetID      : string;
    function GetDate    : string;
    function GetServer  : string;
    function GetPort    : string;
    function GetVersion : string;

    procedure InitializeIfNeeded;
    constructor Create;
    destructor Destroy;
 end;

implementation

{ TServerControll }

constructor TServerControll.Create;
begin
  FID := TID.Create;
  FConfig := TConfig.Create;
  FServerConfig := TserverConfig.Create;
end;

destructor TServerControll.Destroy;
begin
  FID.Free;
  FConfig.Free;
  FServerConfig.Free;
  inherited Destroy;
end;

function TServerControll.GetDate: string;
begin
 Result := FormatDateTime('yyyy/mm/dd', Now)
end;

function TServerControll.GetID: string;
begin
  Result := FID.GetID;
end;

function TServerControll.GetPort: string;
begin
  Result := FServerConfig.GetPortOption('Port');
end;

function TServerControll.GetServer: string;
begin
  Result := FServerConfig.GetServerOption('Server');
end;

function TServerControll.GetVersion: string;
begin
 Result := FID.getVersion;
end;

procedure TServerControll.InitializeIfNeeded;
begin
  FConfig.Initialize;
  FServerConfig.Initialize;
  if FConfig.AlreadyStarted = False then
   begin
    FServerConfig.SetServerOption('Server', 'https://company.com');
    FServerConfig.SetPortOption('Port', ':5555'); //Default
   end;
   exit;
end;

end.
