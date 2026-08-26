unit ServerResponseEnvelope.Classes;

interface
 uses ServerResponseContent.DTO, System.SysUtils, Dialogs, System.DateUtils, DECRandom;
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
  LTimestamp    : TDateTime;
  LCommandTarget: string;
  LCommandName  : string;
  LCommandValue : string;
  LJsonObj      : TJSONObject;
  LKeyBytes     : TBytes;
  LCommandID    : string;
  LNonceName    : string;
  LNonceValue   : string;
begin
  LCommandTarget := TNormalize.RemoveSpace(AContent.CommandTarget);
  LCommandName   := TNormalize.RemoveSpace(AContent.CommandName);
  LCommandValue  := AContent.CommandValue;
  LKeyBytes      := THashSHA2.GetHashBytes('Example1234');
  LCommandID     := GUIDToString(TGUID.NewGuid);

  LJsonObj := TJSONObject.Create;

  try
    LjsonObj.AddPair('serverid', AContent.ServerID);
    LJsonObj.AddPair('commandid', LCommandID);
    LjsonObj.AddPair('version', AContent.Version);
    LjsonObj.AddPair('type', AContent.CommandTypeToStr(AContent.CommandType));
    LJsonObj.AddPair('timestamp', DateToISO8601(AContent.TimeStamp, False));

    LJsonObj.AddPair('commandTarget', LCommandTarget);
    LJsonObj.AddPair('commandName', TCrypt.Encrypt(LCommandName, LKeyBytes, LNonceName));
    LJsonObj.AddPair('commandValue', TCrypt.Encrypt(LCommandValue, LKeyBytes, LNonceValue));
    Result := LJsonObj.ToJSON;
  finally
    LJsonObj.Free;
  end;
end;

end.
