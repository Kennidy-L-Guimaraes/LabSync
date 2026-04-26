unit Command.Logs;

interface
 uses Windows, System.IOUtils, SysUtils;
 type
  TLog = class
  public
    {Public Declarations}
    class procedure SaveLog(const Msg: string);
    class function  ReadLogs: string;
  private
    {Private Declarations}
    class function  GetLogPath: string;
  end;
implementation

{ TLog }

class function TLog.GetLogPath: string;
var
  BaseDir: string;
begin
  BaseDir := TPath.Combine(GetEnvironmentVariable('APPDATA'), 'LabSync\Logs');

  if not TDirectory.Exists(BaseDir) then
    TDirectory.CreateDirectory(BaseDir);

  Result := TPath.Combine(BaseDir, 'SystemLogs.txt');
end;

class function TLog.ReadLogs: string;
begin
   if TFile.Exists(GetLogPath) then
    Result := TFile.ReadAllText(GetLogPath, TEncoding.UTF8)
  else
    Result := 'There are no system logs yet.';
end;

class procedure TLog.SaveLog(const Msg: string);
Var
 Line: string;
begin
 Line := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' + Msg + '---DONE---';
 try
  TFile.AppendAllText(GetLogPath, Line + sLineBreak, TEncoding.UTF8);
 except
  raise Exception.Create('The log could not be saved to the local system.');
 end;
end;

end.
