unit Command.Logs;

interface
 uses Windows, System.IOUtils, SysUtils, Transporter.Dto, Dialogs, Path.Service,
  ApplicationMode.types;
 type
  TServerStatus = (ssOnline, ssOffline);
 type
  TLog = class
  public
    {Public Declarations}
    class procedure SaveLog(const NewLog, NameOfLog: string);
    class function  ReadLogs(const NameOfLog: string): string;
    class procedure Fail(const TimeStamp, ID, CommandName, Params: string; Elapsed: integer; ErrorMessage: string; Context: TExecutionContext);
    class procedure Success(const TimeStamp, ID, CommandName, Params: string; Elapsed: integer; Context: TExecutionContext);
    class procedure ConfigLog(const TimeStamp, ID, ConfigName: string);
    class procedure ShellState(const TimeStamp, ID, Status : string);
    class procedure StartAndOver(const Status, TimeStamp, ID, Version, User, IP: string);
    class procedure ConnectServer(const TimeStamp, Server, Port, messages: string);
    class procedure DisconnectServer(const TimeStamp, Server, Port, messages: string);

    {UNIQUE FOR SERVER}
    class procedure ServerStatus(const Status: TServerStatus; TimeStamp, ID, Version, IP, ErrorMessage: string);
    constructor Create(const Avalue: TApplicationMode);
    class var   FPathServerOrAgent: string;
  private
    {Private Declarations}
    class function  GetLogPath(const nameOfLog: string): string;
  end;
implementation

{ TLog }

class function TLog.GetLogPath(const nameOfLog: string): string;
var
  BaseDir: string;
begin
  BaseDir  := TPath.Combine(GetEnvironmentVariable('APPDATA'), 'LabSync\'+FPathServerOrAgent+'\Logs');

  if not TDirectory.Exists(BaseDir) then
    TDirectory.CreateDirectory(BaseDir);

  Result := TPath.Combine(BaseDir, NameOfLog);
end;

class function TLog.ReadLogs(const NameOfLog: string): string;
begin
   if TFile.Exists(GetLogPath(NameOfLog)) then
    Result := TFile.ReadAllText(GetLogPath(NameOfLog), TEncoding.UTF8)
  else
    Result := 'There are no system logs yet.';
end;

class procedure TLog.SaveLog(const NewLog, NameOfLog: string);
Var
 Line: string;
begin
 Line := NewLog;
 try
  TFile.AppendAllText(GetLogPath(NameOfLog), Line + sLineBreak, TEncoding.UTF8);
 except on E: exception do
  raise Exception.Create('The log could not be saved to the local system.'+ E.Message);
 end;
end;

class procedure TLog.ServerStatus(const Status: TServerStatus; TimeStamp, ID, Version,
  IP, ErrorMessage: string);
begin
 case Status of
   ssOnline:
    Tlog.SaveLog(Format('SERVER ONLINE ##### | Time: %s | ID: %s | Version: %s | IP: %s | Message: %s', [TimeStamp, ID, Version, IP, ErrorMessage]), 'Audit.log');
   ssOffline:
    Tlog.SaveLog(Format('SERVER OFFLINE ##### | Time: %s | ID: %s | Version: %s | IP: %s | Message: %s', [TimeStamp, ID, Version, IP, ErrorMessage]), 'Audit.log');
 end;
end;

class procedure TLog.ShellState(const TimeStamp, ID, Status: string);
begin
  trim(Status);
  If SameText(Status, 'Enabled')  then
     Tlog.SaveLog(Format('SHELL-ENABLED | Time:%s | ID:%s | Status:%s', [TimeStamp, ID, Status]), 'Audit.log')

  else if SameText(Status, 'Disabled') then
     Tlog.SaveLog(Format('SHELL-DISABLE | Time:%s | ID:%s | Status:%s', [TimeStamp, ID, Status]), 'Audit.log');
end;

class procedure TLog.StartAndOver(const Status, TimeStamp, ID, Version, User,
  IP: string);
begin
  trim(Status);
  If SameText(Status, 'Start')  then
     Tlog.SaveLog(Format('START SYSTEM ##### | Time:%s | ID:%s | Version:%s | User:%s LocalIP:%s', [TimeStamp, ID, Version, User, IP]), 'Audit.log')
  else if SameText(Status, 'Over') then
     Tlog.SaveLog(Format('OVER SYSTEM  ##### | Time:%s | ID:%s | Version:%s | User:%s LocalIP:%s', [TimeStamp, ID, Version, User, IP]), 'Audit.log')
end;

class procedure TLog.ConfigLog(const TimeStamp, ID, ConfigName: string);
begin
  Tlog.SaveLog(Format('CONFIG | Time:%s | ID:%s Config:%s', [TimeStamp, ID, ConfigName]), 'Audit.log');
end;

class procedure TLog.ConnectServer(const TimeStamp, Server, Port,
  messages: string);
begin
 //Use For Connect
 TLog.SaveLog(Format('SERVER - CONNECT | Time: %s | %s | IP: %s | PORT: %s ', [TimeStamp, messages, server, port]), 'Audit.log');
end;

constructor TLog.Create(const Avalue: TApplicationMode);
begin
  inherited Create;
  case AValue of
  TApplicationMode.amServer:
    FPathServerOrAgent := 'Server';

  TApplicationMode.amAgent:
    FPathServerOrAgent := 'Machine';
  end;
end;

class procedure TLog.DisconnectServer(const TimeStamp, Server, Port,
  messages: string);
begin
  //Use for Disconnect
  TLog.SaveLog(Format('SERVER - DISCONNECT | Time: %s | %s | IP: %s | PORT: %s ', [TimeStamp, messages, server, port]), 'Audit.log');
end;

class procedure TLog.Fail(const TimeStamp, ID, CommandName, Params: string; Elapsed: integer; ErrorMessage: string; Context: TExecutionContext);
var
  ContextStr: string;
begin
  case Context of
    ecLocal : ContextStr := 'LOCAL';
    ecRemote: ContextStr := 'REMOTE';
  else
    ContextStr := 'UNKNOWN';
  end;

  TLog.SaveLog(
    Format('FAIL | Time:%s | ID:%s | Context:%s | Command:%s | Target:%s | %dms | Error=%s',
    [TimeStamp, ID, ContextStr, CommandName, Params, Elapsed, ErrorMessage]), 'Audit.log');
end;

class procedure TLog.Success(const TimeStamp, ID, CommandName, Params: string; Elapsed: integer; Context: TExecutionContext);
var
  ContextStr: string;
begin
  case Context of
    ecLocal : ContextStr := 'LOCAL';
    ecRemote: ContextStr := 'REMOTE';
  else
    ContextStr := 'UNKNOWN';
  end;

  SaveLog(
    Format('SUCCESS | Time:%s | ID:%s | Context:%s | Command:%s | Target:%s | %dms',
    [TimeStamp, ID, ContextStr, CommandName, Params, Elapsed]), 'Audit.log');
end;

end.
