unit ServerResponseEnvelope.Classes;

interface
 uses ServerResponseContent.DTO, System.SysUtils;
  type
   TServerResponseEnvelope = class
   public
     class function CreateEnvelope(AContent : TServerResponseContent): string;
   end;

implementation

{ TServerResponseEnvelope }

uses   System.JSON, Normalizer.Service, System.Hash, CryptDecrypt.Service;

class function TServerResponseEnvelope.CreateEnvelope(
  AContent: TServerResponseContent): string;
  var
  LCommandTarget: string;
  LCommandName  : string;
  LCommandValue : string;
  LJsonObj      : TJSONObject;
  LKeyBytes     : TBytes;
  LNonceName    : string;
  LNonceValue   : string;
begin
  LCommandTarget := TNormalize.RemoveSpace(AContent.CommandTarget);
  LCommandName   := TNormalize.RemoveSpace(AContent.CommandName);
  LCommandValue  := AContent.CommandValue;
  LKeyBytes      := THashSHA2.GetHashBytes('Example1234');
  LJsonObj := TJSONObject.Create;
  try
    LJsonObj.AddPair('commandTarget', LCommandTarget);
    LJsonObj.AddPair('commandName', TCrypt.Encrypt(LCommandName, LKeyBytes, LNonceName));
    LJsonObj.AddPair('commandValue', TCrypt.Encrypt(LCommandValue, LKeyBytes, LNonceValue));
    Result := LJsonObj.ToJSON;
  finally
    LJsonObj.Free;
  end;
end;

end.
