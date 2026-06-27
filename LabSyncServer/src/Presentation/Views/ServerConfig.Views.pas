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
    Lbl_ServerIP: TLabel;
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
    Edt_ServerIP: TEdit;
    Chbx_StartServerAuto: TCheckBox;
    procedure Sbtn_CloseClick(Sender: TObject);
    procedure Sbtn_SaveClick(Sender: TObject);
    procedure Lbl_StartServerAutoClick(Sender: TObject);
    procedure Sbtn_CancelClick(Sender: TObject);
  private
    { Private declarations }
    FController : TServerControll;
  public
    { Public declarations }
  end;

var
  Frm_ServerConfig: TFrm_ServerConfig;

implementation

{$R *.dfm}

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
 close;
end;

procedure TFrm_ServerConfig.Sbtn_CancelClick(Sender: TObject);
begin
 close;
end;

end.
