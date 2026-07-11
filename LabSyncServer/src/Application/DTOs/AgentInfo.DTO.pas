unit AgentInfo.DTO;

interface
 type
  TAgentInfoDto = record
   private
    {Private Declarations}

   public
    {Public Declarations}
    procedure  load(const AID, AIP, AUser, AStatus: string);
    var
     AgentID    : string;
     AgentIP    : string;
     AgentUser  : string;
     AgentStatus: string;
  end;

implementation

{ TAgentInfo }

procedure TAgentInfoDto.load(const AID, AIP, AUser, AStatus: string);
begin
  if (AgentID = AID) and
     (AgentIP = AIP) and
     (AgentUser = AUser) and
     (AgentStatus = AStatus) then
    Exit;

  AgentID     := AID;
  AgentIP     := AIP;
  AgentUser   := AUser;
  AgentStatus := AStatus;

end;

end.
