unit Command.Dispatcher;

interface
uses Command.Parser, SysUtils, Windows, Dialogs, Command.Logs, System.IOUtils,
 Types, Vcl.Imaging.jpeg, Vcl.Graphics, Screen.Service, Path.Service, DateUtils,
  ID.Service, Vcl.ExtCtrls, Loop.Service;
 type
  TCommandDispatcher = Class
    public
     {Public Declarations}
     procedure Execute(const Command: string);
    private
     {Private Declarations}
    procedure ReturnError(const Command, Suggestion, ErrorMsg: string);
    function  SuggestCommand(const cmd: string): string;
    class procedure get_printscreen(const Command: string);
    class procedure get_printscreenLoop(const Command: string);


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
    get_printscreen(Command)

  else if CmdName = '$get_printscreenloop' then
    get_printscreenLoop(Command)
  else
  begin
    ReturnError(CmdName, SuggestCommand(CmdName), 'Not valid!');
  end;
end;

class procedure TCommandDispatcher.get_printscreen(const Command: string);
var
  Parser      : TParser;
  FileName    : string;
  TimeStamp   : string;
  StartTime   : TDateTime;
  Elapsed     : Integer;
  Params      : string;
  Quality     : Integer;
  CommandName : string;
begin
    TimeStamp := FormatDateTime('yyyymmdd_hhnnss', Now);
    StartTime := Now;

    Quality := Parser.GetQuality(Command);
    Params  := Format('Quality=%d', [Quality]);
    CommandName := '$get_printscreen';

    FileName := TPath.Combine(
      TPathService.PathLabSync('Screenshots'),
      TimeStamp + '.jpg'
    );

    try
      TScreenService.CaptureScreenToJpg(FileName, Quality);

      Elapsed := MilliSecondsBetween(Now, StartTime);

      TLog.SaveLog(
        Format('SUCCESS | %s | %s | %s | %s | File=%s | %dms',
        [TimeStamp, TId.GetID, CommandName, Params, FileName, Elapsed])
      );

    except
      on E: Exception do
      begin
        Elapsed := MilliSecondsBetween(Now, StartTime);

        TLog.SaveLog(
          Format('FAIL | %s | %s | %s | %s | %dms | Error=%s',
          [TimeStamp, TId.GetID, CommandName, Params, Elapsed, E.Message])
        );
      end;
    end;
end;

class procedure TCommandDispatcher.get_printscreenLoop(const Command: string);
 var
  Value : string;
  Parser: Tparser;
begin
  Parser := Default(TParser);
  Value := Parser.GetCommandValue(Command);
  if Parser.Normalize(Value) = Parser.Normalize('True') then
  begin
     TLoopService.Start(
  procedure
  begin
    TCommandDispatcher.get_printscreen('$get_printscreen quality=20');
  end,5000);
  end
  else
  begin
   TLoopService.Stop;
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

function TCommandDispatcher.SuggestCommand(const cmd: string): string;
begin
  if pos('$get_print', Cmd) = 1 then
     Exit('$get_printscreen');
  Result := '';
end;

end.
