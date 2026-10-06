unit SendMessageBox.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TFrm_MessageBox = class(TForm)
    Pnl_Background: TPanel;
    Mem_Message: TMemo;
    Shp_AgentScreen: TShape;
    Panel1: TPanel;
    Pnl_SaveBtn: TPanel;
    Sbtn_Save: TSpeedButton;
    Pnl_CancelBtn: TPanel;
    Sbtn_Cancel: TSpeedButton;
    Panel2: TPanel;
    Image1: TImage;
    Shape1: TShape;
    Shape2: TShape;
    Lbl_RecentLogs: TLabel;
    Lbl_Target: TLabel;
    Label1: TLabel;
    procedure Sbtn_CancelClick(Sender: TObject);
    procedure Sbtn_SaveClick(Sender: TObject);
    procedure Mem_MessageClick(Sender: TObject);
    procedure Mem_MessageKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FMessages: string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ATarget: string); reintroduce;
    property Messages : string read FMessages;
    procedure CleanText;
  end;

var
  Frm_MessageBox: TFrm_MessageBox;

implementation

{$R *.dfm}

{ TFrm_MessageBox }

procedure TFrm_MessageBox.CleanText;
begin
   if Trim(Mem_Message.Text) = 'Write your message here...' then
    Mem_Message.Clear
  else
    Exit;
end;

constructor TFrm_MessageBox.Create(AOwner: TComponent; ATarget: string);
begin
 inherited create(AOwner);
 if SameText(ATarget, '') then
 ATarget := 'No target selected';
 Lbl_Target.Caption := ATarget;
end;

procedure TFrm_MessageBox.Mem_MessageClick(Sender: TObject);
begin
 CleanText;
end;

procedure TFrm_MessageBox.Mem_MessageKeyPress(Sender: TObject; var Key: Char);
begin
 CleanText;
end;

procedure TFrm_MessageBox.Sbtn_CancelClick(Sender: TObject);
begin
 FMessages   := '';
 ModalResult := mrCancel;
end;

procedure TFrm_MessageBox.Sbtn_SaveClick(Sender: TObject);
begin
 FMessages   := Mem_Message.Text;
 ModalResult := mrOk;
end;

end.
