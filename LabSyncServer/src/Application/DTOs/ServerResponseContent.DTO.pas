unit ServerResponseContent.DTO;

interface
  type
   TCommandType = (ctRequest, ctResponse);
  type
   TServerResponseContent = Record
     public
      ServerID      : string;
      Version       : string;
      TimeStamp     : TdateTime;
      CommandType   : TCommandType;
      CommandId     : string;
      CommandTarget : string;
      CommandName   : string;
      CommandValue  : string;
      function CommandTypeToStr(ACommandType: TCommandType): string;
   End;

implementation

{ TServerResponseContent }

function TServerResponseContent.CommandTypeToStr(
  ACommandType: TCommandType): string;
begin
  case ACommandType of
        ctRequest:
        Result := 'request';

       ctResponse:
        Result := 'response';
  else
    Result := '';
  end;
end;

end.
