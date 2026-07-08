unit Server.Service;
interface
uses
  IdTCPServer,
  IdContext, Classes, Windows, types, System.IOUtils, System.SysUtils, dialogs,
  AgentCard.Manager, AgentInfo.Service, Vcl.Forms, ApplicationMode.types, DateUtils,
  Command.Logs, IDHttp, Winapi.IpHlpApi, Winapi.IpTypes, Winapi.Winsock2,  ActiveX,
  ComObj, NETWORKLIST_TLB;
 type
  TServerService = class
    private
     {Private Declarations}
     FServer : TIdTCPServer;
     FLog    : Tlog;
     procedure ServerExecute(AContext: TIdContext);
     procedure ServerDisconnect(AContext: TIdContext);
    public
     {Public Declarations}
     var
     AgentCardManager : TAgentCardManager;
     {CONSTRUCTOR / DESTRUCTOR}
     constructor Create;
     destructor  Destroy; override;

     {PROCEDURES}
     procedure   Start(const Aport: integer);
     procedure   Stop;
     procedure   DestroySocket;
     procedure   CreateSocket;

     {FUNCTIONS}
     function    IsTheServerActive: string;
     function    GetConnectionType: string;
     function    GetConnectionName: string; 
     function    HasInternetConnection: Boolean;
  end;

implementation
uses Server.Controller;

{ TServerControll }

constructor TServerService.Create;
begin
   inherited;
   CreateSocket;
   Flog := Tlog.Create(amServer);
end;

procedure TServerService.CreateSocket;
begin
  FServer := TIdTCPServer.Create(nil);
  FServer.OnExecute    := ServerExecute;
  FServer.OnDisconnect := ServerDisconnect;
end;

destructor TServerService.Destroy;
begin
  DestroySocket;
  inherited;
end;

procedure TServerService.DestroySocket;
begin
  FreeAndNil(FServer);
  FreeAndNil(AgentCardManager);
end;

function TServerService.GetConnectionName: string;
var
  NetworkListManager: INetworkListManager;
  Connections: IEnumNetworkConnections;
  Connection: INetworkConnection;
  Fetched: LongWord;
begin
  Result := '';

  CoInitialize(nil);
  try
    NetworkListManager := CoNetworkListManager.Create;

    Connections := NetworkListManager.GetNetworkConnections;

    Fetched := 0;

    while True do
    begin
      Connection := nil;

      Connections.Next(1, Connection, Fetched);

      if Fetched = 0 then
        Break;

      if Connection.IsConnected then
      begin
        Result := Connection.GetNetwork.GetName;
        Exit;
      end;
    end;

  finally
    CoUninitialize;
  end;
end;

function TServerService.GetConnectionType: string;
var
  Buffer: PIP_ADAPTER_ADDRESSES;
  Size: ULONG;
  Adapter: PIP_ADAPTER_ADDRESSES;
begin
  Result := '';

  Size := 0;
  GetAdaptersAddresses(AF_UNSPEC, GAA_FLAG_INCLUDE_PREFIX, nil, nil, @Size);

  GetMem(Buffer, Size);
  try
    if GetAdaptersAddresses(AF_UNSPEC, GAA_FLAG_INCLUDE_PREFIX, nil, Buffer, @Size) = ERROR_SUCCESS then
    begin
      Adapter := Buffer;

      while Adapter <> nil do
      begin
        if (Adapter.OperStatus = IfOperStatusUp) and
           (Adapter.FirstUnicastAddress <> nil) then
        begin
          Result := Adapter.FriendlyName;
          Exit;
        end;

        Adapter := Adapter.Next;
      end;
    end;
  finally
    FreeMem(Buffer);
  end;
end;

function TServerService.HasInternetConnection: Boolean;
var
  HTTP: TIdHTTP;
begin
  Result := False;

  HTTP := TIdHTTP.Create(nil);
  try
    HTTP.ConnectTimeout := 2000;
    HTTP.ReadTimeout := 2000;

    try
      HTTP.Head('http://clients3.google.com/generate_204');
      Result := True;
    except
      Result := False;
    end;

  finally
    HTTP.Free;
  end;
end;

function TServerService.IsTheServerActive: string;
begin
 If FServer.Active = true then
 begin
  Result := 'Active';
 end
 else
 Result := 'Inactive';
end;

procedure TServerService.ServerDisconnect(AContext: TIdContext);
var
  Agent: TAgentInfo;
  AgentID: string;
  LocalManager: TAgentCardManager;
begin
  Agent := TAgentInfo(AContext.Data);
  if Assigned(Agent) then
  begin
    AgentID := Agent.ID;
    Agent.Free;
    AContext.Data := nil;
    LocalManager := AgentCardManager;
    TThread.Queue(nil,
      procedure
      begin
        if Assigned(LocalManager) then
          LocalManager.RemoveAgent(AgentID);
      end);
  end;
end;

procedure TServerService.ServerExecute(AContext: TIdContext);
var
  Msg         : string;
  Parts       : TArray<string>;
  AgentID     : string;
  AgentIP     : string;
  MachineUser : string;
  Agent       : TAgentInfo;
begin
  Msg := AContext.Connection.IOHandler.ReadLn;
  if SameText(Msg, 'PING') then
   begin
    AContext.Connection.IOHandler.WriteLn('PONG');
    Exit;
   end;
  Parts := Msg.Split(['|']);
  if (Length(Parts) = 4) and (Parts[0] = 'REGISTER') then
  begin
    AgentID     := Parts[1];
    AgentIP     := Parts[2];
    MachineUser := Parts[3];
    Agent       := TAgentInfo.Create;
    Agent.ID    := AgentID;
    Agent.IP    := AgentIP;
    AContext.Data := Agent;
    AContext.Connection.IOHandler.WriteLn('True');
    TThread.Queue(nil,
      procedure
      begin
       AgentCardManager.RegisterAgent(AgentID, MachineUser, AgentIP);
      end);

  end;
end;

procedure TServerService.Start(const Aport: integer);
var
 TimeStamp: string;
 Controller: TServerControll;
begin
 if not Assigned(FServer) then
    CreateSocket;
 try
  Controller := TServerControll.Create;
 try
  Timestamp      := FormatDateTime('yyyymmdd_hhnnss', Now);
  if not FServer.Active then
  begin
    FServer.DefaultPort := Aport;
    FServer.Active      := True;
  end;
  Flog.ServerStatus(ssOnline, TimeStamp, Controller.GetID, Controller.GetVersion, Controller.GetIp, 'ACTIVE');
 except on E: exception do
  Flog.ServerStatus(ssOffline, TimeStamp, Controller.GetID, Controller.GetVersion, Controller.GetIp, E.Message);
 end;
 finally
 Controller.Free;
 end;
end;

procedure TServerService.Stop;
var
 TimeStamp: string;
 Controller: TServerControll;
begin
 if not Assigned(FServer) or not FServer.Active then
    Exit;
 try
  Controller := TServerControll.Create;
 try
  Timestamp      := FormatDateTime('yyyymmdd_hhnnss', Now);
  FServer.Active := False;
  Application.ProcessMessages;
  Flog.ServerStatus(ssOffline, TimeStamp, Controller.GetID, Controller.GetVersion, Controller.GetIp, 'INACTIVE');
 except on E: exception do
  Flog.ServerStatus(ssOffline, TimeStamp, Controller.GetID, Controller.GetVersion, Controller.GetIp, E.Message);
 end;
 finally
 Controller.Free;
 end;
end;

end.
