unit AgentCard.Manager;

interface
uses AgentCard.Component, Sysutils, Classes, Vcl.Forms, Vcl.Graphics, System.Generics.Collections,
  AgentInfo.Service;
type
 TAgentCardManager = class //Manager
   private
    {Private Declarations}
    FOwner     : TComponent;
    FContainer : TScrollBox;
    FPicture   : Tpicture;
    FCards     : TObjectDictionary<string, TAgentCard>;
    FAgents    : TObjectDictionary<string, TAgentInfo>;
   public
    {Public Declarations}
    procedure RegisterAgent(const AId, AMachineUser, AIp: string);
    procedure RemoveAgent(const AId: string);
    constructor Create(AOwner: TComponent;  AContainer: TScrollBox; Apicture: TPicture);
    destructor Destroy;
 end;

implementation

{ TAgentCardManager }

constructor TAgentCardManager.Create(AOwner: TComponent;  AContainer: TScrollBox; Apicture: TPicture);
begin
 inherited create;
 FOwner     := AOwner;
 FContainer := AContainer;
 FPicture   := Apicture;
 FCards     := TObjectDictionary<string, TAgentCard>.Create([doOwnsValues]);
 FAgents    := TObjectDictionary<string, TAgentInfo>.Create([doOwnsValues]);
end;

destructor TAgentCardManager.Destroy;
begin
  FCards.Free;
  FAgents.Free;
  inherited;
end;

procedure TAgentCardManager.RegisterAgent(const AId, AMachineUser, AIp: string);
var
 Card : TAgentCard;
 Agent: TAgentInfo;
begin
 try
   if FCards.ContainsKey(AId) then
    Exit;
    Card    := TAgentCard.CreateComponent(FOwner, FContainer, Fpicture, AId, AMachineUser, AIp, 'Active');
    Agent   := TAgentInfo.Create;

    FCards.Add(AId, Card);  //Add in List

    //Agent List
    Agent.ID := AId;
    Agent.IP := AIp;
    FAgents.Add(AId, Agent);
 except on E: Exception do
  raise Exception.create(format('Register Agent Failed Error: %s', [E.Message]));
 end;
end;

procedure TAgentCardManager.RemoveAgent(const AId: string);
begin
 FCards.Remove(AId);
 FAgents.Remove(AId);
end;

end.
