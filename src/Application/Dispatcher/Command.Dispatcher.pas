unit Command.Dispatcher;

interface
uses Command.Parser, SysUtils, Windows, Dialogs, Command.Logs, System.IOUtils,
 Types, Vcl.Imaging.jpeg, Vcl.Graphics, Screen.Service, Path.Service;
 type
  TCommandDispatcher = Class
    public
     {Public Declarations}
     procedure Execute(const Command: string);
    private
     {Private Declarations}
    procedure ReturnError(const Command, Suggestion, ErrorMsg: string);
    function  SuggestCommand(const cmd: string): string;
    procedure Get_Printscreen(const Command: string);

  End;


implementation

{ TCommandDispatcher }

procedure TCommandDispatcher.Execute(const Command: string);
var
  CmdName : string;
  Parser  : TParser;
begin
  CmdName := Parser.GetCommandName(Command);

  if CmdName = '$get_printscreen' then
    Get_Printscreen(Command)

  else if CmdName = '' then
  begin
    // ignora
  end
  else
  begin
    ReturnError(CmdName, SuggestCommand(CmdName), 'Not valid!');
  end;
end;

procedure TCommandDispatcher.Get_Printscreen(const Command: string);
var
  Quality: integer;
  Parser : TParser;
  FileName: string;
begin
   //logic
  Quality   := Parser.GetQuality(Command);
  FileName  := TPath.Combine(TPathService.PathLabSync('Screenshots'),
               FormatDateTime('yyyymmdd_hhnnss', Now) + '.jpg');
  TScreenService.CaptureScreenToJpg(FileName, Quality);
  ShowMessage('Printscreen Quality: ' + IntToStr(Quality));
  TLog.SaveLog('$get_printscreen quality=' + IntToStr(Quality));
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

function TCommandDispatcher.SuggestCommand(const cmd: string): string;
begin
  if pos('$get_print', Cmd) = 1 then
     Exit('$get_printscreen');
  Result := '';
end;

end.
