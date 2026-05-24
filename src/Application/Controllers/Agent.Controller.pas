unit Agent.Controller;

interface

uses Config.Service, Command.Dispatcher, Command.Logs, ID.Service,
  Transporter.Dto, Command.Parser, CommandParsed.Dto;
 type
  TAgentController = class
    private
     {Private Declarations}
      FConfig: TConfig;
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

      constructor Create;
      destructor Destroy; override;

      function  GetSysInfo: TCommandResult;
      function  GetLogs: string;
      function ToggleOption(const Key: string):TOptionState;
      function  GetOptionDisplay(const Key: string): string;
      procedure InitializeIfNeeded;
      procedure GetValues;

  end;

implementation

{ TAgentController }

constructor TAgentController.Create;
begin
 Fconfig     := TConfig.Create;
 FDispatcher := TCommandDispatcher.Create;
 FLog        := Tlog.create;
 FID         := TID.Create;
end;

destructor TAgentController.Destroy;
begin
  Fconfig.Free;
  FDispatcher.Free;
  FLog.Free;
  FID.Free;
  inherited;
end;

procedure TAgentController.InitializeIfNeeded;
begin
    FConfig.Initialize;
 if FConfig.AlreadyStarted = False then
   begin
    FConfig.SetOption('Screenshot', osEnabled);
    FConfig.SetOption('LiveMode',   osEnabled);
    FConfig.SetOption('Messages',   osEnabled);
    FConfig.SetOption('Downloads',  osEnabled);
    FConfig.SetOption('Shutdown',   osEnabled);
    FConfig.SetOption('Registry',   osEnabled);
    FConfig.SetOption('Folders',    osEnabled);
    FConfig.SetOption('Commands',   osEnabled);
    FConfig.SetOption('Information', osEnabled);
    FConfig.SetStarted(True);
   end
   else
   begin
    Exit;
   end;
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
  Command.Name  := '$get_sysinfo ';
  Command.Target:= ('target='+FId.GetID);
  CommandConcat        := Command.Name + Command.Target;
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
