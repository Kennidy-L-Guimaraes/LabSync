{
  Command Handler Contract

  1. Single Responsibility
     Each command must implement exactly one well-defined action.
     It must not handle multiple distinct operations or behaviors.

  2. One Command per Class
     A command class must represent only one command.
     Do not group multiple commands into a single class.

  3. Independence and Loose Coupling
     Commands should be independent and self-contained.
     They may collaborate with other commands or services,
     but must not depend on their internal implementation.

  4. Stateless by Default
     Commands should not maintain internal state between executions.
     Prefer stateless design to ensure predictability and thread safety.

  5. Prefer Static (Class) Methods
     Commands should preferably expose class (static) methods
     to avoid unnecessary object instantiation and memory overhead.
     Use instances only when state or dependency injection is required.

  6. Clear and Explicit Naming
     Command names must be self-descriptive and reflect their behavior.
     Avoid generic or ambiguous names.

  7. Delegation over Implementation
     Commands must orchestrate actions, not implement low-level logic.
     Complex operations must be delegated to specialized services.

  8. Minimal Dependencies
     A command should depend only on what is strictly necessary.
     Avoid excessive coupling to infrastructure or global state.

  9. Predictable Input/Output
     Commands must have clear input expectations and deterministic behavior.
     Side effects should be explicit and controlled.

  10. Error Handling
      Commands must handle failures gracefully and consistently,
      delegating logging and reporting to appropriate services.

  11. No Hidden Side Effects
      A command must not trigger unrelated processes or background tasks
      unless explicitly part of its defined responsibility.

  12. Scalable Structure
      The design must allow new commands to be added without modifying
      existing ones (Open/Closed Principle).
}
unit GetLiveMode.Command;

interface
 uses Command.Parser, SysUtils, Windows, Dialogs, Command.Logs, System.IOUtils,
 Types, Vcl.Imaging.jpeg, Vcl.Graphics, Screen.Service, Path.Service, DateUtils,
  ID.Service, Vcl.ExtCtrls, Loop.Service, Screenshot.Queue, Classes,
  Transporter.Dto;
  type
   TGetLiveModeCommand = class
    public
     {Public Declarations}
      class var Parser   : TCommandParser;
      Quality: integer;
      Scalead: integer;
      Count  : integer;
     class function Run(const Command: string): TCommandResult;
   end;
implementation

{ TGetLiveModeCommand }

class function TGetLiveModeCommand.Run(const Command: string): TCommandResult;
var
  Value: string;
begin
  //default
  Result.Success  := False;
  Result.DataType := crtNone;
  Result.Text     := '';
  Result.Stream   := nil;
  Result.Error    := '';

  Parser := Default(TCommandParser);
  Value  := Parser.GetCommandValue(Command);

  try
    if Parser.Normalize(Value) = Parser.Normalize('True') then
    begin
      TLoopService.Start(
        procedure
        var
          Stream: TMemoryStream;
          Count : Integer;
        begin
          Count := TScreenshotStreamQueue.Count;

          //Backpressure
          if Count > 2 then
            Exit;

          if TScreenshotStreamQueue.IsUnderPressure then
          begin
            Quality := 100;
            Scalead := 2;
          end
          else if Count <= 2 then
          begin
            Quality := 55;
            Scalead := 2;
          end
          else
          begin
            Quality := 10;
            Scalead := 3;
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
        15
      );

      Result.Success := True;
      Result.Text    := 'LiveMode started';
    end
    else
    begin
      TLoopService.Stop;
      Result.Success := True;
      Result.Text    := 'LiveMode stopped';
    end;

  except
    on E: Exception do
    begin
      Result.Success := False;
      Result.Error   := E.Message;
    end;
  end;
end;

end.
