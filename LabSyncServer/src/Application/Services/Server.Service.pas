unit Server.Service;
interface
uses
  IdTCPServer,
  IdContext, Classes, Windows, types, System.IOUtils, System.SysUtils;
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

procedure TServerService.ServerExecute(AContext: TIdContext);
begin
 Sleep(100);
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
