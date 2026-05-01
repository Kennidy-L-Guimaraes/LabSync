unit Command.Dispatcher;

interface
uses Command.Parser, SysUtils, Windows, Dialogs, Command.Logs, System.IOUtils,
 Types, Vcl.Imaging.jpeg, Vcl.Graphics, Screen.Service, Path.Service, DateUtils,
  ID.Service, Vcl.ExtCtrls, Loop.Service, Screenshot.Queue, Classes,
  GetPrint.Command, GetLiveMode.Command, CommandSuggestion.Service,
  GetSysInfo.Command, Transporter.Dto, Config.Service;
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
  CmdName  : string;
  CmdTarget: string;
begin
  CmdName   := Parser.Normalize(Parser.GetCommandName(Command));
  CmdTarget := Parser.Normalize(Parser.GetCommandTarget(Command));
    if AConfig = nil then
       raise Exception.Create('Config not assigned');
    if not SameText(Trim(CmdTarget), 'all') and
       not SameText(Trim(CmdTarget), TId.GetID) then
           Exit; //Another Machine

  if CmdName = '$get_print' then
          begin
          if (AContext = ecRemote) and (AConfig.GetOption('Printscreen') <> osEnabled) then
              Exit(ReturnError(CmdName, '', 'Permission denied'));
              Result := TGetPrintCommand.Run(Command);
          end


  else if CmdName = '$get_livemode'  then
          begin
          if CheckPermission('LiveMode', AConfig, AContext, CmdName) then
              Result := TGetLiveModeCommand.Run(Command);
          end

  else if (CmdName = '$get_sysinfo') then
          begin
          if CheckPermission('Information', AConfig, AContext, CmdName) then
             Result := TGetSysInfoCommand.Run(Command);
          end
  else
  begin
    ReturnError(CmdName,
    TCommandSuggestionService.Suggest(CmdName,
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
