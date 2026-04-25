unit Command.Dispatcher;

interface
uses Command.Parser, SysUtils, Windows, Dialogs;
 type
  TCommandDispatcher = Class
    public
     {Public Declarations}
     procedure Execute(const Command: string);
    private
     {Private Declarations}
    procedure ReturnError(const Command, Suggestion, ErrorMsg: string);
    function  SuggestCommand(const cmd: string): string;
    procedure Get_Printscreen;

  End;


implementation

{ TCommandDispatcher }

procedure TCommandDispatcher.Execute(const Command: string);
var
 Cml    : string;
 Parser : TParser;
begin
 Cml := Parser.GetCommandName(Command);

 if Cml = '$get_printscreen' then
    Get_Printscreen

 else if Cml = '' then
    begin

    end
 else
    begin
    ReturnError(Cml, SuggestCommand(Cml), 'Not valid!');
    end;
end;

procedure TCommandDispatcher.Get_Printscreen;
begin
   //logic
   ShowMessage('Printscreen');
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
