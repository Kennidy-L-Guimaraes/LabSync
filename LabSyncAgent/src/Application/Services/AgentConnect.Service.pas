unit AgentConnect.Service;

interface
 uses IdTCPClient, Controller.Dto, SysUtils, classes, Command.Logs, System.DateUtils;
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
      procedure Disconect;
      function  Isconnected: string;
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
  TimeStamp := FormatDateTime('yyyymmdd_hhnnss', Now);
  try
  FIdTCPClient.Host := FcontrollerDto.Server;
  FIdTCPClient.Port := strtoInt(FControllerDto.Port);
  FIdTCPClient.Connect;
  except on E: Exception do
   begin
    Flog.ConnectServer(TimeStamp, FControllerdto.ip, Fcontrollerdto.Port, Uppercase(E.Message));
    exit;
   end;
  end;
  if FIdTCPClient.Connected then
  begin
  Flog.ConnectServer(TimeStamp, FControllerdto.ip, Fcontrollerdto.Port, 'CONNECTED');
  Machine := 'REGISTER|'+FControllerDto.ID+'|'+FControllerdto.Ip; //Language Simple
  FIdTCPClient.IOHandler.WriteLn(machine);
  end;
end;

constructor TAgentConnect.Create(const AControllerDto: TControllerDto);
begin
  inherited Create;
 FIdTCPClient   := TIdTCPClient.Create;
 FControllerDto := AControllerDto;
 FLog           := TLog.Create;
end;

destructor TAgentConnect.Destroy;
begin
inherited;
 FIdTCPClient.Free;
 Flog.Free;
end;

procedure TAgentConnect.Disconect;
var
 TimeStamp:  string;
begin
  TimeStamp := FormatDateTime('yyyymmdd_hhnnss', Now);
  If FIdTCPClient.Connected then
  begin
  FIdTCPClient.Disconnect;
  Flog.DisconnectServer(TimeStamp, FControllerdto.ip, Fcontrollerdto.Port, 'DISCONNECTED');
  end;
end;

function TAgentConnect.Isconnected: string;
var
 Response : String;
begin
  If FIdTCPClient.Connected then
   Response := 'CONNECTED'
  else
   Response := 'DISCONNECTED';
   //Response
   Result   := Response;
end;

end.
