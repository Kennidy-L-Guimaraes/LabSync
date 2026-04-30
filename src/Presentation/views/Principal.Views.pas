unit Principal.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Command.Parser,
  Command.Dispatcher, Command.Logs, Vcl.ExtCtrls, ID.Service, IOUtils,
  Screenshot.Queue, Vcl.Imaging.jpeg, Transporter.Dto, Vcl.Imaging.pngimage,
  Vcl.ComCtrls;

type
  TFrm_LabSyncAgent = class(TForm)
    Pnl_Background: TPanel;
    Timer_AgentLiveMode: TTimer;
    Pnl_AgentStatus: TPanel;
    Shp_AgentStatus: TShape;
    Lbl_MachineInformation: TLabel;
    Lbl_MachineName: TLabel;
    Lbl_MachineCPU: TLabel;
    Lbl_MachineRAM: TLabel;
    Lbl_LocalIP: TLabel;
    Lbl_MachineStatus: TLabel;
    Lbl_ReturnName: TLabel;
    Lbl_ReturCPU: TLabel;
    Lbl_ReturnRAM: TLabel;
    Lbl_ReturnIP: TLabel;
    Lbl_ReturnStatus: TLabel;
    Lbl_NetworkLab: TLabel;
    Shp_Separator: TShape;
    Pnl_Options: TPanel;
    Lbl_MachineUser: TLabel;
    Lbl_ReturnMachineUser: TLabel;
    Lbl_ReturnID: TLabel;
    Lbl_MachineID: TLabel;
    Lbl_ReturnVersion: TLabel;
    Lbl_LabSyncVersion: TLabel;
    Pnl_LogReceiver: TPanel;
    Shp_LogReceiver: TShape;
    Pnl_Log: TPanel;
    Lbl_ExecutingCommands: TLabel;
    Img_LogReceiver: TImage;
    Rch_LogReceiver: TRichEdit;
    Lbl_CommandReceiver: TLabel;
    Timer_LogReceiver: TTimer;
    Pnl_AboutOpt: TPanel;
    Shp_AboutOpt: TShape;
    Lbl_Permission: TLabel;
    Lbl_Description: TLabel;
    Lbl_Status: TLabel;
    Pnl_Separator: TPanel;
    Pnl_Information: TPanel;
    Shp_BtnInformation: TShape;
    Img_Information: TImage;
    Lbl_PermissionInformation: TLabel;
    Lbl_DescriptionInformation: TLabel;
    Shp_StateInformation: TShape;
    Lbl_StateInformation: TLabel;
    Pnl_Commands: TPanel;
    Shp_BtnCommands: TShape;
    Img_Commands: TImage;
    Lbl_PermissionCommands: TLabel;
    Lbl_DescriptionCommands: TLabel;
    Shp_StateCommands: TShape;
    Lbl_StateCommands: TLabel;
    Pnl_Folders: TPanel;
    Shp_BtnFolders: TShape;
    Img_Folders: TImage;
    Lbl_PermissionFolders: TLabel;
    Lbl_DescriptionFolders: TLabel;
    Shp_StateFolders: TShape;
    Lbl_StateFolders: TLabel;
    Pnl_Registry: TPanel;
    Shp_BtnRegistry: TShape;
    Img_Registry: TImage;
    Lbl_PermissionRegistry: TLabel;
    Lbl_DescriptionRegistry: TLabel;
    Shp_StateRegistry: TShape;
    Lbl_StateRegistry: TLabel;
    Pnl_Shutdown: TPanel;
    Shp_BtnShutdown: TShape;
    Img_Shutdown: TImage;
    Lbl_PermissionShutdown: TLabel;
    Lbl_DescriptionShutdown: TLabel;
    Shp_StateShutdown: TShape;
    Lbl_StateShutdown: TLabel;
    Pnl_Downloads: TPanel;
    Shp_BtnDownload: TShape;
    Img_Downloads: TImage;
    Lbl_PermissionDownload: TLabel;
    Lbl_DescriptionDownload: TLabel;
    Shp_StateDownloads: TShape;
    Lbl_StateDownloads: TLabel;
    Pnl_Messages: TPanel;
    Shp_BtnMessages: TShape;
    Img_Messages: TImage;
    Lbl_PermissionMessage: TLabel;
    Lbl_DescriptionMessages: TLabel;
    Shp_StateMessages: TShape;
    Lbl_StateMessages: TLabel;
    Pnl_LiveMode: TPanel;
    Shp_BtnLiveMode: TShape;
    Img_LiveMode: TImage;
    Lbl_PermissionLiveMode: TLabel;
    Lbl_DescriptionLiveMode: TLabel;
    Shp_StateLiveMode: TShape;
    Lbl_StateLiveMode: TLabel;
    Pnl_Screenshot: TPanel;
    Shp_BtnScreenshot: TShape;
    Img_Screenshot: TImage;
    Lbl_PermissionScreenshot: TLabel;
    Lbl_DescriptionScreenshot: TLabel;
    Shp_StateScreenshot: TShape;
    Lbl_StateScreenShot: TLabel;
    Lbl_LabSyncAgent: TLabel;
    Pnl_Connection: TPanel;
    Shp_ConnectServer: TShape;
    Img_Server: TImage;
    Lbl_ApplyServer: TLabel;
    Edt_ConnectServer: TEdit;
    TryIcon_LabSyncAgent: TTrayIcon;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer_AgentLiveModeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GetSysData;
    procedure GetLogs;
    procedure CreateObj;
    procedure ToggleStatus(ALabel: TLabel; AShape: TShape);
    procedure Timer_LogReceiverTimer(Sender: TObject);
    procedure Lbl_StateScreenShotClick(Sender: TObject);
    procedure Lbl_StateLiveModeClick(Sender: TObject);
    procedure Lbl_StateMessagesClick(Sender: TObject);
    procedure Lbl_StateDownloadsClick(Sender: TObject);
    procedure Lbl_StateShutdownClick(Sender: TObject);
    procedure Lbl_StateRegistryClick(Sender: TObject);
    procedure Lbl_StateFoldersClick(Sender: TObject);
    procedure Lbl_StateCommandsClick(Sender: TObject);
    procedure Lbl_StateInformationClick(Sender: TObject);
    procedure TryIcon_LabSyncAgentClick(Sender: TObject);
    procedure HideForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_LabSyncAgent    : TFrm_LabSyncAgent;
  Log         : Tlog;
  Transporter : TCommandResult;
  Dispatcher  : TCommandDispatcher;

