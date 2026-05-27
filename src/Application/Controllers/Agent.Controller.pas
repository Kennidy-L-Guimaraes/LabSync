unit Agent.Controller;

interface

uses Config.Service, Command.Dispatcher, Command.Logs, ID.Service,
  Transporter.Dto, Command.Parser, CommandParsed.Dto, ServerConfig.Service, DateUtils, SysUtils;
 type
  TAgentController = class
    private
     {Private Declarations}
      FConfig: TConfig;
      FServerConfig: TServerConfig;
      FDispatcher: TCommandDispatcher;
      FLog: TLog;
      FID: TID;
    public
     {Public Declarations}
      var
      Screenshot  : string;
      LiveMode    : string;
      Messages    : string;
      Downloads   : string;
      Shutdown    : string;
      Registry    : string;
      Folders     : string;
      Commands    : string;
      Information : string;
      Server      : string;
      Port        : string; 
      constructor Create;
      destructor Destroy; override;

      function  GetSysInfo: TCommandResult;
      function  GetLogs: string;
      function  ToggleOption(const Key: string):TOptionState;
      function  SetServer(const Server: string): string;
      function  SetPort(const Port: string): string;
      function  GetOptionDisplay(const Key: string): string;
      procedure ShellSecurity;
      procedure InitializeIfNeeded;
      procedure GetValues;

  end;

implementation

{ TAgentController }

constructor TAgentController.Create;
begin
 Fconfig       := TConfig.Create;
 FServerConfig := TServerConfig.Create; 
 FDispatcher   := TCommandDispatcher.Create;
 FLog          := Tlog.create;
 FID           := TID.Create;
end;

destructor TAgentController.Destroy;
begin
  Fconfig.Free;
  FDispatcher.Free;
  FLog.Free;
  FID.Free;
  FServerConfig.Free;
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
    FServerConfig.SetPortOption('Port', ':5555'); //Default
   end
   else
   begin
    Exit;
   end;
end;

procedure TAgentController.ShellSecurity;
begin
 If FConfig.GetOption('Commands') = osEnabled then
    begin
     FConfig.SetOption('Commands', osDisabled);
    end;
end;

function TAgentController.SetPort(const Port: string): string;
begin
   FServerConfig.SetPortOption('Port', Port);
end;

function TAgentController.SetServer(const Server: string): string;
begin
  FServerConfig.SetServerOption('Server', Server);
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

procedure TAgentController.GetValues;
begin
  Screenshot :=  FConfig.GetOptionAsDisplay('Screenshot');
  LiveMode   :=  FConfig.GetOptionAsDisplay('LiveMode');
  Messages   :=  FConfig.GetOptionAsDisplay('Messages');
  Downloads  :=  FConfig.GetOptionAsDisplay('Downloads');
  Shutdown   :=  FConfig.GetOptionAsDisplay('Shutdown');
  Registry   :=  FConfig.GetOptionAsDisplay('Registry');
  Folders    :=  FConfig.GetOptionAsDisplay('Folders');
  Commands   :=  FConfig.GetOptionAsDisplay('Commands');
  Information:=  FConfig.GetOptionAsDisplay('Information');
  Server     :=  FServerConfig.GetServerOption('Server');
  Port       :=  FServerConfig.GetPortOption('Port'); 
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
