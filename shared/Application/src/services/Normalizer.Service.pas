unit Normalizer.Service;

interface
 uses System.IOUtils, System.SysUtils;
  type
   TNormalize = Class
    public
     class function RemoveSpace(AValue: string): string;
  End;

implementation

{ TNormalize }

class function TNormalize.RemoveSpace(AValue: string): string;
begin
 trim(AValue);
end;

end.
