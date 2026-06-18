unit AgentCard.Component;

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
    procedure CreateSpeedButton(const AEventEnter: TNotifyEvent; const AEventLeave: TNotifyEvent);
   public
    {Public Declarations}
    constructor CreateComponent(AOwner: TComponent; AParent: TWinControl; APicture: TPicture; AEventEnter: TNotifyEvent; const AEventLeave: TNotifyEvent);
 end;

implementation

{ TCardFactory }

constructor TAgentCard.CreateComponent(AOwner: TComponent; AParent: TWinControl; Apicture: TPicture; AEventEnter: TNotifyEvent; const AEventLeave: TNotifyEvent);
begin
  inherited Create(AOwner);
  Width := 210;
  Height:= 90;
  Align := alTop;
  UseDockManager := True;
  BevelOuter     := bvNone;
  Parent         := AParent;

  CreateShape;
  CreateImage(Apicture); //Necessary Data
  CreateLabel;
  CreateSpeedButton(AEventEnter, AEventLeave);
end;

procedure TAgentCard.CreateImage(const Apicture: TPicture);
begin
 FImage := Timage.Create(self);
 try
  FImage.Parent := self;
  FImage.Top    := 11;
  FImage.Width  := 42;
  FImage.Height := 63;
  FImage.Proportional := True;
  Fimage.Picture := Apicture;
 finally

 end;
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

procedure TAgentCard.CreateSpeedButton(const AEventEnter: TNotifyEvent;
  const AEventLeave: TNotifyEvent);
begin
  FSpeedButton := TSpeedButton.Create(self);
  try
   FSpeedButton.Parent  := self;
   FSpeedButton.Cursor  := crHandPoint;
   FSpeedButton.Align   := alClient;
   FSpeedButton.Flat    := True;
   FSpeedButton.OnMouseEnter := AEventEnter;
   FSpeedButton.OnMouseEnter := AEventLeave;
  finally

  end;
end;

end.
