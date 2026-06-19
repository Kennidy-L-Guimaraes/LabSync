unit AgentCard.Component;

interface
uses Vcl.Graphics, Vcl.ExtCtrls, Vcl.ActnCtrls, Vcl.StdCtrls, Vcl.Buttons, Classes, Vcl.Controls, SysUtils;
 type
 TAgentCard = class(TPanel)
   private
    {Private Declarations}
    FShape       : TShape;
    FImage       : TImage;
    FLabel       : TLabel;
    FSpeedButton : TSpeedbutton;
    FLabelStatus : string;
    FColorLabel  : TColor;
    procedure CreateShape;
    procedure CreateImage(const Apicture: TPicture);
    procedure CreateLabels(const AName: string; const AIp: string; const AStatus: string);
    procedure CreateSpeedButton;
    function CreateLabel(const ACaption: string; const Atop, Aleft, Awidth, Aheight: integer; const Acolor: TColor):TLabel;
    procedure EventEnter(Sender: TObject);
    procedure EventLeave(Sender: TObject);
    procedure ConfigurePanel(const AParent: TWinControl);
   public
    {Public Declarations}
    constructor CreateComponent(AOwner: TComponent; AParent: TWinControl; APicture: TPicture; const AName: string; const AIp: string; const AStatus: string);
 end;

implementation

procedure TAgentCard.ConfigurePanel(const AParent: TWinControl);
begin
  Width := 210;
  Height:= 90;
  Align := alTop;
  UseDockManager := True;
  BevelOuter     := bvNone;
  Parent         := AParent;
end;

{ TCardFactory }

constructor TAgentCard.CreateComponent(AOwner: TComponent; AParent: TWinControl; Apicture: TPicture; const AName: string; const AIp: string; const AStatus: string);
begin
  inherited Create(AOwner);
  ConfigurePanel(AParent);
  CreateShape;
  CreateImage(Apicture); //Necessary Data
  CreateLabels(AName, AIp, AStatus);
  CreateSpeedButton;
end;

procedure TAgentCard.CreateImage(const Apicture: TPicture);
begin
 FImage := Timage.Create(self);
 try
  FImage.Parent := self;
  FImage.Left   := 5;
  FImage.Top    := 18;
  FImage.Width  := 35;
  FImage.Height := 50;
  FImage.Proportional := True;
  Fimage.Picture := Apicture;
 finally

 end;
end;

function TAgentCard.CreateLabel(const ACaption: string; const Atop, Aleft,
  Awidth, Aheight: integer; const Acolor: TColor): TLabel;
var
 MyLabel : Tlabel;
begin
 MyLabel := TLabel.Create(Self);
 try
  MyLabel.Parent      := Self;
  MyLabel.Font.Height := -12;
  MyLabel.Left        := Aleft;
  MyLabel.Top         := Atop;
  MyLabel.Width       := Awidth;
  MyLabel.Height     := Aheight;
  MyLabel.Font.Size  := 9;
  MyLabel.Caption    := ACaption;
  Mylabel.Font.Color := AColor;

 finally

 end;
end;

procedure TAgentCard.CreateLabels(const AName: string; const AIp: string; const AStatus: string);
var
 ColorLabel: TColor;
 Status    : string;
begin
  ColorLabel := $00DFDFDF;
  Status     := trim(AStatus);
  CreateLabel('Server Status: ', 57, 46, 79, 17, ColorLabel);
  CreateLabel('Agent: ', 11, 46, 37, 17, ColorLabel);
  CreateLabel('Agent IP: ', 34, 46, 52, 17, ColorLabel);
  createLabel(AName, 11, 91, 79, 17, ColorLabel);
  if sametext(status, 'active') then
   begin
    CreateLabel(AIp, 34, 104, 93, 17, TColor(ClLime));
    CreateLabel(AStatus, 57, 131, 44, 17, TColor(ClLime))
   end
  else
   begin
    CreateLabel(AIp, 34, 104, 93, 17, TColor($008080FF));
    CreateLabel(AStatus, 57, 131, 44, 17, TColor($008080FF))
   end;
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
  FSpeedButton := TSpeedButton.Create(self);
  try
   FSpeedButton.Parent  := self;
   FSpeedButton.Cursor  := crHandPoint;
   FSpeedButton.Align   := alClient;
   FSpeedButton.Flat    := True;
   FSpeedButton.OnMouseEnter := EventEnter;
   FSpeedButton.OnMouseLeave := EventLeave;
  finally

  end;
end;

procedure TAgentCard.EventEnter(Sender: TObject);
begin
 FShape.Brush.Color := clred;
end;

procedure TAgentCard.EventLeave(Sender: TObject);
begin
 FShape.Brush.Color := $001B1B1B;
end;

end.
