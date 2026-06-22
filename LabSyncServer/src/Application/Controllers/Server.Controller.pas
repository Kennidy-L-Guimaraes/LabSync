unit Server.Controller;

interface
uses Config.Service, ID.Service, ServerConfig.Service, SysUtils, DateUtils, Classes,
  LocalIP.Service, Server.Service, AgentCard.Manager, Vcl.Graphics, Vcl.Forms;
type
 TServerControll = class
  private
   {Private Declarations}
    FConfig       : TConfig;
    FServerConfig : TServerConfig;
    FID           : TID;
    IPService     : TLocalIPService;
    FServer       : TServerService;
    FAgentCardManager : TAgentCardManager;
  public
   {Public Declarations}
    function GetID      : string;
    function GetDate    : string;
    function GetServer  : string;
    function GetPort    : string;
    function GetVersion : string;
    function GetIp      : string;

    procedure ConnectServer;
    procedure DisconnectServer;
    function IsTheServerActive: string;
    procedure InitializeIfNeeded;
    constructor Create(AOwner: TComponent; AContainer: TScrollBox; APicture: TPicture);
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

constructor TServerControll.Create(AOwner: TComponent; AContainer: TScrollBox; APicture: TPicture);
begin
  FID           := TID.Create;
  FConfig       := TConfig.Create;
  IPService     := TLocalIPService.Create;
  FServerConfig := TserverConfig.Create;
  FServer       := TServerService.Create;
  FAgentCardManager := TAgentCardManager.Create(AOwner, AContainer, APicture);
end;

destructor TServerControll.Destroy;
begin
  FID.Free;
  FConfig.Free;
  FServerConfig.Free;
  IPService.Free;
  FServer.Free;
  inherited Destroy;
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
   end;
   exit;
end;

function TServerControll.IsTheServerActive: string;
begin
 Result := FServer.IsTheServerActive;
end;


end.
