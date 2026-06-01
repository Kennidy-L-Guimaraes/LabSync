unit Principal.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Buttons, Vcl.ComCtrls,
  Server.Controller;

type
  TFrm_LabSyncServer = class(TForm)
    Pnl_Background: TPanel;
    Pnl_ComputerInfo: TPanel;
    Pnl_ComputerList: TPanel;
    Pnl_Logo: TPanel;
    Lbl_LabSyncAgent: TLabel;
    Img_logo: TImage;
    Shp_PanelMenu: TShape;
    Pnl_liveModeInformation: TPanel;
    Shp_AgentScreenMode: TShape;
    Lbl_AgentScreenMode: TLabel;
    Shp_AgentScreenModeCircle: TShape;
    Pnl_AgentScreen: TPanel;
    Img_AgentScreen: TImage;
    Pnl_QuickActions: TPanel;
    Shp_QuickActions: TShape;
    Pnl_InfoServer: TPanel;
    Shp_ServerInfo: TShape;
    Pnl_InfoAgents: TPanel;
    Shp_Agents: TShape;
    Pnl_Server: TPanel;
    Img_Server: TImage;
    Lbl_ServerName: TLabel;
    Lbl_ServerIP: TLabel;
    Lbl_ServerStatusExample: TLabel;
    Pnl_ServerTime: TPanel;
    Img_ServerTime: TImage;
    Lbl_ServerTimeConnection: TLabel;
    Lbl_ServerDate: TLabel;
    Lbl_ServerDateElapsed: TLabel;
    Shp_ServerSeparator: TShape;
    Pnl_BtnFullScreen: TPanel;
    Shp_BtnSullScreen: TShape;
    Lbl_BtnFullScreen: TLabel;
    Shp_AgentScreen: TShape;
    Pnl_BtnSaveScreen: TPanel;
    Shp_BtnSaveScreen: TShape;
    Lbl_BtnSaveScreen: TLabel;
    Pnl_RecentLogs: TPanel;
    Shp_Separator: TShape;
    Shp_AgentsSeparator: TShape;
    Pnl_MenuBtns: TPanel;
    Pnl_BtnSettings: TPanel;
    Img_BtnSettings: TImage;
    Shp_MenuSettings: TShape;
    Lbl_BtnSettings: TLabel;
    Sbtn_Settings: TSpeedButton;
    Pnl_BtnLogs: TPanel;
    Shp_MenuLogs: TShape;
    Img_BtnLogs: TImage;
    Lbl_BtnLogs: TLabel;
    Sbtn_Logs: TSpeedButton;
    Pnl_BtnAgentList: TPanel;
    Shp_MenuAgentList: TShape;
    Img_BtnAgentList: TImage;
    Lbl_BtnAgentList: TLabel;
    Sbtn_AgentList: TSpeedButton;
    Lbl_NetworkLab: TLabel;
    Lbl_ReturnIP: TLabel;
    Lbl_ReturnStatus: TLabel;
    Lbl_MachineStatus: TLabel;
    Lbl_LocalIP: TLabel;
    Lbl_MachineID: TLabel;
    Lbl_ReturnID: TLabel;
    Lbl_ReturnVersion: TLabel;
    Lbl_LabSyncVersion: TLabel;
    Lbl_ServerNameExample: TLabel;
    Lbl_ServerIPExample: TLabel;
    Lbl_ServerStatus: TLabel;
    Lbl_ServerTimeConnectionExample: TLabel;
    Lbl_ServerDateConnectionExample: TLabel;
    Lbl_ServerTimeElapsedExample: TLabel;
    Pnl_BtnSendCommand: TPanel;
    Shp_BtnSendCommand: TShape;
    Img_BtnSendCommand: TImage;
    Lbl_BtnSendCommand: TLabel;
    Sbtn_SendCommand: TSpeedButton;
    Lbl_QuickActions: TLabel;
    Pnl_BtnFileTransfer: TPanel;
    Shp_BtnFileTransfer: TShape;
    Img_BtnFileTransfer: TImage;
    Lbl_BtnFileTransfer: TLabel;
    SBtn_FileTransfer: TSpeedButton;
    Rch_LogReceiver: TRichEdit;
    Lbl_RecentLogs: TLabel;
    Pnl_Agents: TPanel;
    Lbl_Agents: TLabel;
    ScBox_Agents: TScrollBox;
    Pnl_AgentCS000: TPanel;
    Img_AgentExample: TImage;
    Lbl_AgentName: TLabel;
    Lbl_AgentNameExample: TLabel;
    Lbl_AgentIP: TLabel;
    Lbl_Status: TLabel;
    Lbl_StatusAgentExample: TLabel;
    Lbl_IPAgentExample: TLabel;
    Shp_btnAgentExample: TShape;
    Sbtn_AgentExample: TSpeedButton;
    procedure Pnl_BtnSettingsMouseEnter(Sender: TObject);
    procedure Sbtn_SettingsMouseEnter(Sender: TObject);
    procedure Sbtn_SettingsMouseLeave(Sender: TObject);
    procedure Sbtn_LogsMouseEnter(Sender: TObject);
    procedure Sbtn_LogsMouseLeave(Sender: TObject);
    procedure Sbtn_AgentListMouseEnter(Sender: TObject);
    procedure Sbtn_AgentListMouseLeave(Sender: TObject);
    procedure Sbtn_SendCommandMouseEnter(Sender: TObject);
    procedure Sbtn_SendCommandMouseLeave(Sender: TObject);
    procedure SBtn_FileTransferMouseLeave(Sender: TObject);
    procedure SBtn_FileTransferMouseEnter(Sender: TObject);
    procedure Sbtn_AgentExampleMouseEnter(Sender: TObject);
    procedure Sbtn_AgentExampleMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FController : TServerControll;
  public
    { Public declarations }
    procedure ApplyColor(const AShape: TShape);
    procedure RemoveColor(const AShape: TShape);
    procedure ApplyData;
  end;

