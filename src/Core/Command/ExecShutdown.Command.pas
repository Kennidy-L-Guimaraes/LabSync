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
unit ExecShutdown.Command;

interface

uses Command.Parser, CommandParsed.Dto, Transporter.Dto, Winapi.Windows, SysUtils, DateUtils,
  ID.Service, Command.Logs;
 type
  TExecShutdownCommand = class
    private
     {Private Declarations}
     class function EnableShutdownPrivilege: Boolean;
    public
     {Public Declarations}
     class function Run(const Command: string): TCommandResult;
  end;

implementation

class function TExecShutdownCommand.EnableShutdownPrivilege: Boolean;
var
  Token    : THandle;
  TLP      : TOKEN_PRIVILEGES;
  LUID     : Int64;
  ReturnLen: DWORD;
begin
  Result := False;

  if not OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, Token) then
    Exit;
  try
    if not LookupPrivilegeValue(nil, 'SeShutdownPrivilege', LUID) then
      Exit;

    TLP.PrivilegeCount           := 1;
    TLP.Privileges[0].Luid       := LUID;
    TLP.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;

    ReturnLen := 0;

    Result := AdjustTokenPrivileges(Token, False, TLP, SizeOf(TLP), TLP,  ReturnLen);
  finally
    CloseHandle(Token);
  end;
end;

{ TShutdownCommand }

class function TExecShutdownCommand.Run(const Command: string): TCommandResult;
var
 Parser : TcommandParser;
 Parsed : TCommandParsed;
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
   if not EnableShutdownPrivilege then
      raise Exception.Create('Failed to obtain shutdown privilege: ' +
                            SysErrorMessage(GetLastError));

  if not ExitWindowsEx(EWX_SHUTDOWN or EWX_FORCEIFHUNG, 0) then
    raise Exception.Create('Fail ExitWindowsEx: ' +
                            SysErrorMessage(GetLastError));
   Elapsed        := MilliSecondsBetween(Now, StartTime);
   Tlog.Success(TimeStamp, ID, Parsed.Name, Parsed.Text, Elapsed); //For Logs
   Result.Success := True;
  except
   on E: exception do
    begin
      Result.Success := False;
      Result.Error   := E.Message;
      ErrorMessage   := E.Message;
      Tlog.Fail(TimeStamp, ID, Parsed.Name, Parsed.Text, Elapsed, ErrorMessage); //For Logs
    end;
  end;

end;

end.
