unit Command.Logs;

interface
 uses Windows, System.IOUtils, SysUtils;
 type
  TLog = class
  public
    {Public Declarations}
    class procedure SaveLog(const NewLog, NameOfLog: string);
    class function  ReadLogs(const NameOfLog: string): string;
    class procedure Fail(const TimeStamp, ID, CommandName, Params: string; Elapsed: integer; ErrorMessage: string);
    class procedure Success(const TimeStamp, ID, CommandName, Params: string; Elapsed: integer);
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

class procedure TLog.Fail(const TimeStamp, ID, CommandName, Params: string; Elapsed: integer; ErrorMessage: string);
begin
  TLog.SaveLog(
        Format('FAIL | %s | %s | %s | %s | %dms | Error=%s',
        [TimeStamp, ID, CommandName, Params, Elapsed, ErrorMessage]), 'Audit.log');
end;

class procedure TLog.Success(const TimeStamp, ID, CommandName, Params: string; Elapsed: integer);
begin
  SaveLog(
      Format('SUCCESS | %s | %s | %s | %s | %dms',
      [TimeStamp, ID, CommandName, Params, Elapsed]), 'Audit.log');
end;

end.
