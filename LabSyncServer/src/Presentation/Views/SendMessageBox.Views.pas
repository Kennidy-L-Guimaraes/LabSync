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
    Lbl_RecentLogs: TLabel;
    Label1: TLabel;
    Lbl_Target: TLabel;
    Pnl_SettingsBtns: TPanel;
    Pnl_SaveBtn: TPanel;
    Sbtn_Save: TSpeedButton;
    Image2: TImage;
    Pnl_CancelBtn: TPanel;
    Sbtn_Cancel: TSpeedButton;
    Image1: TImage;
    procedure Sbtn_CancelClick(Sender: TObject);
    procedure Sbtn_SaveClick(Sender: TObject);
  private
    { Private declarations }
    FMessages: string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ATarget: string); reintroduce;
    property Messages : string read FMessages;
  end;

var
  Frm_MessageBox: TFrm_MessageBox;

implementation

{$R *.dfm}

{ TFrm_MessageBox }

constructor TFrm_MessageBox.Create(AOwner: TComponent; ATarget: string);
begin
 inherited create(AOwner);
 if SameText(ATarget, '') then
 ATarget := 'No target selected';
 Lbl_Target.Caption := ATarget;
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
