unit Command.Logs;

interface
 uses Windows, System.IOUtils, SysUtils, Transporter.Dto, Dialogs;
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
  BaseDir := TPath.Combine(GetEnvironmentVariable('APPDATA'), 'LabSync\Logs');

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
 except
  raise Exception.Create('The log could not be saved to the local system.');
 end;
end;

class procedure TLog.ShellState(const TimeStamp, ID, Status: string);
begin
  If Status = 'Enabled'  then 
     Tlog.SaveLog(Format('SHELL-ENABLED | Time:%s | ID:%s | Status:%s', [TimeStamp, ID, Status]), 'Audit.log') 
  else if Status = 'Disabled' then
     Tlog.SaveLog(Format('SHELL-DISABLE | Time:%s | ID:%s | Status:%s', [TimeStamp, ID, Status]), 'Audit.log');
end;

class procedure TLog.ConfigLog(const TimeStamp, ID, ConfigName: string);
begin
  Tlog.SaveLog(Format('CONFIG | Time:%s | ID:%s Config:%s', [TimeStamp, ID, ConfigName]), 'Audit.log');
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
