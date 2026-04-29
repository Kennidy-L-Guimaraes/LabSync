unit Principal.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Command.Parser,
  Command.Dispatcher, Command.Logs, Vcl.ExtCtrls, ID.Service, IOUtils,
  Screenshot.Queue, Vcl.Imaging.jpeg, Transporter.Dto, Vcl.Imaging.pngimage;

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
    Lbl_ReturnID: TLabel;
    Lbl_ReturnIP: TLabel;
    Lbl_ReturnStatus: TLabel;
    Label17: TLabel;
    Shape2: TShape;
    Pnl_AgentLiveMode: TPanel;
    Img_AgentLiveMode: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer_AgentLiveModeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowLiveMode;
    procedure GetSysData;
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

procedure TFrm_LabSyncAgent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Log.Free;
end;

procedure TFrm_LabSyncAgent.FormCreate(Sender: TObject);
begin
 Dispatcher   := TCommandDispatcher.Create;
 Log          := TLog.Create;
 ShowLiveMode;
 GetSysData;
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
  SysInfo.NameValueSeparator:= '=';
  Lbl_ReturnName.Caption    := SysInfo.Values['Name'];
  Lbl_ReturCPU.Caption      := SysInfo.Values['CPU'];
  Lbl_ReturnID.Caption      := SysInfo.Values['ID'];
  Lbl_ReturnIP.Caption      := SysInfo.Values['IP'];
  Lbl_ReturnStatus.Caption  := SysInfo.Values['Status'];
 finally
  SysInfo.Free;
 end;
end;

procedure TFrm_LabSyncAgent.ShowLiveMode;
var
 Command: string;
begin
  Command := '$get_livemode value=true target=all';
  Transporter := Dispatcher.Execute(Command);
  if Transporter.Success = True then
   Timer_AgentLiveMode.Enabled := True;
   Img_AgentLiveMode.Stretch   := True;
end;

procedure TFrm_LabSyncAgent.Timer_AgentLiveModeTimer(Sender: TObject);
var
  Stream : TMemoryStream;
  Jpg    : TJPEGImage;
begin
  if TScreenshotStreamQueue.Dequeue(Stream) then
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
  end;
end;

end.
