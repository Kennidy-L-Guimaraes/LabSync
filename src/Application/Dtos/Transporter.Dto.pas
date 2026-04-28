unit Transporter.Dto;

interface
uses Classes;
  type
   TResultTypes = (crtNone, crtText, crtStream);
  type
   TCommandResult = record
    Success : Boolean;
    DataType: TResultTypes;
    Text    : string;
    Stream  : TStream;
    Error   : string;
  end;


implementation

end.
