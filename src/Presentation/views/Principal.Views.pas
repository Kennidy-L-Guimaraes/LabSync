unit Principal.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Command.Parser,
  Command.Dispatcher, Command.Logs, Vcl.ExtCtrls, ID.Service, IOUtils,
  Screenshot.Queue, Vcl.Imaging.jpeg, Transporter.Dto, Vcl.Imaging.pngimage,
  Vcl.ComCtrls, Vcl.Buttons, Config.Service, GetSysInfo.Command,
  Agent.Controller, Vcl.Menus, CommandParsed.Dto, Message.Views, Warning.Views;

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
    Edt_Server: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    TryIcon_LabSyncAgent: TTrayIcon;
    Image1: TImage;
    PopMenu_TryIcon: TPopupMenu;
    Close1: TMenuItem;
    Show1: TMenuItem;
    Img_port: TImage;
    Edt_Port: TEdit;
    BitBtn1: TBitBtn;
    Timer_ShellSecurity: TTimer;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer_AgentLiveModeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToggleAndUpdateUI(const Key: string; ALabel: TLabel; AShape: TShape);
    procedure Timer_LogReceiverTimer(Sender: TObject);
    procedure LoadConfig;
    procedure ApplyVisualState(ALabel: TLabel; AShape: TShape);
    procedure SpeedButton1Click(Sender: TObject);
    procedure OptionClick(Sender: TObject);
    function  FindShapeForLabel(ALabel: TLabel): TShape;
    procedure GetSysData;
    procedure GetLogs;
    procedure Close1Click(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Lbl_ApplyServerClick(Sender: TObject);
    procedure Lbl_StateCommandsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer_ShellSecurityTimer(Sender: TObject);
  private
    { Private declarations }
      FController : TAgentController;
      FShellEnabledUntil : TDateTime;
  public
    { Public declarations }
  end;

  var
  Frm_LabSyncAgent    : TFrm_LabSyncAgent;

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

procedure TFrm_LabSyncAgent.BitBtn1Click(Sender: TObject);
var
  Command      : TCommandParsed;
  CommandConcat: string;
  Transporter  : TCommandResult;
  Id           : TID;
  Dispatcher   : TCommandDispatcher;
  Config       : TConfig;
  Parser       : TCommandParser;
begin
  Config       := Tconfig.Create;
  Dispatcher   := TCommandDispatcher.Create;
  ID           := TId.Create;
  try
  Command.Name  := '$show_msg';
  Command.Target:= ('target='+Id.GetID);
  Command.Value := 'value=This is an example of a message you might receive from the other LabSync Commander. You might also receive emojis.🙂';
  CommandConcat        := Command.Name + ' ' + Command.Value +' ' + Command.Target;
  Transporter   := Dispatcher.Execute(CommandConcat, Config, ecRemote);
  finally
   Config.Free;
   Dispatcher.Free;
   ID.Free;
  end;
end;

procedure TFrm_LabSyncAgent.Close1Click(Sender: TObject);
begin
 Frm_LabSyncAgent.Close;
end;

function TFrm_LabSyncAgent.FindShapeForLabel(ALabel: TLabel): TShape;
begin
  if ALabel = Lbl_StateDownloads     then Result    := Shp_StateDownloads
  else if ALabel = Lbl_StateCommands then Result    := Shp_StateCommands
  else if ALabel = Lbl_StateFolders  then Result    := Shp_StateFolders
  else if ALabel = Lbl_StateRegistry then Result    := Shp_StateRegistry
  else if ALabel = Lbl_StateShutdown then Result    := Shp_StateShutdown
  else if ALabel = Lbl_StateMessages then Result    := Shp_StateMessages
  else if ALabel = Lbl_StateLiveMode then Result    := Shp_StateLiveMode
  else if ALabel = Lbl_StateScreenShot  then Result := Shp_StateScreenshot
  else if ALabel = Lbl_StateInformation then Result := Shp_StateInformation
  else Result := nil;
end;

procedure TFrm_LabSyncAgent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 FController.ShellSecurity;
 FController.Free;
end;

procedure TFrm_LabSyncAgent.FormCreate(Sender: TObject);
begin
 FController   := TAgentController.Create;
 Timer_LogReceiver.Enabled := True;
 FController.InitializeIfNeeded;
 //FController.ShellSecurity;
 LoadConfig;
 GetSysData;
 GetLogs;
end;

procedure TFrm_LabSyncAgent.FormDestroy(Sender: TObject);
begin
 FController.ShellSecurity;
end;

procedure TFrm_LabSyncAgent.GetLogs;
var
  Logs: TStringList;
  i: Integer;
  Line: string;
begin
  Logs := TStringList.Create;
  try
    Logs.Text := FController.GetLogs;

    Rch_LogReceiver.Lines.BeginUpdate;
    try
      Rch_LogReceiver.Clear;

      for i := 0 to Logs.Count - 1 do
      begin
        Line := Logs[i];

        //SUCCESS = Green
        if Pos('SUCCESS', Line) > 0 then
          Rch_LogReceiver.SelAttributes.Color := clLime

        //ERROR = Red
        else if Pos('ERROR', Line) > 0 then
          Rch_LogReceiver.SelAttributes.Color := clRed

        //CONFIG = Blue
        else if Pos('CONFIG', Line) > 0 then
          Rch_LogReceiver.SelAttributes.Color := clAqua

       //SHELL-ENABLED
       else if Pos('SHELL-ENABLED', line) > 0 then
          Rch_LogReceiver.SelAttributes.Color := clyellow

       //SHELL-DISABLE
       else if Pos('SHELL-DISABLE', line) > 0 then
          Rch_LogReceiver.SelAttributes.Color := clred

        //Default
        else
          Rch_LogReceiver.SelAttributes.Color := clSilver;
          Rch_LogReceiver.SelText := Line + sLineBreak;

      end;

    finally
      Rch_LogReceiver.Lines.EndUpdate;
    end;

    Rch_LogReceiver.SelStart := Rch_LogReceiver.GetTextLen;
    Rch_LogReceiver.SelLength := 0;
    Rch_LogReceiver.Perform(WM_VSCROLL, SB_BOTTOM, 0);

  finally
    Logs.Free;
  end;
end;

procedure TFrm_LabSyncAgent.GetSysData;
 var
 SysInfo  : Tstringlist;
begin
 SysInfo  := TStringList.Create;
 try
  SysInfo.Text := FController.GetSysInfo.Text;
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

procedure TFrm_LabSyncAgent.Lbl_ApplyServerClick(Sender: TObject);
var
  Key: string;
  Lbl: TLabel;
  Warning: TFrm_Warning;
begin
  Warning := TFrm_Warning.Create(nil);
  try
   Warning.RchEdt_Warning.Text := 'This Agent will now receive remote commands from:'+ SlineBreak +
   Edt_Server.Text + Edt_Port.Text + SlineBreak +
   ' You may update this server address or restrict remote access at any time through the main menu.' +
   ' For security purposes, all communications remain protected by end-to-end encryption.';
   if Warning.ShowModal = mrYes then
   begin
    FController.SetServer(Trim(Edt_Server.Text));
    FController.SetPort(Trim(Edt_Port.Text));
   end
   else
   exit;
  finally
   Warning.free;
  end;

end;

procedure TFrm_LabSyncAgent.Lbl_StateCommandsClick(Sender: TObject);
var
  Key: string;
  Lbl: TLabel;
  Warning: TFrm_Warning;
  Timestamp: string;
  StartTime: TDateTime;
begin
  if not (Sender is TLabel) then
    Exit;

  Lbl := TLabel(Sender);
  Key := Lbl.Hint;

  if FController.Commands = 'Enabled' then
  begin
    ToggleAndUpdateUI(Key, Lbl, FindShapeForLabel(Lbl));
  end
  else
  begin
    Warning := TFrm_Warning.Create(nil);
  try
   Warning.RchEdt_Warning.Text :=
  'Shell command execution is a powerful feature that grants the Commander ' +
  'the ability to run any command on this machine, including system-level operations.' +
    #13#10#13#10 +
  'For security reasons, this option will automatically be disabled after 50 minutes. ' +
  'It will also be immediately disabled if the computer is shut down or LabSync Agent is closed.' +
    #13#10#13#10 +
  'Shell commands received while this option is disabled will be refused.' +
    #13#10#13#10 +
  'Do you want to enable Shell execution?';
  if Warning.ShowModal = mrYes then
   begin
    StartTime := now;
    ToggleAndUpdateUI(Key, Lbl, FindShapeForLabel(Lbl));
    TimeStamp := FormatDateTime('yyyymmdd_hhnnss', Now);
    TLog.ShellState(FormatDateTime('yyyymmdd_hhnnss', Now), TID.GetID, 'Enabled');
    //50 minutes
    FShellEnabledUntil := Now + EncodeTime(0, 50, 0, 0);
    Timer_ShellSecurity.Enabled := True;
    end;
  finally
    Warning.Free;
  end;
  end;
end;

procedure TFrm_LabSyncAgent.LoadConfig;
begin
  FController.GetValues;
  Lbl_StateScreenShot.Caption :=  FController.Screenshot;
  Lbl_StateLiveMode.Caption   :=  FController.LiveMode;
  Lbl_StateMessages.Caption   :=  FController.Messages;
  Lbl_StateDownloads.Caption  :=  FController.Downloads;
  Lbl_StateShutdown.Caption   :=  FController.Shutdown;
  Lbl_StateRegistry.Caption   :=  FController.Registry;
  Lbl_StateFolders.Caption    :=  FController.Folders;
  Lbl_StateCommands.Caption   :=  FController.Commands;
  Lbl_StateInformation.Caption:=  FController.Information;
  Edt_Server.Text             :=  FController.Server;
  Edt_Port.Text               :=  FController.Port;

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

procedure TFrm_LabSyncAgent.OptionClick(Sender: TObject);
 var
  Key: string;
  Lbl: TLabel;
begin
  if not (Sender is TLabel) then Exit;

  Lbl := TLabel(Sender);
  Key := Lbl.Hint;

  ToggleAndUpdateUI(Key, Lbl, FindShapeForLabel(Lbl));
end;

procedure TFrm_LabSyncAgent.Show1Click(Sender: TObject);
begin
 Frm_LabSyncAgent.Show;
end;

procedure TFrm_LabSyncAgent.SpeedButton1Click(Sender: TObject);
begin
 Frm_LabSyncAgent.Close;
end;

procedure TFrm_LabSyncAgent.Timer_AgentLiveModeTimer(Sender: TObject);
//var
  //Stream : TMemoryStream;
  //Jpg    : TJPEGImage;
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
  getlogs;
end;

procedure TFrm_LabSyncAgent.Timer_ShellSecurityTimer(Sender: TObject);
var
 Timestamp: string;
 StartTime: TDateTime;
begin
 if Now >= FShellEnabledUntil then
   begin
    StartTime := now;
    ToggleAndUpdateUI(Lbl_StateCommands.hint, Lbl_StateCommands, FindShapeForLabel(Lbl_StateCommands));
    FController.ShellSecurity;
    Timer_ShellSecurity.Enabled := False;
    Timestamp := FormatDateTime('yyyymmdd_hhnnss', Now);
    TLog.ShellState(Timestamp, TID.GetID, FController.GetOptionDisplay('Commands'));;
   end;
end;

procedure TFrm_LabSyncAgent.ToggleAndUpdateUI(const Key: string; ALabel: TLabel; AShape: TShape);
var
  State: TOptionState;
begin
  State := FController.ToggleOption(Key);
  FController.GetValues;
  ALabel.Caption := FController.GetOptionDisplay(Key);
  ApplyVisualState(ALabel, AShape);
end;

end.
