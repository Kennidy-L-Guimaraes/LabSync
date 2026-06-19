unit Agent.Controller;

interface

uses Config.Service, Command.Dispatcher, Command.Logs, ID.Service,
  Transporter.Dto, Command.Parser, CommandParsed.Dto, ServerConfig.Service, DateUtils, SysUtils, Generics.Collections, Classes,
  Controller.Dto, AgentConnect.Service;
 type
  TAgentController = class
    private
     {Private Declarations}
      FConfig       : TConfig;
      FServerConfig : TServerConfig;
      FDispatcher   : TCommandDispatcher;
      FLog          : TLog;
      FID           : TID;
      FSysInfo      : TStringlist;
      FControllerDto: TControllerDto;
      FServerAgent  : TAgentConnect;
    public
      constructor Create;
      destructor Destroy; override;

      {FUNCTIONS}
      function  GetSysInfo: TCommandResult;
      function  GetLogs: string;
      function  ToggleOption(const Key: string):TOptionState;
      function  SetServer(const Server: string): string;
      function  SetPort(const Port: string): string;
      function  GetOptionDisplay(const Key: string): string;
      function  GetID: string;
      function  GetServerStatus: string;
      function  GetDTO: TControllerDto;
      function  GetDtoValues : TControllerDto;     

      {PROCEDURES}
      procedure ShellSecurity;
      procedure InitializeIfNeeded;
      procedure LogStartAndOver(const Value: string);
      procedure ConnectServer;   
      procedure CreateObjs;
      procedure BuildDTO;  
  end;

implementation

{ TAgentController }

procedure TAgentController.BuildDTO;
begin
 FControllerdto:= GetDtoValues;
end;

procedure TAgentController.ConnectServer;
begin
 FServerAgent.Connect;
end;

constructor TAgentController.Create;
begin
 CreateObjs; 
 BuildDTO;
 //ServerStatus  
 FServerAgent  := TAgentConnect.Create(FControllerDto);
end;

procedure TAgentController.CreateObjs;
begin
 Fconfig       := TConfig.Create;
 FServerConfig := TServerConfig.Create; 
 FDispatcher   := TCommandDispatcher.Create;
 FLog          := Tlog.create;
 FID           := TID.Create;
 FSysInfo      := TStringList.Create;
end;

destructor TAgentController.Destroy;
begin
  Fconfig.Free;
  FDispatcher.Free;
  FLog.Free;
  FID.Free;
  FServerConfig.Free;
  FServerAgent.Free;
  inherited;
end;

procedure TAgentController.InitializeIfNeeded;
begin
    FConfig.Initialize;
    FServerConfig.Initialize;
 if FConfig.AlreadyStarted = False then
   begin
    FConfig.SetOption('Screenshot', osEnabled);
    FConfig.SetOption('LiveMode',   osEnabled);
    FConfig.SetOption('Messages',   osEnabled);
    FConfig.SetOption('Downloads',  osEnabled);
    FConfig.SetOption('Shutdown',   osEnabled);
    FConfig.SetOption('Registry',   osEnabled);
    FConfig.SetOption('Folders',    osEnabled);
    FConfig.SetOption('Commands',   osDisabled);
    FConfig.SetOption('Information', osEnabled);
    FConfig.SetStarted(True);
    //ServerConfig
    FServerConfig.SetServerOption('Server', 'https://company.com');
    FServerConfig.SetPortOption('Port', '5555'); //Default
   end
   else
   begin
    Exit;
   end;
end;

procedure TAgentController.LogStartAndOver(const Value: string);
begin
 if SameText(Value, 'Start') then
    FLog.StartAndOver(Value, FormatDateTime('yyyymmdd_hhnnss', Now), GetID, FControllerDto.Version, FControllerDto.username, FControllerDto.IP)
 else if SameText(Value, 'Over') then
     FLog.StartAndOver(Value, FormatDateTime('yyyymmdd_hhnnss', Now), GetID, FControllerDto.Version, FControllerDto.username, FControllerDto.IP);
end;

procedure TAgentController.ShellSecurity;
begin
 If FConfig.GetOption('Commands') = osEnabled then
    begin
     FConfig.SetOption('Commands', osDisabled);
    end;
end;

function TAgentController.GetDTO: TControllerDto;
begin
 Result := FControllerDto;
end;

function TAgentController.GetDtoValues : TControllerDto;
begin
  Result.Screenshot :=  FConfig.GetOptionAsDisplay('Screenshot');
  Result.LiveMode   :=  FConfig.GetOptionAsDisplay('LiveMode');
  Result.Messages   :=  FConfig.GetOptionAsDisplay('Messages');
  Result.Downloads  :=  FConfig.GetOptionAsDisplay('Downloads');
  Result.Shutdown   :=  FConfig.GetOptionAsDisplay('Shutdown');
  Result.Registry   :=  FConfig.GetOptionAsDisplay('Registry');
  Result.Folders    :=  FConfig.GetOptionAsDisplay('Folders');
  Result.Commands   :=  FConfig.GetOptionAsDisplay('Commands');
  Result.Information:=  FConfig.GetOptionAsDisplay('Information');
  Result.Server     :=  FServerConfig.GetServerOption('Server');
  Result.Port       :=  FServerConfig.GetPortOption('Port');

  FSysinfo.Text := GetSysInfo.Text;
  FSysInfo.NameValueSeparator    := '=';
  Result.name     := FSysInfo.Values['Name'];
  Result.cpu      := FSysInfo.Values['CPU'];
  Result.ram      := FSysInfo.Values['RAM'];
  Result.id       := FSysInfo.Values['ID'];
  Result.ip       := FSysInfo.Values['IP'];
  Result.Status   := FSysInfo.Values['Status'];
  Result.Username := FSysInfo.Values['UserName'];
  Result.version  := FSysInfo.Values['Version'];
  Result.receiver := FSysInfo.Values['ID'] + ' ' + FSysInfo.Values['UserName'];
end;

function TAgentController.SetPort(const Port: string): string;
begin
   FServerConfig.SetPortOption('Port', Port);
end;

function TAgentController.SetServer(const Server: string): string;
begin
  FServerConfig.SetServerOption('Server', Server);
end;

function TAgentController.GetID: string;
begin
 Result := FID.GetID; 
end;

function TAgentController.GetLogs: string;
var
 Content : string;
begin
  Content := FLog.ReadLogs('Audit.log');
  if Content = '' then
    Exit;
   Result := Content;
end;

function TAgentController.GetOptionDisplay(const Key: string): string;
begin
 Result := FConfig.GetOptionAsDisplay(Key);
end;

function TAgentController.GetServerStatus: string;
begin
  Result := FServerAgent.Isconnected;
end;

function TAgentController.GetSysInfo: TCommandResult;
 var
 Command      : TCommandParsed;
 CommandConcat: string;
 Transporter  : TCommandResult;
begin
  Command.Name  := '$get_sysinfo';
  Command.Target:= ('target='+FId.GetID);
  CommandConcat        := Command.Name + ' ' + Command.Target;
  Transporter   := FDispatcher.Execute(CommandConcat, FConfig, ecLocal);
  Result        := Transporter;
end;

function TAgentController.ToggleOption(const Key: string): TOptionState;
begin
   Result := FConfig.GetOption(Key);
  if Result = osEnabled then
    Result := osDisabled
  else
    Result := osEnabled;
  FConfig.SetOption(Key, Result);
end;

end.