implementation
{
 Please note that LABSYNC is not malicious software.
 It is an official project that synchronizes computers on the same network to follow administrator instructions
  such as shutdowns, updates, and compliance checks according to company policy.
 It is not hidden, and although it performs actions in the background, they are not malicious.
}
{$R *.dfm}

procedure TFrm_LabSyncAgent.CreateObj;
begin
 Dispatcher   := TCommandDispatcher.Create;
 Log          := TLog.Create;
end;

procedure TFrm_LabSyncAgent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Log.Free;
end;

procedure TFrm_LabSyncAgent.FormCreate(Sender: TObject);
begin
 CreateObj;
 GetSysData;
 GetLogs;
 Timer_LogReceiver.Enabled := True;
end;

procedure TFrm_LabSyncAgent.GetLogs;
var
  Content: string;
begin
  Content := Log.ReadLogs('Audit.log');
  if Content = '' then
    Exit;
  Rch_LogReceiver.Lines.BeginUpdate;
  try
    Rch_LogReceiver.Text := Content;
  finally
    Rch_LogReceiver.Lines.EndUpdate;
  end;
  Rch_LogReceiver.SelStart := Length(Rch_LogReceiver.Text);
  Rch_LogReceiver.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TFrm_LabSyncAgent.GetSysData;
 var
 Command : string;
 SysInfo  : Tstringlist;
