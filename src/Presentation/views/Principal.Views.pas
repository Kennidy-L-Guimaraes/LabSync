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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Lbl_ReturnName: TLabel;
    Lbl_ReturCPU: TLabel;
    Lbl_ReturnRAM: TLabel;
    Lbl_ReturnIP: TLabel;
    Lbl_ReturnStatus: TLabel;
    Label17: TLabel;
    Shape2: TShape;
    Pnl_AgentLiveMode: TPanel;
    Label1: TLabel;
    Lbl_ReturnMachineUser: TLabel;
    Lbl_ReturnID: TLabel;
    Label9: TLabel;
    Lbl_ReturnVersion: TLabel;
    Label10: TLabel;
    Panel1: TPanel;
    Shape1: TShape;
    Panel2: TPanel;
    Label8: TLabel;
    Image1: TImage;
    Rch_LogReceiver: TRichEdit;
    Lbl_CommandReceiver: TLabel;
    Timer_LogReceiver: TTimer;
    Panel3: TPanel;
    Image2: TImage;
    Shape3: TShape;
    Label11: TLabel;
    Panel4: TPanel;
    Shape4: TShape;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Shp_Screenshot: TShape;
    Lbl_Screenshot: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer_AgentLiveModeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GetSysData;
    procedure GetLogs;
    procedure CreateObj;
    procedure ToggleStatus(ALabel: TLabel; AShape: TShape);
    procedure Timer_LogReceiverTimer(Sender: TObject);
    procedure Lbl_ScreenshotClick(Sender: TObject);
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

procedure TFrm_LabSyncAgent.Lbl_ScreenshotClick(Sender: TObject);
begin
 ToggleStatus(Lbl_Screenshot, Shp_Screenshot);
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
    AShape.Brush.Color := clRed;
  end
  else
  begin
    ALabel.Caption := EnabledText;
    AShape.Brush.Color := clLime;
  end;
end;

end.
