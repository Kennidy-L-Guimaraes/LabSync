unit Unit1;
interface
uses
  IdTCPServer,
  IdContext, Classes, Windows, types, System.IOUtils, System.SysUtils;
 type
  TServerControll = class
    private
     {Private Declarations}
     FServer : TIdTCPServer;
    public
     {Public Declarations}
     constructor Create;
     destructor Destroy;
     procedure Start(const Aport: integer);
     procedure Stop;
  end;

implementation

{ TServerControll }

constructor TServerControll.Create;
begin
   inherited;
   FServer := TIdTCPServer.Create(nil);
end;

destructor TServerControll.Destroy;
begin
 FServer.Free;
end;

procedure TServerControll.Start(const Aport: integer);
begin
 FServer.DefaultPort := Aport;
 FServer.Active      := True;
end;

procedure TServerControll.Stop;
begin
  FServer.Active := False;
end;

end.
