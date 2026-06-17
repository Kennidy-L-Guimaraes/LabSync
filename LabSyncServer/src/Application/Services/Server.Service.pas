unit Server.Service;
interface
uses
  IdTCPServer,
  IdContext, Classes, Windows, types, System.IOUtils, System.SysUtils, dialogs;
 type
  TServerService = class
    private
     {Private Declarations}
     FServer : TIdTCPServer;
     procedure ServerExecute(AContext: TIdContext);
    public
     {Public Declarations}
     constructor Create;
     destructor Destroy;
     procedure Start(const Aport: integer);
     function  IsTheServerActive: string;
     procedure Stop;

     function PingPongMessage(AContext: TIdContext; const Msg: string): string; //test remove it later
  end;

implementation

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
  AContext.Connection.IOHandler.WriteLn('SUCESS');
  Result := Msg;
end;

procedure TServerService.ServerExecute(AContext: TIdContext);
var
 Msg : string;
begin
 Sleep(100);

  Msg := AContext.Connection.IOHandler.ReadLn;

  Msg := PingPongMessage(AContext, Msg);

  TThread.Queue(nil,
    procedure
    begin
      ShowMessage('Recebido: ' + Msg);
    end);
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
