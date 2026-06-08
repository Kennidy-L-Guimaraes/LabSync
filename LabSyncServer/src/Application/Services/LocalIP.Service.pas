unit LocalIP.Service;
interface
uses IdStack, IdStackWindows;
 type
  TLocalIPService = class
    private
     {Private Declarations}
    public
     {Public Declarations}
     function GetServerIp: string;

  end;

implementation

{ TLocalIPService }

function TLocalIPService.GetServerIp: string;
begin
  Result := '127.0.0.1'; //Default
  TIdStack.IncUsage;
  try
    if Assigned(GStack) then
      Result := GStack.LocalAddress;
  finally
    TIdStack.DecUsage;
  end;
end;

end.
