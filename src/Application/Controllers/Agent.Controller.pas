unit Agent.Controller;

interface

uses Config.Service, Command.Dispatcher, Command.Logs, ID.Service,
  Transporter.Dto;
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
      constructor Create;
      destructor Destroy; override;

      function  GetSysInfo: TCommandResult;
      function  GetLogs: string;
      procedure ToggleOption(const Key: string);
      function  GetOptionDisplay(const Key: string): string;
      procedure InitializeIfNeeded;
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

end;

function TAgentController.GetSysInfo: TCommandResult;
 var
 Command     : string;
 Transporter : TCommandResult;
begin
  Command     := '$get_sysinfo target='+FId.GetID;
  Transporter := FDispatcher.Execute(Command, FConfig, ecLocal);
  Result      := Transporter;
end;

procedure TAgentController.ToggleOption(const Key: string);
begin

end;

end.
