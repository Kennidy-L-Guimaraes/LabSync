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
  System.SysUtils, System.Win.Registry,WinSock, Path.Service, Transporter.Dto,
  Command.Logs, ID.Service, DateUtils, IdStack;
 type
  TGetSysInfoCommand = class
    public
     {Public Declarations}
     class var Parser   : TCommandParser;
     class function Run(const Command: string): TCommandResult;
     class function GetLocalIP: string;
  end;

implementation

{ TGetSysInfoCommand }

class function TGetSysInfoCommand.GetLocalIP: string;
var
  WSAData: TWSAData;
  HostName: array[0..255] of AnsiChar;
  HostEnt: PHostEnt;
  Addr: PInAddr;
begin
  Result := 'Unavailable';

  if WSAStartup($0202, WSAData) <> 0 then
    Exit;

  try
    if gethostname(HostName, SizeOf(HostName)) = 0 then
    begin
      HostEnt := gethostbyname(HostName);
      if Assigned(HostEnt) then
      begin
        Addr := PInAddr(HostEnt^.h_addr_list^);
        Result := string(inet_ntoa(Addr^));
      end;
    end;
  finally
    WSACleanup;
  end;
end;

class function TGetSysInfoCommand.Run(const Command: string): TCommandResult;
var
 MachineName: string;
 MachineID  : string;
 MachineTime: string;
 MachineCPU : string;
 MachineRAM : string;
 MachineIP  : string;
 MachineUserName: string;

 //Variables Assistants
 SysInfo: TSystemInfo;
 MemStatus: TMemoryStatusEx;
 ComputerName: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
 NameSize: DWORD;
 UserName: array[0..255] of Char;
 Size: DWORD;

 //Variables for Logs
 TimeStamp    : string;
 ID           : string;
 CommandName  : string;
 Params       : string;
 Elapsed      : integer;
 ErrorMessage : string;
 Target       : string;
 StartTime    : TDateTime;
begin
  //default
  Result.Success  := False;
  Result.DataType := crtNone;
  Result.Text     := '';
  Result.Stream   := nil;
  Result.Error    := '';
  Elapsed     := 0;
  StartTime   := Now;
  Target      := Parser.GetCommandTarget(Command);
  TimeStamp   := FormatDateTime('yyyymmdd_hhnnss', Now);
  Params      := Format('Target=%s', [Target]);
  CommandName := Parser.GetCommandName(Command);
  ID          := TId.GetID;

  try
   //Machine Name
    NameSize := MAX_COMPUTERNAME_LENGTH + 1;
    GetComputerName(ComputerName, NameSize);
    MachineName := ComputerName;

    //CPU
    GetSystemInfo(SysInfo);
    MachineCPU  := IntToStr(SysInfo.dwNumberOfProcessors) + ' cores';
    MachineTime := TimeStamp;

    //RAM
    MemStatus.dwLength := SizeOf(MemStatus);
    GlobalMemoryStatusEx(MemStatus);
    MachineRAM := Format('%.2f GB', [MemStatus.ullTotalPhys / 1024 / 1024 / 1024]);

    //ID
    MachineID := ID;

    //IP(Windows)
    MachineIP := GetLocalIP;
    MachineID := ID;

    //User Name
    Size := SizeOf(UserName);
     if GetUserName(UserName, Size) then
        MachineUserName := UserName
     else
        MachineUserName := 'Unknown';
    Elapsed     := MilliSecondsBetween(Now, StartTime);
    Result.Text :=
      'Name=' + MachineName + sLineBreak +
      'ID=' + MachineID + sLineBreak +
      'CPU=' + MachineCPU + sLineBreak +
      'RAM=' + MachineRAM + sLineBreak +
      'IP=' + MachineIP + SlineBreak +
      'UserName=' + MachineUserName;
   Result.DataType:= crtText;
   Result.Success := True;
   Tlog.Success(TimeStamp, ID, CommandName, Params, Elapsed); //For Logs
  except
       on E: Exception do
     begin
      Result.DataType := crtText;
      Result.Success  := False;
      Result.Error    := E.Message;
      ErrorMessage    := E.Message;
      Tlog.Fail(TimeStamp, ID, CommandName, Params, Elapsed, ErrorMessage); //For Logs
     end;
  end;
end;
end.
