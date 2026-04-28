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
unit GetSysInfo.Command;

interface

uses Command.Parser, Winapi.Windows,
  System.SysUtils, System.Win.Registry,WinSock, Path.Service, Transporter.Dto;
 type
  TGetSysInfoCommand = class
    public
     {Public Declarations}
     class var Parser   : TCommandParser;
     class function Run(const Command: string): TCommandResult;
  end;

implementation

{ TGetSysInfoCommand }

class function TGetSysInfoCommand.Run(const Command: string): TCommandResult;
var
 MachineName: string;
 MachineID  : string;
 MachineStorage: string;
 MachineTime: string;
 MachineCPU : string;
 MachineRAM : string;
 MachineIP  : string;
begin
 Result.DataType:= crtText;
 Result.Success := True;
 Result.Text    := '';
end;
end.
