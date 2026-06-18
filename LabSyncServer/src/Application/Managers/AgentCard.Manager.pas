unit AgentCard.Manager;

interface
uses AgentCard.Component, Sysutils, Classes, Vcl.Forms, Vcl.Graphics, System.Generics.Collections;
type
 TAgentCardManager = class //Manager
   private
    {Private Declarations}
    FOwner     : TComponent;
    FContainer : TScrollBox;
    FPicture   : Tpicture;
    FCards: TObjectDictionary<string, TAgentCard>;
   public
    {Public Declarations}
    procedure RegisterAgent(Const AId: string; const AIp: string);
    constructor Create(AOwner: TComponent;  AContainer: TScrollBox; Apicture: TPicture);
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
end;

procedure TAgentCardManager.RegisterAgent(const AId, AIp: string);
var
 Card : TAgentCard;
begin
 try
   if FCards.ContainsKey(AId) then
    Exit;
    Card := TAgentCard.CreateComponent(FOwner, FContainer, Fpicture, AId, AIp, 'Active');
    FCards.Add(AId, Card);  //Add in List
 except on E: Exception do
  raise Exception.create(format('Register Agent Failed Error: %s', [E.Message]));
 end;
end;

end.
