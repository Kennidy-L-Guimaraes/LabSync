unit Server.Controller;

interface
uses Config.Service, ID.Service, ServerConfig.Service, SysUtils, DateUtils, Classes,
  LocalIP.Service, Server.Service, AgentCard.Manager, Vcl.Graphics, Vcl.Forms,
  Command.Logs, ApplicationMode.types;
type
 TServerControll = class
  private
   {Private Declarations}
    FConfig       : TConfig;
    FServerConfig : TServerConfig;
    FID           : TID;
    IPService     : TLocalIPService;
    FServer       : TServerService;
    FLog          : Tlog;
    FAgentCardManager : TAgentCardManager;
  public
   {Public Declarations}
    {FUNCTION GET}
    function GetID      : string;
    function GetDate    : string;
    function GetServer  : string;
    function GetPort    : string;
    function GetVersion : string;
    function GetIp      : string;
    function GetLog     : string;

    {PROCEDURE SET}
    procedure SetServer(Const Value: string);
    procedure SetPort(Const Value: string);

    procedure ConnectServer;
    procedure DisconnectServer;
    function IsTheServerActive: boolean;
    procedure InitializeIfNeeded;
    procedure CreateComponents(AOwner: TComponent; AContainer: TScrollBox; APicture: TPicture);
    constructor Create;
    destructor Destroy;
 end;

implementation

{ TServerControll }

uses Principal.Views;

procedure TServerControll.ConnectServer;
begin
 FServer.Start(StrToInt(GetPort));
 FServer.AgentCardManager := FAgentCardManager;
end;

constructor TServerControll.Create;
begin
  FID           := TID.Create;
  FLog          := Tlog.Create(amServer);
  FConfig       := TConfig.Create;
  IPService     := TLocalIPService.Create;
  FServerConfig := TserverConfig.Create;
  FServer       := TServerService.Create;
end;

procedure TServerControll.CreateComponents(AOwner: TComponent;
  AContainer: TScrollBox; APicture: TPicture);
begin
  FAgentCardManager := TAgentCardManager.Create(AOwner, AContainer, APicture);
end;

destructor TServerControll.Destroy;
begin
  inherited Destroy;
  FID.Free;
  FLog.Free;
  FConfig.Free;
  FServerConfig.Free;
  IPService.Free;
  FServer.Free;
end;

procedure TServerControll.DisconnectServer;
begin
  Fserver.Stop;
end;

function TServerControll.GetDate: string;
begin
 Result := FormatDateTime('yyyy/mm/dd', Now)
end;

function TServerControll.GetID: string;
begin
  Result := FID.GetID;
end;

function TServerControll.GetIp: string;
begin
 Result := IPService.GetServerIp;
end;

function TServerControll.GetLog: string;
var
 Content : string;
begin
  Content := FLog.ReadLogs('Audit.log');
  if Content = '' then
    Exit;
   Result := Content;
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
    FServerConfig.SetServerOption('Server', '127.0.0.1');
    FServerConfig.SetPortOption('Port', '5555'); //Default
    FConfig.SetStarted(True);
   end
   else
   exit;
end;

function TServerControll.IsTheServerActive: boolean;
begin
 if FServer.IsTheServerActive = 'Active' then
  Result := True
 else
  Result := False;
end;


procedure TServerControll.SetPort(const Value: string);
begin
  FServerConfig.SetPortOption('Port', Value);
end;

procedure TServerControll.SetServer(const Value: string);
begin
  FServerConfig.SetServerOption('Server', Value);
end;

end.
