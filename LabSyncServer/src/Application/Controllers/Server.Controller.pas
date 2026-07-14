unit Server.Controller;

interface
uses Config.Service, ID.Service, ServerConfig.Service, SysUtils, DateUtils, Classes,
  LocalIP.Service, Server.Service, AgentCard.Manager, Vcl.Graphics, Vcl.Forms,
  Command.Logs, ApplicationMode.types, dialogs;

type
  TTargetChangedEvent = procedure(Sender: TObject) of object;
type
 TServerControll = class
  private
   {Private Declarations}
    FOnTargetChanged: TTargetChangedEvent;
    FConfig       : TConfig;
    FServerConfig : TServerConfig;
    FID           : TID;
    IPService     : TLocalIPService;
    FServer       : TServerService;
    FLog          : Tlog;
    FAgentCardManager : TAgentCardManager;
  public
   {Public Declarations}
   property  OnTargetChanged: TTargetChangedEvent read FOnTargetChanged write FOnTargetChanged;
   procedure AgentSelected(Sender: TObject);
    {FUNCTION GET}
    function GetID      : string;
    function GetDate    : string;
    function GetServer  : string;
    function GetPort    : string;
    function GetVersion : string;
    function GetIp      : string;
    function GetLog     : string;
    function GetConnectionType: string;
    function GetConnectionName: string;
    function GetTarget:string;

    //
    function  IsTheServerActive: boolean;
    function  HasInternetConnection: string;
    procedure SendCommand(const Target, Command, Value: string);
    function  TargetVerification(const Target: string): boolean;

    {PROCEDURE SET}
    procedure SetServer(Const Value: string);
    procedure SetPort(Const Value: string);

    //
    procedure ConnectServer;
    procedure DisconnectServer;
    procedure InitializeIfNeeded;
    procedure CreateComponents(AOwner: TComponent; AContainer: TScrollBox; APicture: TPicture);
    constructor Create;
    destructor Destroy;
 end;

implementation

{ TServerControll }

uses Principal.Views;

procedure TServerControll.AgentSelected(Sender: TObject);
begin
 if Assigned(FOnTargetChanged) then
    FOnTargetChanged(Self);
end;

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
  FAgentCardManager.OnAgentSelected := AgentSelected;
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

function TServerControll.GetTarget: string;
begin
 Result := FAgentCardManager.AgentInfoDto.AgentID;
end;

function TServerControll.GetConnectionName: string;
begin
 Result := FServer.GetConnectionName;
end;

function TServerControll.GetConnectionType: string;
begin
 Result := FServer.GetConnectionType;
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

function TServerControll.HasInternetConnection: string;
begin
  if FServer.HasInternetConnection = True then
   Result := 'Connected'
   else
   Result := 'Disconnected';
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


procedure TServerControll.SendCommand(const Target, Command, Value: string);
begin
  if TargetVerification(Target) = True then
  Showmessage(' Target: '+Target + ' Command: ' + Command + 'Value: ' + Value);
end;

procedure TServerControll.SetPort(const Value: string);
begin
  FServerConfig.SetPortOption('Port', Value);
end;

procedure TServerControll.SetServer(const Value: string);
begin
  FServerConfig.SetServerOption('Server', Value);
end;

function TServerControll.TargetVerification(const Target: string): boolean;
begin
  if sameText(Target, '') then
  Result := False
  else
  Result := True;
end;

end.
