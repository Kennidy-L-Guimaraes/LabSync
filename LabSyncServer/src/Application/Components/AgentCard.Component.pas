unit AgentCard.Component;

interface
uses Vcl.Graphics, Vcl.ExtCtrls, Vcl.ActnCtrls, Vcl.StdCtrls, Vcl.Buttons, Classes, Vcl.Controls, SysUtils, AgentInfo.DTO;
 type
  TAgentSelectedEvent = procedure(Sender: TObject) of object;
 type
 TAgentCard = class(TPanel)
   private
    {Private Declarations}
    FOnAgentSelected: TAgentSelectedEvent;
    FAgentInfo   : TAgentInfoDto;
    FID          : string;
    FIP          : string;
    FUser        : string;
    FStatus      : string;
    FShape       : TShape;
    FImage       : TImage;
    FLabel       : TLabel;
    FSpeedButton : TSpeedbutton;
    FLabelStatus : string;
    FColorLabel  : TColor;
    procedure CreateShape;
    procedure CreateImage(const Apicture: TPicture);
    procedure CreateLabels(const AUser, AID: string; const AIp: string; const AStatus: string);
    procedure CreateSpeedButton;
    function  CreateLabel(const ACaption: string; const Atop, Aleft, Awidth, Aheight: integer; const Acolor: TColor):TLabel;
    procedure EventEnter(Sender: TObject);
    procedure EventLeave(Sender: TObject);
    procedure ConfigurePanel(const AParent: TWinControl);
    procedure MyButtonClick(Sender: TObject);

   public
    {Public Declarations}
    property ID    : string read FID;
    property IP    : string read FIP;
    property User  : string read FUser;
    property Status: string read FStatus;
    constructor CreateComponent(AOwner: TComponent; AParent: TWinControl;
            Apicture: TPicture; const AID, AUser: string; const AIp: string; const AStatus: string);
    property OnAgentSelected: TAgentSelectedEvent read FOnAgentSelected write FOnAgentSelected;
 end;

implementation

procedure TAgentCard.ConfigurePanel(const AParent: TWinControl);
begin
  Width := 218;
  Height:= 95;
  Align := alTop;
  UseDockManager := True;
  BevelOuter     := bvNone;
  Parent         := AParent;
end;

{ TCardFactory }

constructor TAgentCard.CreateComponent(AOwner: TComponent; AParent: TWinControl;
            Apicture: TPicture; const AID, AUser: string; const AIp: string; const AStatus: string);
begin
  inherited Create(AOwner);
  FID     := AID;
  FIP     := AIP;
  FUser   := AUser;
  FStatus := AStatus;
  ConfigurePanel(AParent);
  CreateShape;
  CreateImage(Apicture); //Necessary Data
  CreateLabels(AUser, AID, AIp, AStatus);
  CreateSpeedButton;
end;

procedure TAgentCard.CreateImage(const Apicture: TPicture);
begin
 FImage := Timage.Create(self);
 try
  FImage.Parent := self;
  FImage.Left   := 10;
  FImage.Top    := 25;
  FImage.Width  := 50;
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
  Result := MyLabel;
 finally

 end;
end;

procedure TAgentCard.CreateLabels(const AUser, AID: string; const AIp: string; const AStatus: string);
var
  ColorOpt   : TColor;
  ColorInfo  : TColor;
  Status     : string;
  Lbl        : TLabel;
  Height     : Integer;
  Left       : Integer;
  Spacing    : Integer;
begin
  ColorOpt  := $00DFDFDF;
  ColorInfo := $004F403A;
  Status    := Trim(AStatus);

  Left     := 75;
  Height   := 17;
  Spacing  := 6;

  // Machine
  Lbl := CreateLabel('Machine:', 9, Left, 56, Height, ColorOpt);
  CreateLabel(AUser, Lbl.Top, lbl.Left + Lbl.Width + Spacing, 80, Lbl.Height, Colorinfo);

  // Agent
  Lbl := CreateLabel('Agent:', 32, Left, 37, Height, ColorOpt);
  CreateLabel(AID, Lbl.Top, Lbl.Left + Lbl.Width + Spacing, 79, Lbl.Height, Colorinfo);

  // Agent IP
  Lbl := CreateLabel('Agent IP:', 55, Left, 52, Height, ColorOpt);

  if SameText(Status, 'active') then
    CreateLabel(AIp, Lbl.Top, Lbl.Left + Lbl.Width + Spacing, 93, Lbl.Height, clLime)
  else
    CreateLabel(AIp, Lbl.Top, Lbl.Left + Lbl.Width + Spacing, 93, Lbl.Height, TColor($008080FF));

  // Server Status
  Lbl := CreateLabel('Status:', 78, Left, 79, Height, ColorOpt);

  if SameText(Status, 'active') then
    CreateLabel(AStatus, Lbl.Top, Lbl.Left + Lbl.Width + Spacing, 44, Lbl.Height, clLime)
  else
    CreateLabel(AStatus, Lbl.Top, Lbl.Left + Lbl.Width + Spacing, 44, Lbl.Height, TColor($008080FF));
end;

procedure TAgentCard.CreateShape;
begin
 FShape := TShape.Create(Self);
 try
 FShape.Parent  := Self;
 FShape.Align       := alClient;
 FShape.Brush.Color := TColor($0017110C);
 FShape.Shape       := stRectangle;
 FShape.Pen.Color   := TColor($004F403A);
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
   FSpeedButton.OnClick      := MyButtonClick;
   FSpeedButton.OnMouseEnter := EventEnter;
   FSpeedButton.OnMouseLeave := EventLeave;
  finally

  end;
end;

procedure TAgentCard.EventEnter(Sender: TObject);
begin
 FShape.Brush.Color := $0017110C;
end;

procedure TAgentCard.EventLeave(Sender: TObject);
begin
 FShape.Brush.Color := $0017110C;
end;

procedure TAgentCard.MyButtonClick(Sender: TObject);
begin
 if Assigned(FOnAgentSelected) then
    FOnAgentSelected(Self);
end;

end.
