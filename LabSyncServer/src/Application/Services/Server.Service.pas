unit Server.Service;
interface
uses
  IdTCPServer,
  IdContext, Classes, Windows, types, System.IOUtils, System.SysUtils, dialogs,
  AgentCard.Manager, AgentInfo.Service, Vcl.Forms;
 type
  TServerService = class
    private
     {Private Declarations}
     FServer : TIdTCPServer;
     procedure ServerExecute(AContext: TIdContext);
     procedure ServerDisconnect(AContext: TIdContext);
    public
     {Public Declarations}
     var
     AgentCardManager : TAgentCardManager;
     constructor Create;
     destructor Destroy; override;
     procedure Start(const Aport: integer);
     function  IsTheServerActive: string;
     procedure Stop;
     procedure DestroySocket;
     procedure CreateSocket;
     function PingPongMessage(AContext: TIdContext; const Msg: string): string; //test remove it later
  end;

implementation
uses Server.Controller;

{ TServerControll }

constructor TServerService.Create;
begin
   inherited;
   CreateSocket;
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

function TServerService.IsTheServerActive: string;
begin
 If FServer.Active = true then
 begin
  Result := 'Active';
 end
 else
 Result := 'Inactive';
end;


function TServerService.PingPongMessage(AContext: TIdContext;
  const Msg: string): string;
begin
   AContext.Connection.IOHandler.WriteLn('Trying to connect to: ');
   Result := Msg;
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
  Msg: string;
  Parts: TArray<string>;
  AgentID: string;
  AgentIP: string;
  Agent: TAgentInfo;
begin
  Msg := AContext.Connection.IOHandler.ReadLn;
  Parts := Msg.Split(['|']);
  if (Length(Parts) = 3) and (Parts[0] = 'REGISTER') then
  begin
    AgentID := Parts[1];
    AgentIP := Parts[2];
    Agent := TAgentInfo.Create;
    Agent.ID := AgentID;
    Agent.IP := AgentIP;
    AContext.Data := Agent;
    AContext.Connection.IOHandler.WriteLn('True');
    TThread.Queue(nil,
      procedure
      begin
       AgentCardManager.RegisterAgent(AgentID, AgentIP);
      end);

  end;
end;

procedure TServerService.Start(const Aport: integer);
begin
   if not Assigned(FServer) then
    CreateSocket;
  if not FServer.Active then
  begin
    FServer.DefaultPort := Aport;
    FServer.Active      := True;
  end;
end;

procedure TServerService.Stop;
begin
 if not Assigned(FServer) or not FServer.Active then
    Exit;
  FServer.Active := False;
  Application.ProcessMessages;
end;

end.
