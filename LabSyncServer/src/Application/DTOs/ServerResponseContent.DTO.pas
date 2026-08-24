unit ServerResponseContent.DTO;

interface
  type
   TServerResponseContent = Record
     public
      CommandTarget : string;
      CommandName   : string;
      CommandValue  : string;
      TimeStamp     : TdateTime;
   End;

implementation

end.
