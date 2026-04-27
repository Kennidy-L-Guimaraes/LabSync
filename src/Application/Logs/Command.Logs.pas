unit Command.Logs;

interface
 uses Windows, System.IOUtils, SysUtils;
 type
  TLog = class
  public
    {Public Declarations}
    class procedure SaveLog(const NewLog, NameOfLog: string);
    class function  ReadLogs(const NameOfLog: string): string;
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

end.
