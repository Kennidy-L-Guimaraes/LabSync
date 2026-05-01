unit Principal.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Command.Parser,
  Command.Dispatcher, Command.Logs, Vcl.ExtCtrls, ID.Service, IOUtils,
  Screenshot.Queue, Vcl.Imaging.jpeg, Transporter.Dto, Vcl.Imaging.pngimage,
  Vcl.ComCtrls, Vcl.Buttons, Config.Service, GetSysInfo.Command;

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
    Panel1: TPanel;
    Panel2: TPanel;
    TryIcon_LabSyncAgent: TTrayIcon;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer_AgentLiveModeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GetSysData;
    procedure GetLogs;
    procedure CreateObj;
    procedure ToggleAndSave(const Key: string; ALabel: TLabel; AShape: TShape);
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
    procedure FirstConfig;
    procedure LoadConfig;
    procedure ApplyVisualState(ALabel: TLabel; AShape: TShape);
    procedure SpeedButton1Click(Sender: TObject);
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
  Config      : TConfig;
  ID          : TID;

implementation
{
 Please note that LABSYNC is not malicious software.
 It is an official project that synchronizes computers on the same network to follow administrator instructions
  such as shutdowns, updates, and compliance checks according to company policy.
 It is not hidden, and although it performs actions in the background, they are not malicious.
}
{$R *.dfm}

procedure TFrm_LabSyncAgent.ApplyVisualState(ALabel: TLabel; AShape: TShape);
begin
  if SameText(ALabel.Caption, 'Enabled') then
  begin
    AShape.Brush.Color := clLime;
    AShape.Pen.Color   := clLime;
  end
  else
  begin
    AShape.Brush.Color := clRed;
    AShape.Pen.Color   := clRed;
  end;
end;

procedure TFrm_LabSyncAgent.CreateObj;
begin
 Dispatcher   := TCommandDispatcher.Create;
 Log          := TLog.Create;
 Config       := TConfig.Create;
 ID           := TID.Create;
end;

procedure TFrm_LabSyncAgent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Log.Free;
 Dispatcher.Free;
 Config.Free;
 ID.Free;
end;

procedure TFrm_LabSyncAgent.FormCreate(Sender: TObject);
begin
 CreateObj; //Create the objects first.
 Config.Initialize;
 HideForm;
 LoadConfig;
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
 Command := '$get_sysinfo target='+TId.GetID;
 Transporter := Dispatcher.Execute(Command, Config, ecLocal);
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
  if Config.AlreadyStarted = False then
   begin
    FirstConfig;
    Config.SetStarted(True);
   end
   else
   begin
    Hide
   end;
end;

procedure TFrm_LabSyncAgent.Lbl_StateCommandsClick(Sender: TObject);
begin
 ToggleAndSave('Commands',Lbl_StateCommands, Shp_StateCommands);
end;

procedure TFrm_LabSyncAgent.Lbl_StateDownloadsClick(Sender: TObject);
begin
  ToggleAndSave('Downloads',Lbl_StateDownloads, Shp_stateDownloads)
end;

procedure TFrm_LabSyncAgent.Lbl_StateFoldersClick(Sender: TObject);
begin
 ToggleAndSave('Folders',Lbl_StateFolders, Shp_StateFolders);
end;

procedure TFrm_LabSyncAgent.Lbl_StateInformationClick(Sender: TObject);
begin
  ToggleAndSave('Information',Lbl_StateInformation, Shp_StateInformation);
end;

procedure TFrm_LabSyncAgent.Lbl_StateLiveModeClick(Sender: TObject);
begin
  ToggleAndSave('LiveMode',Lbl_StateLiveMode, Shp_StateLiveMode);
end;

procedure TFrm_LabSyncAgent.Lbl_StateMessagesClick(Sender: TObject);
begin
 ToggleAndSave('Messages',Lbl_StateMessages, Shp_StateMessages);
end;

procedure TFrm_LabSyncAgent.Lbl_StateRegistryClick(Sender: TObject);
begin
  ToggleAndSave('Registry',Lbl_StateRegistry, Shp_StateRegistry);
end;

procedure TFrm_LabSyncAgent.Lbl_StateScreenShotClick(Sender: TObject);
begin
 ToggleAndSave('Screenshot', Lbl_StateScreenShot, Shp_StateScreenshot);
end;

