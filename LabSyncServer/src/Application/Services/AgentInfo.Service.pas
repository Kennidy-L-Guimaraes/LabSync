unit AgentInfo.Service;

interface
type
  TAgentInfo = class
  private
    {Private Declarations}
    FID: string;
    FIP: string;
    FConnectedAt : TDateTime;
  public
    {Public Declarations}
    property ID: string read FID write FID;
    property IP: string read FIP write FIP;
    property ConnectedAt: TDateTime read FConnectedAt write FConnectedAt;
  end;
implementation

end.
