unit Principal.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Buttons, Vcl.ComCtrls,
  Server.Controller, IdContext, AgentCard.Component, ServerConfig.Views, DateUtils,
  GetLog.Service, ApplicationMode.types;

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
    Lbl_serverAddressExample: TLabel;
    Lbl_ServerPortExample: TLabel;
    Lbl_ServerPort: TLabel;
    Lbl_serverAddress: TLabel;
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
    Timer_ElapsedTime: TTimer;
    Timer_UpDateLiveMode: TTimer;
    Pnl_StartServer: TPanel;
    Shp_StartServer: TShape;
    Lbl_StartServer: TLabel;
    Pnl_ShutdownServer: TPanel;
    Shp_ShutdownServer: TShape;
    Lbl_ShutdownServer: TLabel;
    Timer_UpdateLog: TTimer;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Lbl_Agents: TLabel;
    Shape1: TShape;
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
    procedure Timer_ElapsedTimeTimer(Sender: TObject);
    procedure Sbtn_SettingsClick(Sender: TObject);
    procedure Lbl_ShutdownServerClick(Sender: TObject);
    procedure Lbl_StartServerClick(Sender: TObject);
    procedure Timer_UpdateLogTimer(Sender: TObject);
  private
    { Private declarations }
    FController : TServerControll;
    FStartTime  : TDateTime;
    FGetLogs    : TGetLogService;
  public
    { Public declarations }
    procedure ApplyColor(const AShape: TShape);
    procedure RemoveColor(const AShape: TShape);
    procedure ApplyData;
    procedure NoResize;
    procedure CreateObjs;
    procedure DestroyObjs;

end;

var
  Frm_LabSyncServer: TFrm_LabSyncServer;

implementation

{$R *.dfm}

{ TFrm_LabSyncServer }

procedure TFrm_LabSyncServer.FormCreate(Sender: TObject);
begin
 CreateObjs;
 FStartTime := now;
 NoResize;
 FController.CreateComponents(self, ScBox_Agents, Img_AgentExample.Picture);
 FController.InitializeIfNeeded;
 FController.ConnectServer;
 ApplyData;
end;


procedure TFrm_LabSyncServer.Lbl_ShutdownServerClick(Sender: TObject);
begin
 FController.DisconnectServer;
end;

procedure TFrm_LabSyncServer.Lbl_StartServerClick(Sender: TObject);
begin
 FController.ConnectServer;
end;

procedure TFrm_LabSyncServer.NoResize;
  var
  MAX_WIDTH  : integer;
  MAX_HEIGHT : integer;
begin
  MAX_WIDTH  := Frm_LabSyncServer.Width;  //NewValuesHere
  MAX_HEIGHT := Frm_LabSyncServer.Height; //NewValuesHere
  Constraints.MaxWidth := MAX_WIDTH;
  Constraints.MinWidth := MAX_WIDTH;
  Constraints.MaxHeight:= MAX_HEIGHT;
  Constraints.MinHeight:= MAX_HEIGHT;
end;

procedure TFrm_LabSyncServer.ApplyColor(const AShape: TShape);
begin
 AShape.Brush.Color := $0017110C;
end;

procedure TFrm_LabSyncServer.ApplyData;
begin
 Lbl_ServerNameExample.Caption           := FController.GetID;
 Lbl_ReturnID.Caption                    := Fcontroller.GetID;
 Lbl_ReturnVersion.caption               := FController.GetVersion;
 Lbl_ServerDateConnectionExample.Caption := FController.GetDate;
 Lbl_serverAddressExample.Caption        := FController.GetServer;
 Lbl_serverAddressExample.Hint           := FController.GetServer;
 Lbl_ServerPortExample.Caption           := FController.GetPort;
 Lbl_ServerIPExample.Caption             := FController.GetIp;
end;

procedure TFrm_LabSyncServer.CreateObjs;
begin
 FGetLogs    := TGetLogService.Create(amServer);
 FController := TServerControll.Create;
end;

procedure TFrm_LabSyncServer.DestroyObjs;
begin
 FGetLogs.Free;
 FController.Free;
end;

procedure TFrm_LabSyncServer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 FController.DisconnectServer;
 DestroyObjs;
end;

procedure TFrm_LabSyncServer.Pnl_BtnSettingsMouseEnter(Sender: TObject);
begin
 ApplyColor(Shp_MenuSettings);
end;

procedure TFrm_LabSyncServer.RemoveColor(const AShape: TShape);
begin
 AShape.Brush.Color := Shp_panelMenu.Brush.Color;
end;

procedure TFrm_LabSyncServer.Sbtn_SettingsClick(Sender: TObject);
begin
 Frm_ServerConfig.Show;
end;

procedure TFrm_LabSyncServer.Sbtn_SettingsMouseEnter(Sender: TObject);
begin
 ApplyColor(Shp_MenuSettings);
end;

procedure TFrm_LabSyncServer.Sbtn_SettingsMouseLeave(Sender: TObject);
begin
 RemoveColor(Shp_MenuSettings);
end;

procedure TFrm_LabSyncServer.Timer_ElapsedTimeTimer(Sender: TObject);
var
  Hour, Minute, Second: Integer;
  ElapsedSeconds: int64;
  MyColor : TColor;
begin
 if FController.IsTheServerActive = true then
 begin
  MyColor := Cllime;
  Lbl_ServerNameExample.Font.Color           := MyColor;
  Lbl_ServerTimeConnectionExample.Font.Color := MyColor;
  Lbl_ServerDateConnectionExample.Font.Color := MyColor;
  Lbl_ServerTimeElapsedExample.Font.Color    := MyColor;
  Lbl_ServerStatus.Font.Color                := MyColor;
  Lbl_ServerIPExample.Font.Color             := MyColor;
  Lbl_ServerStatus.Caption                   := 'Active';
  Lbl_ServerTimeConnectionExample.Caption    := FormatDateTime('hh:mm:ss', FStartTime);
  ElapsedSeconds := SecondsBetween(Now, FStartTime);
  Hour   := ElapsedSeconds div 3600;
  Minute := (ElapsedSeconds mod 3600) div 60;
  Second := ElapsedSeconds mod 60;
  Lbl_ServerTimeElapsedExample.Caption :=
  Format('%.2d:%.2d:%.2d', [Hour, Minute, Second]);
 end
 else
 begin
  MyColor := $005353FF;
  Lbl_ServerNameExample.Font.Color           := MyColor;
  Lbl_ServerTimeConnectionExample.Font.Color := MyColor;
  Lbl_ServerDateConnectionExample.Font.Color := MyColor;
  Lbl_ServerTimeElapsedExample.Font.Color    := MyColor;
  Lbl_ServerStatus.Font.Color                := MyColor;
  Lbl_ServerIPExample.Font.Color             := MyColor;
  Lbl_ServerStatus.Caption                 := 'Inactive';
 end;
end;

procedure TFrm_LabSyncServer.Timer_UpdateLogTimer(Sender: TObject);
begin
 FGetLogs.CreateComponent(Rch_LogReceiver);
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
