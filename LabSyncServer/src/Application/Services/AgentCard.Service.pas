unit AgentCard.Service;

interface
uses Vcl.Graphics, Vcl.ExtCtrls, Vcl.ActnCtrls, Vcl.StdCtrls, Vcl.Buttons, Classes, Vcl.Controls;
 type
 TAgentCard = class(TPanel)
   private
    {Private Declarations}
    FShape       : TShape;
    FImage       : TImage;
    FLabel       : TLabel;
    FSpeedButton : TSpeedbutton;

    procedure CreatePanel;
    procedure CreateShape;
    procedure CreateImage(const Apicture: TPicture);
    procedure CreateLabel;
    procedure CreateSpeedButton;
   public
    {Public Declarations}

    constructor Create(AOwner: TComponent; Apicture: TPicture); override;
 end;

implementation

{ TCardFactory }

constructor TAgentCard.Create(AOwner: TComponent; Apicture: TPicture);
begin
  //inherited;

  CreateShape;
  CreateImage(Apicture); //Necessary Data
  CreateLabel;
  CreateSpeedButton;
end;

procedure TAgentCard.CreateImage(const Apicture: TPicture);
begin

end;

procedure TAgentCard.CreateLabel;
begin

end;

procedure TAgentCard.CreatePanel;
begin

end;

procedure TAgentCard.CreateShape;
begin
 FShape := TShape.Create(Self);
 try
 FShape.Parent  := Self;
 FShape.Align       := alClient;
 FShape.Brush.Color := TColor(1776411);
 FShape.Pen.Color   := TColor(2697513);
 finally

 end;
end;

procedure TAgentCard.CreateSpeedButton;
begin

end;

end.
