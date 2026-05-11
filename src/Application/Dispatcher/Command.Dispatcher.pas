unit Command.Dispatcher;

interface
uses Command.Parser, SysUtils, Windows, Dialogs, Command.Logs, System.IOUtils,
 Types, Vcl.Imaging.jpeg, Vcl.Graphics, Screen.Service, Path.Service, DateUtils,
  ID.Service, Vcl.ExtCtrls, Loop.Service, Screenshot.Queue, Classes,
  GetPrint.Command, GetLiveMode.Command, CommandSuggestion.Service,
  GetSysInfo.Command, Transporter.Dto, Config.Service, CommandParsed.Dto;
 type
  TCommandDispatcher = Class
    public
     {Public Declarations}
       var Parser   : TCommandParser;
       function Execute(const Command: string; AConfig: TConfig; AContext: TExecutionContext): TCommandResult;
    private
     {Private Declarations}
      function ReturnError(const Command, Suggestion, ErrorMsg: string): TCommandResult;
      procedure ReturnPermission(Const ACmdName, APermission: string);
      function CheckPermission(const AOption: string; AConfig: TConfig; AContext: TExecutionContext; ACmdName: string): Boolean;

  End;


implementation

{ TCommandDispatcher }

function TCommandDispatcher.CheckPermission(const AOption: string;
  AConfig: TConfig; AContext: TExecutionContext; ACmdName: string): Boolean;
begin
  if (AContext = ecRemote) and (AConfig.GetOption(Aoption) <> osEnabled) then
  begin
  Result := False;
  ReturnPermission(ACmdName, 'Permission denied');
  end
  else
  Result := True;
end;

function TCommandDispatcher.Execute(const Command: string; AConfig: TConfig; AContext: TExecutionContext): TCommandResult;
var
  Parsed   : TCommandParsed;
begin
  Parsed := Parser.Parse(Command);
    if AConfig = nil then
       raise Exception.Create('Config not assigned');
    if not SameText(Trim(Parsed.Target), 'all') and
       not SameText(Trim(Parsed.Target), TId.GetID) then
           Exit; //Another Machine

  if Parsed.Name = '$get_print' then
          begin
          if (AContext = ecRemote) and (AConfig.GetOption('Printscreen') <> osEnabled) then
              Exit(ReturnError(Parsed.Name, '', 'Permission denied'));
              Result := TGetPrintCommand.Run(Command);
          end


  else if Parsed.name = '$get_livemode'  then
          begin
          if CheckPermission('LiveMode', AConfig, AContext, Parsed.Name) then
              Result := TGetLiveModeCommand.Run(Command);
          end

  else if Parsed.name = '$get_sysinfo' then
          begin
          if CheckPermission('Information', AConfig, AContext, Parsed.Name) then
             Result := TGetSysInfoCommand.Run(Command);
          end
  else
  begin
    ReturnError(Parsed.Name,
    TCommandSuggestionService.Suggest(Parsed.Name,
    ['$get_print', '$get_livemode', '$get_sysinfo', '$exec_shutdown', '']), 'Not valid!');
  end;
end;

function TCommandDispatcher.ReturnError(const Command, Suggestion, ErrorMsg: string): TCommandResult;
var
  Msg: string;
begin
  Msg := ErrorMsg + ' [' + Command + ']';

  if Suggestion <> '' then
    Msg := Msg + ' Perhaps you meant "' + Suggestion + '"';

  //For developer testing, it needs to be replaced with HTTP delivery mechanisms.
  //showmessage((Msg));
end;

procedure TCommandDispatcher.ReturnPermission(const ACmdName,
  APermission: string);
  var
  Permission: string;
begin
  Permission := ' Permission to access ' + AcmdName + APermission;
  //implement
end;

end.
