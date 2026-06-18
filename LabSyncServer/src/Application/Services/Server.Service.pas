unit Server.Service;
interface
uses
  IdTCPServer,
  IdContext, Classes, Windows, types, System.IOUtils, System.SysUtils, dialogs,
  AgentCard.Manager;
 type
  TServerService = class
    private
     {Private Declarations}
     FServer : TIdTCPServer;
     procedure ServerExecute(AContext: TIdContext);
    public
     {Public Declarations}
     var
     AgentCardManager : TAgentCardManager;
     constructor Create;
     destructor Destroy;
     procedure Start(const Aport: integer);
     function  IsTheServerActive: string;
     procedure Stop;

     function PingPongMessage(AContext: TIdContext; const Msg: string): string; //test remove it later
  end;

implementation
uses Server.Controller;

{ TServerControll }

constructor TServerService.Create;
begin
   inherited;
   FServer := TIdTCPServer.Create(nil);
   FServer.OnExecute := ServerExecute;
end;

destructor TServerService.Destroy;
begin
 FServer.Free;
 AgentCardManager.Free;
 inherited;
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

procedure TServerService.ServerExecute(AContext: TIdContext);
var
  Msg: string;
  Parts: TArray<string>;
  AgentID: string;
  AgentIP: string;
begin
  Msg := AContext.Connection.IOHandler.ReadLn;
  Parts := Msg.Split(['|']);

  if (Length(Parts) = 3) and (Parts[0] = 'REGISTER') then
  begin
    AgentID := Parts[1];
    AgentIP := Parts[2];
    AContext.Connection.IOHandler.WriteLn('REGISTER_OK');
    TThread.Queue(nil,
      procedure
      begin
       AgentCardManager.RegisterAgent(AgentID, AgentIP);
      end);
  end;
end;

procedure TServerService.Start(const Aport: integer);
begin
 FServer.DefaultPort := Aport;
 FServer.Active      := True;
end;

procedure TServerService.Stop;
begin
  FServer.Active := False;
end;

end.
