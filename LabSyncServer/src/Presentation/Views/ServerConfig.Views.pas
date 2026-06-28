unit ServerConfig.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Transporter.Dto, Server.Controller;

type
  TFrm_ServerConfig = class(TForm)
    Pnl_Background: TPanel;
    Scbx_SettingsContent: TScrollBox;
    Pnl_PortDNS: TPanel;
    Lbl_PortDnsTitle: TLabel;
    Pnl_Connection: TPanel;
    Lbl_ConnectionTitle: TLabel;
    Shp_Separator: TShape;
    Pnl_Close: TPanel;
    Lbl_Title: TLabel;
    Img_LabSyncIco: TImage;
    Lbl_TitleCaption: TLabel;
    Pnl_BtnClose: TPanel;
    Sbtn_Close: TSpeedButton;
    Lbl_serverAddress: TLabel;
    Lbl_ServerPort: TLabel;
    Lbl_StartServerAuto: TLabel;
    Lbl_BtnPassword: TLabel;
    Lbl_BtnBlockList: TLabel;
    Pnl_SettingsBtns: TPanel;
    Pnl_SaveBtn: TPanel;
    Sbtn_Save: TSpeedButton;
    Pnl_CancelBtn: TPanel;
    Sbtn_Cancel: TSpeedButton;
    Edt_ServerDns: TEdit;
    Edt_ServerPort: TEdit;
    Chbx_StartServerAuto: TCheckBox;
    Label1: TLabel;
    lbl_ServerIDExample: TLabel;
    Label3: TLabel;
    lbl_ServerVersionExample: TLabel;
    Label5: TLabel;
    lbl_ServerIPExample: TLabel;
    procedure Sbtn_CloseClick(Sender: TObject);
    procedure Sbtn_SaveClick(Sender: TObject);
    procedure Lbl_StartServerAutoClick(Sender: TObject);
    procedure Sbtn_CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FController : TServerControll;
    procedure ApplyData;
  public
    { Public declarations }
  end;

var
  Frm_ServerConfig: TFrm_ServerConfig;

implementation

{$R *.dfm}

procedure TFrm_ServerConfig.ApplyData;
begin
 Edt_ServerDns.Text  := Fcontroller.GetServer;
 Edt_ServerPort.Text := Fcontroller.GetPort;
 lbl_ServerIDExample.Caption      := FController.GetID;
 lbl_ServerVersionExample.Caption := FController.GetVersion;
 lbl_ServerIPExample.Caption      := FController.GetIp;
end;

procedure TFrm_ServerConfig.FormCreate(Sender: TObject);
begin
 FController  := TServerControll.Create;
 ApplyData;
end;

procedure TFrm_ServerConfig.Lbl_StartServerAutoClick(Sender: TObject);
begin
 //Simple status check
 if Chbx_StartServerAuto.State = cbUnchecked then
 begin
  Chbx_StartServerAuto.State := cbChecked;
 end
 else
  Chbx_StartServerAuto.State := cbUnchecked;
end;

procedure TFrm_ServerConfig.Sbtn_CloseClick(Sender: TObject);
begin
 Close;
end;

procedure TFrm_ServerConfig.Sbtn_SaveClick(Sender: TObject);
begin
 Showmessage('The changes will be applied when the server is restarted.');
 FController.SetPort(Edt_ServerPort.Text);
 FController.SetServer(Edt_ServerDns.Text);
 close;
end;

procedure TFrm_ServerConfig.Sbtn_CancelClick(Sender: TObject);
begin
 close;
end;

end.
