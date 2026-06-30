unit Principal.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Command.Parser,
  Command.Dispatcher, Command.Logs, Vcl.ExtCtrls, ID.Service, IOUtils,
  Screenshot.Queue, Vcl.Imaging.jpeg, Transporter.Dto, Vcl.Imaging.pngimage,
  Vcl.ComCtrls, Vcl.Buttons, Config.Service, GetSysInfo.Command,
  Agent.Controller, Vcl.Menus, CommandParsed.Dto, Message.Views, Warning.Views,
  LogViewer.Views, Controller.Dto, IdTCPClient, GetLog.Service,
  ApplicationMode.types;

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
    Image_Logo: TImage;
    PopMenu_TryIcon: TPopupMenu;
    Close1: TMenuItem;
    Show1: TMenuItem;
    Img_port: TImage;
    Edt_Port: TEdit;
    Timer_ShellSecurity: TTimer;
    Lbl_ViewAllLogs: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    image1: TImage;
    Button2: TButton;
    Lbl_ServerStatus: TLabel;
    Lbl_ServerStatusResponse: TLabel;
    Timer_UpdateServer: TTimer;
    Lbl_TryAgain: TLabel;
    Lbl_Disconnect: TLabel;
    Lbl_NetworkLab: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer_AgentLiveModeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer_LogReceiverTimer(Sender: TObject);
    procedure ApplyVisualState(ALabel: TLabel; AShape: TShape);
    procedure SpeedButton1Click(Sender: TObject);
    procedure OptionClick(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Lbl_ApplyServerClick(Sender: TObject);
    procedure Lbl_StateCommandsClick(Sender: TObject);
    procedure Timer_ShellSecurityTimer(Sender: TObject);
    procedure Lbl_ViewAllLogsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer_UpdateServerTimer(Sender: TObject);
    procedure Lbl_TryAgainClick(Sender: TObject);
    procedure Lbl_DisconnectClick(Sender: TObject);
  private
    { Private declarations }
      FController      : TAgentController;
      FControllerDto   : TControllerDto;
      FShellEnabledUntil : TDateTime;
      FLastLogCount    : Integer; //Log lines controll
      FViewerLogs      : TStringList;
      FViewerIndex     : Integer;
      FViewerBatchSize : Integer;
      FWarning         : TFrm_Warning;
      FlogViewer       : TFrm_LogViewer;
      FIdTCPClient     : TIdTCPClient;
      FScreenBusy      : Boolean;
      FGetLog          : TGetLogService;
  public
    { Public declarations }
    {PROCEDURES}
    //procedure AppendLogLine(ARichEdit: TRichEdit; const Line: string);
    //procedure GetLogs;
    procedure StartViewerLoad;
    procedure GetSysData;
    procedure LoadConfig;
    procedure ToggleAndUpdateUI(const Key: string; ALabel: TLabel; AShape: TShape);
    procedure SetViewerIndex(const Value: Integer);
    procedure CreateObjects;
    procedure DestroyObjects;
    procedure StartServices;
    procedure NoResize;

    {FUNCTIONS}
    function  FindShapeForLabel(ALabel: TLabel): TShape;
    function  GetViewerLogs: TStringList;
    function  GetViewerIndex: Integer;
    function  GetViewerBatchSize: Integer;
    function  GetControllerDto: TControllerDto;

    procedure TestScreen; //Test Remove Later
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
begin
  {Config       := Tconfig.Create;
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
  end;}
end;

procedure TFrm_LabSyncAgent.Button1Click(Sender: TObject);
begin
 Timer_AgentLiveMode.Enabled := True;
end;

procedure TFrm_LabSyncAgent.Button2Click(Sender: TObject);
begin
 Timer_AgentLiveMode.Enabled := False;
end;

procedure TFrm_LabSyncAgent.Close1Click(Sender: TObject);
begin
 Frm_LabSyncAgent.Close;
end;


procedure TFrm_LabSyncAgent.CreateObjects;
begin
 FController    := TAgentController.Create;
 FGetLog        := TGetLogService.Create(amAgent);
 FController.InitializeIfNeeded;
 FControllerDto := FController.GetDTO;
 FlogViewer     := TFrm_LogViewer.Create(nil);
 FWarning       := TFrm_Warning.Create(nil);
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
 FController.LogStartAndOver('Over');
 DestroyObjects;
end;

procedure TFrm_LabSyncAgent.FormCreate(Sender: TObject);
begin
  NoResize;
  FViewerBatchSize := 250;
  CreateObjects;
  GetSysData;
  FController.LogStartAndOver('Start');
  LoadConfig;
  FController.ShellSecurity;
  //GetLogs;
  Timer_LogReceiver.Enabled  := True;
  Timer_UpdateServer.Enabled := True;
  FController.ConnectServer;
end;

procedure TFrm_LabSyncAgent.DestroyObjects;
begin
 FController.Free;
 FGetLog.Free;
 Freeandnil(FlogViewer);
 Freeandnil(FWarning);
end;

function TFrm_LabSyncAgent.GetControllerDto: TControllerDto;
begin
 Result := FControllerDto;
end;

procedure TFrm_LabSyncAgent.GetSysData;
begin
  Lbl_ReturnName.Caption        := FControllerDto.name;
  Lbl_ReturCPU.Caption          := FControllerDto.cpu;
  Lbl_ReturnRAM.Caption         := FControllerDto.ram;
  Lbl_ReturnID.Caption          := FControllerDto.id;
  Lbl_ReturnIP.Caption          := FControllerDto.ip;
  Lbl_ReturnStatus.Caption      := FControllerDto.status;
  Lbl_ReturnMachineUser.Caption := FControllerDto.Username;
  Lbl_ReturnVersion.Caption     := FControllerDto.version;
  Lbl_CommandReceiver.Caption   := FControllerDto.Receiver;
end;

function TFrm_LabSyncAgent.GetViewerBatchSize: Integer;
begin
 Result := FViewerBatchSize;
end;

function TFrm_LabSyncAgent.GetViewerIndex: Integer;
begin
 Result := FViewerIndex;
end;

function TFrm_LabSyncAgent.GetViewerLogs: TStringList;
begin
 Result := FViewerLogs;
end;

procedure TFrm_LabSyncAgent.Lbl_ViewAllLogsClick(Sender: TObject);
begin
  StartViewerLoad;
  FLogViewer.Show;
  FLogViewer.BringToFront;
end;

procedure TFrm_LabSyncAgent.Lbl_ApplyServerClick(Sender: TObject);
begin
   FWarning.RchEdt_Warning.Clear;
   FWarning.RchEdt_Warning.Text := 'This Agent will now receive remote commands from:'+ SlineBreak +
   Edt_Server.Text + Edt_Port.Text + SlineBreak +
   ' You may update this server address or restrict remote access at any time through the main menu.' +
   ' For security purposes, all communications remain protected by end-to-end encryption.';
   if FWarning.ShowModal = mrYes then
   begin
    FController.SetServer(Trim(Edt_Server.Text));
    FController.SetPort(Trim(Edt_Port.Text));
    FController.ConnectServer;
   end
   else
   exit;
end;

procedure TFrm_LabSyncAgent.Lbl_DisconnectClick(Sender: TObject);
begin
  try
  FController.DisconnectServer;
 except on E: Exception do
  raise Exception.Create('Failed to Connect: '+ E.Message);
 end;
end;

procedure TFrm_LabSyncAgent.Lbl_StateCommandsClick(Sender: TObject);
var
  Key: string;
  Lbl: TLabel;
  Timestamp: string;
begin
  if not (Sender is TLabel) then
    Exit;

  Lbl := TLabel(Sender);
  Key := Lbl.Hint;

  if FControllerDto.Commands = 'Enabled' then
  begin
    ToggleAndUpdateUI(Key, Lbl, FindShapeForLabel(Lbl));
  end
  else
  begin
   FWarning.RchEdt_Warning.Clear;
   FWarning.RchEdt_Warning.Text :=
  'Shell command execution is a powerful feature that grants the Commander ' +
  'the ability to run any command on this machine, including system-level operations.' +
    sLineBreak +
  'For security reasons, this option will automatically be disabled after 50 minutes. ' +
  'It will also be immediately disabled if the computer is shut down or LabSync Agent is closed.' +
  'Shell commands received while this option is disabled will be refused.' +
    sLineBreak +
  'Do you want to enable Shell execution?';
  if FWarning.ShowModal = mrYes then
   begin
    ToggleAndUpdateUI(Key, Lbl, FindShapeForLabel(Lbl));
    TimeStamp := FormatDateTime('yyyymmdd_hhnnss', Now);
    TLog.ShellState(FormatDateTime('yyyymmdd_hhnnss', Now), FController.GetID, 'Enabled');
    //50 minutes
    FShellEnabledUntil := Now + EncodeTime(0, 0, 5, 0);
    Timer_ShellSecurity.Enabled := True;
    end;
  end;
end;

procedure TFrm_LabSyncAgent.Lbl_TryAgainClick(Sender: TObject);
begin
 try
  FController.ConnectServer;
 except on E: Exception do
  raise Exception.Create('Failed to Connect: '+ E.Message);
 end;
end;

procedure TFrm_LabSyncAgent.LoadConfig;
begin
  Lbl_StateScreenShot.Caption :=  FControllerDto.Screenshot;
  Lbl_StateLiveMode.Caption   :=  FControllerDto.LiveMode;
  Lbl_StateMessages.Caption   :=  FControllerDto.Messages;
  Lbl_StateDownloads.Caption  :=  FControllerDto.Downloads;
  Lbl_StateShutdown.Caption   :=  FControllerDto.Shutdown;
  Lbl_StateRegistry.Caption   :=  FControllerDto.Registry;
  Lbl_StateFolders.Caption    :=  FControllerDto.Folders;
  Lbl_StateCommands.Caption   :=  FControllerDto.Commands;
  Lbl_StateInformation.Caption:=  FControllerDto.Information;
  Edt_Server.Text             :=  FControllerDto.Server;
  Edt_Port.Text               :=  FControllerDto.Port;

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

procedure TFrm_LabSyncAgent.NoResize;
  var
  MAX_WIDTH  : integer;
  MAX_HEIGHT : integer;
begin
  MAX_WIDTH  := Frm_LabSyncAgent.Width;  //NewValuesHere
  MAX_HEIGHT := Frm_LabSyncAgent.Height; //NewValuesHere
  Constraints.MaxWidth := MAX_WIDTH;
  Constraints.MinWidth := MAX_WIDTH;
  Constraints.MaxHeight:= MAX_HEIGHT;
  Constraints.MinHeight:= MAX_HEIGHT;
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

procedure TFrm_LabSyncAgent.SetViewerIndex(const Value: Integer);
begin
  FViewerIndex := Value;
end;

procedure TFrm_LabSyncAgent.Show1Click(Sender: TObject);
begin
 Frm_LabSyncAgent.Show;
end;

procedure TFrm_LabSyncAgent.SpeedButton1Click(Sender: TObject);
begin
 Frm_LabSyncAgent.Close;
end;

procedure TFrm_LabSyncAgent.StartServices;
begin

end;

procedure TFrm_LabSyncAgent.StartViewerLoad;
begin
  FreeAndNil(FViewerLogs);
  FViewerLogs := TStringList.Create;
  FViewerLogs.Text := FController.GetLogs;
  FViewerIndex := 0;
  //FLogViewer.RichText_Logs.Clear;
  FLogViewer.Timer_LoadLogs.Enabled := True;
end;
procedure TFrm_LabSyncAgent.TestScreen;
begin
  if FScreenBusy then
    Exit; // já tem uma captura em andamento, ignora esse tick do timer

  FScreenBusy := True;

  TThread.CreateAnonymousThread(
    procedure
    var
      Stream      : TMemoryStream;
      Jpg         : TJPEGImage;
      Transporter : TCommandResult;
      Command     : string;
      Dispatcher  : TCommandDispatcher;
      Config      : TConfig;
      Bmp         : TBitmap;
    begin
      try
        Command := '$get_print quality=100 target=' + TId.GetID;
        Config  := TConfig.Create;
        try
          Dispatcher := TCommandDispatcher.Create; // ajuste se já existir instância
          try
            Transporter := Dispatcher.Execute(Command, Config, ecLocal);

            if TScreenshotStreamQueue.Dequeue(Stream) then
            try
              Stream.Position := 0;
              Jpg := TJPEGImage.Create;
              try
                Jpg.LoadFromStream(Stream);

                // Converte pro bitmap fora da main thread, só o Assign final entra na UI
                Bmp := TBitmap.Create;
                try
                  Bmp.Assign(Jpg);

                  TThread.Queue(nil,
                    procedure
                    begin
                      try
                        Image1.Picture.Bitmap.Assign(Bmp);
                      finally
                        Bmp.Free;
                      end;
                    end);
                except
                  Bmp.Free;
                  raise;
                end;

              finally
                Jpg.Free;
              end;
            finally
              Stream.Free;
            end;

          finally
            Dispatcher.Free;
          end;
        finally
          Config.Free;
        end;
      finally
        FScreenBusy := False;
      end;
    end).Start;
end;

procedure TFrm_LabSyncAgent.Timer_AgentLiveModeTimer(Sender: TObject);
begin
 TestScreen;
end;

procedure TFrm_LabSyncAgent.Timer_LogReceiverTimer(Sender: TObject);
begin
  FGetLog.CreateComponent(Rch_LogReceiver);
end;

procedure TFrm_LabSyncAgent.Timer_ShellSecurityTimer(Sender: TObject);
var
 Timestamp: string;
begin
 if Now >= FShellEnabledUntil then
   begin
    ToggleAndUpdateUI(Lbl_StateCommands.hint, Lbl_StateCommands, FindShapeForLabel(Lbl_StateCommands));
    FController.ShellSecurity;
    Timer_ShellSecurity.Enabled := False;
    Timestamp := FormatDateTime('yyyymmdd_hhnnss', Now);
    TLog.ShellState(Timestamp, FController.GetID, FController.GetOptionDisplay('Commands'));;
   end;
end;

procedure TFrm_LabSyncAgent.Timer_UpdateServerTimer(Sender: TObject);
begin
  Lbl_ServerStatusResponse.Caption := FController.GetServerStatus;
end;

procedure TFrm_LabSyncAgent.ToggleAndUpdateUI(const Key: string; ALabel: TLabel; AShape: TShape);
var
  State: TOptionState;
begin
  State := FController.ToggleOption(Key);
  ALabel.Caption := FController.GetOptionDisplay(Key);
  ApplyVisualState(ALabel, AShape);
end;

end.
