unit AgentConnect.Service;

interface
 uses IdTCPClient, Controller.Dto, SysUtils, classes, Command.Logs, System.DateUtils, dialogs,
  ApplicationMode.types;
  type
   TAgentConnect = class
     private
      {Private Declarations}
      FIdTCPClient   : TIdTCPClient;
      FControllerdto : TControllerDto;
      FLog           : Tlog;
     public
      {Public Declarations}
      procedure Connect;
      procedure Diconnect;
      procedure CreateClient;
      procedure DestroyClient;
      procedure RegisterMachineInServer;
      function  Isconnected: boolean;
      function  Ping: boolean; 
      constructor Create(const AControllerDto: TControllerDto);
      destructor Destroy; override;
   end;

implementation

{ TAgentConnect }

procedure TAgentConnect.Connect;
var
 Machine : string;
 TimeStamp:  string;
begin
 if FIdTCPClient.Connected then
   Exit;
  TimeStamp := FormatDateTime('yyyymmdd_hhnnss', Now);
  try
    FIdTCPClient.Host := FcontrollerDto.Server;
    FIdTCPClient.Port := strtoInt(FControllerDto.Port);
    FIdTCPClient.Connect;
  except on E: Exception do
   begin
    //Flog.ConnectServer(TimeStamp, FControllerdto.ip, Fcontrollerdto.Port, E.Message); //Error Connection                                                                                                                   Flog.ConnectServer(TimeStamp, FControllerdto.ip, Fcontrollerdto.Port, Uppercase(E.Message));
    exit;
   end;
  end;
  if FIdTCPClient.Connected then
  begin
    Flog.ConnectServer(TimeStamp, FControllerdto.ip, Fcontrollerdto.Port, 'CONNECTED');
  end;
end;

constructor TAgentConnect.Create(const AControllerDto: TControllerDto);
begin
  inherited Create;
  CreateClient;
  FControllerDto := AControllerDto;
  FLog           := TLog.Create(amAgent);
end;

procedure TAgentConnect.CreateClient;
begin
  FIdTCPClient   := TIdTCPClient.Create(nil);
end;

destructor TAgentConnect.Destroy;
begin
inherited;
 FIdTCPClient.Free;
 Flog.Free;
end;

procedure TAgentConnect.DestroyClient;
begin  
 FreeAndNil(FIdTCPClient);
end;

procedure TAgentConnect.Diconnect;
var
 TimeStamp: string;
begin
  TimeStamp := FormatDateTime('yyyymmdd_hhnnss', Now);
  try
    FIdTCPClient.Disconnect;
  except
    on E: Exception do
      Flog.DisconnectServer(TimeStamp, FControllerdto.ip, Fcontrollerdto.Port,
        'DISCONNECT_ERROR: ' + E.ClassName + ' - ' + E.Message);
  end;
  DestroyClient;
  CreateClient;
  Flog.DisconnectServer(TimeStamp, FControllerdto.ip, Fcontrollerdto.Port, 'DISCONNECTED');
end;

function TAgentConnect.Isconnected: boolean;
begin
  Result := FIdTCPClient.Connected and Ping;
end;

function TAgentConnect.Ping: boolean;
var
  pong: string;
begin
 if not FIdTCPClient.Connected then
  Exit(False); 
 try 
 FIdTCPClient.IOHandler.Writeln('PING');
 FIdTCPClient.IOHandler.ReadTimeout := 2000; 
 pong := FIdTCPClient.IOHandler.ReadLn;

 if sametext('PONG', pong) then 
    Result := True
    
 else 
    Result := False;
    //Diconnect;    
 except on E: exception do
  begin
    if FIdTCPClient.Connected then Diconnect;
    Result := False;
  end;
 end;
end;

procedure TAgentConnect.RegisterMachineInServer;
var
 Machine : string;
 TimeStamp:  string;
begin
  Machine := 'REGISTER|'+FControllerDto.ID+'|'+FControllerdto.Ip +'|'+ FControllerdto.username; //Language Simple
  FIdTCPClient.IOHandler.WriteLn(machine);
end;

end.
