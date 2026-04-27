unit Command.Dispatcher;

interface
uses Command.Parser, SysUtils, Windows, Dialogs, Command.Logs, System.IOUtils,
 Types, Vcl.Imaging.jpeg, Vcl.Graphics, Screen.Service, Path.Service, DateUtils,
  ID.Service, Vcl.ExtCtrls, Loop.Service, Screenshot.Queue, Classes;
 type
  TCommandDispatcher = Class
    public
     {Public Declarations}
       class var Parser   : TCommandParser;
       Quality: integer;
       Scalead: integer;
       Count  : integer;
       procedure Execute(const Command: string);
       class function  return_printscreen: string;
    private
     {Private Declarations}
      class var FFileName : string;
      procedure ReturnError(const Command, Suggestion, ErrorMsg: string);
      function  SuggestCommand(const cmd: string): string;
      class procedure get_printscreen(const Command: string; const ASilent: Boolean = False; AScaled: integer = 1);
      class procedure get_printscreenLoop(const Command: string);


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
     get_printscreen(Command)

  else if CmdName = '$get_printloop' then
          get_printscreenLoop(Command)


  else
  begin
    ReturnError(CmdName, SuggestCommand(CmdName), 'Not valid!');
  end;
end;

class procedure TCommandDispatcher.get_printscreen(const Command: string;
  const ASilent: Boolean = False; AScaled: integer = 1);
var
  TimeStamp   : string;
  StartTime   : TDateTime;
  Elapsed     : Integer;
  Params      : string;
  Quality     : Integer;
  CommandName : string;
  Stream      : TMemoryStream;
begin
  TimeStamp   := FormatDateTime('yyyymmdd_hhnnss', Now);
  StartTime   := Now;
  Quality     := Parser.GetQuality(Command);
  Params      := Format('Quality=%d', [Quality]);
  CommandName := '$get_print';

  Stream := TMemoryStream.Create;
  try
    TScreenService.CaptureScreenToStream(Stream, Quality);
    TScreenshotStreamQueue.Enqueue(Stream);
    Elapsed := MilliSecondsBetween(Now, StartTime);
  if not ASilent then
  begin
    TLog.SaveLog(
      Format('SUCCESS | %s | %s | %s | %s | %dms',
      [TimeStamp, TId.GetID, CommandName, Params, Elapsed]), 'Audit.log');
  end;
  except
    on E: Exception do
    begin
      Stream.Free;
      Elapsed := MilliSecondsBetween(Now, StartTime);
      TLog.SaveLog(
        Format('FAIL | %s | %s | %s | %s | %dms | Error=%s',
        [TimeStamp, TId.GetID, CommandName, Params, Elapsed, E.Message]), 'Audit.log');
    end;
  end;
end;

class procedure TCommandDispatcher.get_printscreenLoop(const Command: string);
var
  Value  : string;
begin
  Parser := Default(TCommandParser);
  Value  := Parser.GetCommandValue(Command);
  Count  := TScreenshotStreamQueue.Count;

  if Parser.Normalize(Value) = Parser.Normalize('True') then
  begin
    TLoopService.Start(
      procedure
      var
        Stream: TMemoryStream;
      begin
        //Backpressure Controll
        if Count > 2 then
          Exit;
         if TScreenshotStreamQueue.IsUnderPressure then
          begin
            Quality := 12;
            Scalead := 1;
          end
          else if Count <= 2 then
          begin
            Quality := 55;
            Scalead := 2;
          end
          else
          begin
            Quality := 80;
            Scalead := 2;
            end;
        Stream := TMemoryStream.Create;
        try
          TScreenService.CaptureScreenToStream(Stream, Quality, Scalead, True);

          if Stream.Size > 0 then
            TScreenshotStreamQueue.Enqueue(Stream)
          else
            Stream.Free;

        except
          Stream.Free;
          raise;
        end;
      end,
      15);
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

class function TCommandDispatcher.return_printscreen: string;
begin
 Result := FFileName;
end;

function TCommandDispatcher.SuggestCommand(const cmd: string): string;
begin
  if pos('$get_pri', Cmd) = 1 then
     Exit('$get_print');
  Result := '';
end;

end.