begin
 Command := '$get_sysinfo target=all';
 Transporter := Dispatcher.Execute(Command);
 SysInfo  := TStringList.Create;
 try
  SysInfo.Text := Transporter.Text;
  SysInfo.NameValueSeparator    := '=';
  Lbl_ReturnName.Caption        := SysInfo.Values['Name'];
  Lbl_ReturCPU.Caption          := SysInfo.Values['CPU'];
  Lbl_ReturnRAM.Caption         := SysInfo.Values['RAM'];
  Lbl_ReturnID.Caption          := SysInfo.Values['ID'];
  Lbl_ReturnIP.Caption          := SysInfo.Values['IP'];
  Lbl_ReturnStatus.Caption      := SysInfo.Values['Status'];
  Lbl_ReturnMachineUser.Caption := SysInfo.Values['UserName'];
  Lbl_ReturnVersion.Caption     := SysInfo.Values['Version'];
  Lbl_CommandReceiver.Caption   := SysInfo.Values['ID'] + ' ' + SysInfo.Values['UserName'];
 finally
  SysInfo.Free;
 end;
end;

procedure TFrm_LabSyncAgent.HideForm;
begin
 Self.Hide;
 Visible := False;
end;

procedure TFrm_LabSyncAgent.Lbl_StateCommandsClick(Sender: TObject);
begin
 ToggleStatus(Lbl_StateCommands, Shp_StateCommands);
end;

procedure TFrm_LabSyncAgent.Lbl_StateDownloadsClick(Sender: TObject);
begin
  ToggleStatus(Lbl_StateDownloads, Shp_stateDownloads)
end;

procedure TFrm_LabSyncAgent.Lbl_StateFoldersClick(Sender: TObject);
begin
 ToggleStatus(Lbl_StateFolders, Shp_StateFolders);
end;

procedure TFrm_LabSyncAgent.Lbl_StateInformationClick(Sender: TObject);
begin
  ToggleStatus(Lbl_StateInformation, Shp_StateInformation);
end;

procedure TFrm_LabSyncAgent.Lbl_StateLiveModeClick(Sender: TObject);
begin
  ToggleStatus(Lbl_StateLiveMode, Shp_StateLiveMode);
end;

procedure TFrm_LabSyncAgent.Lbl_StateMessagesClick(Sender: TObject);
begin
 ToggleStatus(Lbl_StateMessages, Shp_StateMessages);
end;

procedure TFrm_LabSyncAgent.Lbl_StateRegistryClick(Sender: TObject);
begin
  ToggleStatus(Lbl_StateRegistry, Shp_StateRegistry);
end;

procedure TFrm_LabSyncAgent.Lbl_StateScreenShotClick(Sender: TObject);
begin
 ToggleStatus(Lbl_StateScreenShot, Shp_StateScreenshot);
end;

procedure TFrm_LabSyncAgent.Lbl_StateShutdownClick(Sender: TObject);
begin
  ToggleStatus(Lbl_StateShutdown, Shp_StateShutdown);
end;

procedure TFrm_LabSyncAgent.Timer_AgentLiveModeTimer(Sender: TObject);
var
  Stream : TMemoryStream;
  Jpg    : TJPEGImage;
begin
  {if TScreenshotStreamQueue.Dequeue(Stream) then
  try
    Stream.Position := 0;

    Jpg := TJPEGImage.Create;
    try
      Jpg.LoadFromStream(Stream);
      Img_AgentLiveMode.Picture.Bitmap.Assign(Jpg);
    finally
      Jpg.Free;
    end;

  finally
    Stream.Free;
  end;}
end;

procedure TFrm_LabSyncAgent.Timer_LogReceiverTimer(Sender: TObject);
begin
 GetLogs;
end;

procedure TFrm_LabSyncAgent.ToggleStatus(ALabel: TLabel; AShape: TShape);
const
  EnabledText  = 'Enabled';
  DisabledText = 'Disabled';
begin
  if SameText(ALabel.Caption, EnabledText) then
  begin
    ALabel.Caption := DisabledText;
    AShape.Brush.Color := Clred;
    AShape.Pen.Color   := ClRed;
  end
  else
  begin
    ALabel.Caption := EnabledText;
    AShape.Brush.Color := ClLime;
    Ashape.Pen.Color   := ClLime;
  end;
end;

procedure TFrm_LabSyncAgent.TryIcon_LabSyncAgentClick(Sender: TObject);
begin
 Frm_LabSyncAgent.Show;
end;

end.