var
  Frm_LabSyncServer: TFrm_LabSyncServer;

implementation

{$R *.dfm}

{ TFrm_LabSyncServer }

procedure TFrm_LabSyncServer.FormCreate(Sender: TObject);
begin
 FController := TServerControll.Create;
 FController.InitializeIfNeeded;
 ApplyData;
end;

procedure TFrm_LabSyncServer.ApplyColor(const AShape: TShape);
begin
 AShape.Brush.Color := ClRed;
end;

procedure TFrm_LabSyncServer.ApplyData;
begin
 Lbl_ServerNameExample.Caption           := FController.GetID;
 Lbl_ServerDateConnectionExample.Caption := FController.GetDate;
end;

procedure TFrm_LabSyncServer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 FController.Free;
end;

procedure TFrm_LabSyncServer.Pnl_BtnSettingsMouseEnter(Sender: TObject);
begin
 ApplyColor(Shp_MenuSettings);
end;

procedure TFrm_LabSyncServer.RemoveColor(const AShape: TShape);
begin
 AShape.Brush.Color := Shp_panelMenu.Brush.Color;
end;

procedure TFrm_LabSyncServer.Sbtn_SettingsMouseEnter(Sender: TObject);
begin
 ApplyColor(Shp_MenuSettings);
end;

procedure TFrm_LabSyncServer.Sbtn_SettingsMouseLeave(Sender: TObject);
begin
 RemoveColor(Shp_MenuSettings);
end;

procedure TFrm_LabSyncServer.Sbtn_LogsMouseEnter(Sender: TObject);
begin
 ApplyColor(Shp_MenuLogs);
end;

procedure TFrm_LabSyncServer.Sbtn_LogsMouseLeave(Sender: TObject);
begin
 RemoveColor(Shp_MenuLogs);
end;

procedure TFrm_LabSyncServer.Sbtn_AgentListMouseEnter(Sender: TObject);
begin
 ApplyColor(Shp_MenuAgentList);
end;

procedure TFrm_LabSyncServer.Sbtn_AgentListMouseLeave(Sender: TObject);
begin
 RemoveColor(Shp_MenuAgentList);
end;

procedure TFrm_LabSyncServer.Sbtn_AgentExampleMouseEnter(Sender: TObject);
begin
  ApplyColor(Shp_btnAgentExample);
end;

procedure TFrm_LabSyncServer.Sbtn_AgentExampleMouseLeave(Sender: TObject);
begin
  RemoveColor(Shp_btnAgentExample);
end;

procedure TFrm_LabSyncServer.Sbtn_SendCommandMouseEnter(Sender: TObject);
begin
  ApplyColor(Shp_BtnSendCommand);
end;

procedure TFrm_LabSyncServer.Sbtn_SendCommandMouseLeave(Sender: TObject);
begin
 RemoveColor(Shp_BtnSendCommand);
end;

procedure TFrm_LabSyncServer.SBtn_FileTransferMouseEnter(Sender: TObject);
begin
 ApplyColor(Shp_BtnFileTransfer);
end;

procedure TFrm_LabSyncServer.SBtn_FileTransferMouseLeave(Sender: TObject);
begin
  RemoveColor(Shp_BtnFileTransfer);
end;

end.