procedure TFrm_LabSyncAgent.Lbl_StateShutdownClick(Sender: TObject);
begin
  ToggleAndSave('Shutdown',Lbl_StateShutdown, Shp_StateShutdown);
end;

procedure TFrm_LabSyncAgent.LoadConfig;
begin
  Lbl_StateScreenShot.Caption :=  Config.GetOptionAsDisplay('Screenshot');
  Lbl_StateLiveMode.Caption   :=  Config.GetOptionAsDisplay('LiveMode');
  Lbl_StateMessages.Caption   :=  Config.GetOptionAsDisplay('Messages');
  Lbl_StateDownloads.Caption  :=  Config.GetOptionAsDisplay('Downloads');
  Lbl_StateShutdown.Caption   :=  Config.GetOptionAsDisplay('Shutdown');
  Lbl_StateRegistry.Caption   :=  Config.GetOptionAsDisplay('Registry');
  Lbl_StateFolders.Caption    :=  Config.GetOptionAsDisplay('Folders');
  Lbl_StateCommands.Caption   :=  Config.GetOptionAsDisplay('Commands');
  Lbl_StateInformation.Caption:=  Config.GetOptionAsDisplay('Information');

  ApplyVisualState(Lbl_StateScreenShot, Shp_StateScreenshot);
  ApplyVisualState(Lbl_StateLiveMode,   Shp_StateLiveMode);
  ApplyVisualState(Lbl_StateMessages,   Shp_StateMessages);
  ApplyVisualState(Lbl_StateDownloads,  Shp_StateDownloads);
  ApplyVisualState(Lbl_StateShutdown,   Shp_StateShutdown);
  ApplyVisualState(Lbl_StateRegistry,   Shp_StateRegistry);
  ApplyVisualState(Lbl_StateFolders,    Shp_StateFolders);
  ApplyVisualState(Lbl_StateCommands,   Shp_StateCommands);
  ApplyVisualState(Lbl_StateInformation,Shp_StateInformation);
end;

procedure TFrm_LabSyncAgent.FirstConfig;
begin
  Config.SetOption('Screenshot', osEnabled);
  Config.SetOption('LiveMode',   osEnabled);
  Config.SetOption('Messages',   osEnabled);
  Config.SetOption('Downloads',  osEnabled);
  Config.SetOption('Shutdown',   osEnabled);
  Config.SetOption('Registry',   osEnabled);
  Config.SetOption('Folders',    osEnabled);
  Config.SetOption('Commands',   osEnabled);
  Config.SetOption('Information', osEnabled);
end;

procedure TFrm_LabSyncAgent.SpeedButton1Click(Sender: TObject);
begin
 Frm_LabSyncAgent.Close;
end;

procedure TFrm_LabSyncAgent.Timer_AgentLiveModeTimer(Sender: TObject);
var
  Stream : TMemoryStream;
  Jpg    : TJPEGImage;
begin
  {var
  Stream : TMemoryStream;
  Jpg    : TJPEGImage;
  Transporter : TCommandResult;
  Command     : string;
begin
  Command := '$get_print quality=100 target='+TId.GetID;
  Transporter := Dispatcher.Execute(Command, Config, ecLocal);
  if TScreenshotStreamQueue.Dequeue(Stream) then
  try
    Stream.Position := 0;

    Jpg := TJPEGImage.Create;
    try
      Jpg.LoadFromStream(Stream);
      Image1.Picture.Bitmap.Assign(Jpg);
    finally
      Jpg.Free;
    end;

  finally
    Stream.Free;
  end;
end;}
end;

procedure TFrm_LabSyncAgent.Timer_LogReceiverTimer(Sender: TObject);
begin
 GetLogs;
end;

procedure TFrm_LabSyncAgent.ToggleAndSave(const Key: string; ALabel: TLabel; AShape: TShape);
var
  State: TOptionState;
begin
  // pega estado real do config (não do label)
  State := Config.GetOption(Key);

  // inverte
  if State = osEnabled then
    State := osDisabled
  else
    State := osEnabled;

  // salva no arquivo
  Config.SetOption(Key, State);

  // atualiza UI com base no valor REAL salvo
  ALabel.Caption := Config.GetOptionAsDisplay(Key);
  ApplyVisualState(ALabel, AShape);
end;

procedure TFrm_LabSyncAgent.TryIcon_LabSyncAgentClick(Sender: TObject);
begin
 Frm_LabSyncAgent.Show;
end;

end.
