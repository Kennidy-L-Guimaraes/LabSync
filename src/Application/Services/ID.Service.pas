unit ID.Service;

interface
 uses Windows, SysUtils, Path.Service, System.Classes, System.IOUtils;
 type
  TId = class
    public
     {Public Declarations}
     class procedure CreateNewID;
     class function GetID : string;
    private
     {Private Declarations}
     class function NewID : string;
  end;

implementation

{ TId }

class function TId.GetID: string;
var
  Lines: TStringList;
  FilePath: string;
begin
  FilePath := TPath.Combine(
    TPathService.PathLabSync('Machine'),
    'MachineId.pc'
  );

  if not FileExists(FilePath) then
    CreateNewID;

  Lines := TStringList.Create;
  try
    Lines.LoadFromFile(FilePath);
    Result := Lines.Values['ID'];
  finally
    Lines.Free;
  end;
end;

class function TId.NewID: string;
var
 ID : string;
begin
  ID     := 'CS:' + Copy(TGUID.NewGuid.ToString, 2, 8);
  Result := ID;
end;

class procedure TId.CreateNewID;
var
  PathDir  : string;
  FilePath : string;
  Lines    : TStringList;
begin
  PathDir  := TPathService.PathLabSync('Machine');
  FilePath := TPath.Combine(PathDir, 'MachineId.pc');
  ForceDirectories(PathDir);
  if FileExists(FilePath) then
    Exit;
  Lines := TStringList.Create;
  try
    Lines.Values['Date'] := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
    Lines.Values['ID']   := NewID;
    Lines.Values['Name'] := GetEnvironmentVariable('COMPUTERNAME');

    Lines.SaveToFile(FilePath, TEncoding.UTF8);
  finally
    Lines.Free;
  end;
end;

end.
