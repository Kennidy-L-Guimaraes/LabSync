unit Transporter.Dto;

interface
uses Classes;
  type
   TExecutionContext = (ecLocal, ecRemote);
  type
   TResultTypes = (crtNone, crtText, crtStream);
  type
   TCommandResult = record
   public
    Success : Boolean;
    DataType: TResultTypes;
    Text    : string;
    Stream  : TStream;
    Error   : string;
  end;
  type
  TStreamResult = class
    Stream: TStream;
    destructor Destroy; override;
  end;


implementation

{ TStreamResult }

destructor TStreamResult.Destroy;
begin
  Stream.Free;
  inherited;
end;

end.
