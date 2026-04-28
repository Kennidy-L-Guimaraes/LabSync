unit Command.Dispatcher;

interface
uses Command.Parser, SysUtils, Windows, Dialogs, Command.Logs, System.IOUtils,
 Types, Vcl.Imaging.jpeg, Vcl.Graphics, Screen.Service, Path.Service, DateUtils,
  ID.Service, Vcl.ExtCtrls, Loop.Service, Screenshot.Queue, Classes,
  GetPrint.Command, GetLiveMode.Command, CommandSuggestion.Service,
  GetSysInfo.Command;
 type
  TCommandDispatcher = Class
    public
     {Public Declarations}
       var Parser   : TCommandParser;
       procedure Execute(const Command: string);
    private
     {Private Declarations}
      procedure ReturnError(const Command, Suggestion, ErrorMsg: string);
  End;


implementation

{ TCommandDispatcher }

procedure TCommandDispatcher.Execute(const Command: string);
var
  CmdName  : string;
  CmdTarget: string;
begin
  CmdName   := Parser.Normalize(Parser.GetCommandName(Command));
  CmdTarget := Parser.Normalize(Parser.GetCommandTarget(Command));

  if (CmdTarget <> 'all') and (CmdTarget <> TId.GetID) then
    Exit; //Another Machine

  if CmdName = '$get_print' then
     TGetPrintCommand.Run(Command)

  else if CmdName = '$get_livemode' then
          TGetLiveModeCommand.Run(Command)

  else if CmdName = '%get_sysinfo' then
          TGetSysInfoCommand.Run(Command)
  else
  begin
    ReturnError(
    CmdName,
    TCommandSuggestionService.Suggest(
    CmdName,
    ['$get_print', '$get_livemode', '$exec_shutdown']), 'Not valid!');
  end;
end;

procedure TCommandDispatcher.ReturnError(const Command, Suggestion, ErrorMsg: string);
var
  Msg: string;
begin
  Msg := ErrorMsg + ' [' + Command + ']';

  if Suggestion <> '' then
    Msg := Msg + ' Perhaps you meant "' + Suggestion + '"';

  //For developer testing, it needs to be replaced with HTTP delivery mechanisms.
  showmessage((Msg));
end;

end.
