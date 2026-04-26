unit Path.Service;

interface
uses Command.Parser, SysUtils, Windows, Dialogs, Command.Logs, System.IOUtils,
 Types, Vcl.Imaging.jpeg, Vcl.Graphics, Screen.Service;
 Type
  TPathService = class
    Public
     {Public Declarations}
     class function PathLabSync(const path: string): string;
  end;

implementation

{ TPathService }

class function TPathService.PathLabSync(const path: string): string;
var
 BaseDir: string;
begin
  BaseDir := TPath.Combine(GetEnvironmentVariable('APPDATA'), 'LabSync\'+path);
   if not TDirectory.Exists(BaseDir) then
      TDirectory.CreateDirectory(BaseDir);
   Result := BaseDir;
end;

end.
