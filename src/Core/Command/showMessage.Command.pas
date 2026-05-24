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
unit showMessage.Command;

interface

uses CommandParsed.Dto, Message.Views, Transporter.Dto, Command.Logs, System.SysUtils,
  ID.Service, System.DateUtils, Command.Parser, Dialogs;
 type
  TShowMessageCommand = class
    private
     {Private Declarations}
    public
     {Public Declaration}
       class function Run(const Command: string): TCommandResult;
  end;

implementation

{ TMessage }

class function TShowMessageCommand.Run(const Command: string): TCommandResult;
var
 Parsed      : TCommandParsed;
 Parser      : TCommandParser;
 TimeStamp   : string;
 ID          : string;
 Elapsed     : integer;
 StartTime   : TdateTime;
 ErrorMessage: string;
begin
  StartTime   := now;
  Parsed      := Parser.Parse(Command);
  TimeStamp   := FormatDateTime('yyyymmdd_hhnnss', Now);
  ID          := TId.GetID;
  try
  Frm_message.Rch_Message.Clear;
  Frm_Message.Rch_Message.Text := Parsed.Value;
  Frm_Message.Show;
  Result.Success := True;
  Elapsed        := MilliSecondsBetween(Now, StartTime);
  Tlog.Success(TimeStamp, ID, Parsed.Name, Parsed.Text, Elapsed); //For Logs
  except
    on E: Exception do
    begin
      Result.Success := False;
      Result.Error   := E.Message;
      ErrorMessage   := E.Message;
      Tlog.Fail(TimeStamp, ID, Parsed.Name, Parsed.Text, Elapsed, ErrorMessage); //For Logs
    end;
  end;
end;

end.
