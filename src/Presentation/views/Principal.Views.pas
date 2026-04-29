unit Principal.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Command.Parser,
  Command.Dispatcher, Command.Logs, Vcl.ExtCtrls, ID.Service, IOUtils,
  Screenshot.Queue, Vcl.Imaging.jpeg, Transporter.Dto;

type
  TFrm_LabSyncAgent = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Image1: TImage;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_LabSyncAgent    : TFrm_LabSyncAgent;
  ShowLog : Tlog;

implementation
{
 Please note that LABSYNC is not malicious software.
 It is an official project that synchronizes computers on the same network to follow administrator instructions
  such as shutdowns, updates, and compliance checks according to company policy.
 It is not hidden, and although it performs actions in the background, they are not malicious.
}
{$R *.dfm}

procedure TFrm_LabSyncAgent.Button1Click(Sender: TObject);   //$get_livemode value=true target=all
var
 CommandDis: TCommandDispatcher;
 Command   : string;
 Transporter: TCommandResult;
begin
  CommandDis := TCommandDispatcher.Create;
  try
   Command := Edit1.Text;
   Transporter := CommandDis.Execute(Command);  //$get_sysinfo target=all
   Showmessage(Transporter.Text);
   Memo1.Clear;
   Memo1.Lines.Add(TLog.ReadLogs('Audit.log'));
   Timer1.Enabled := true;
  finally
  CommandDis.Free;
  end;
end;

procedure TFrm_LabSyncAgent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Showlog.Free;
end;

procedure TFrm_LabSyncAgent.FormCreate(Sender: TObject);
begin
 ShowLog := Tlog.Create;
 Memo1.Clear;
 Memo1.Lines.Add(TLog.ReadLogs('Audit.log'));
 TId.CreateNewID;
 ShowMessage(TId.GetID);
end;

procedure TFrm_LabSyncAgent.Timer1Timer(Sender: TObject);
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

      // reaproveita o bitmap interno do Image
      Image1.Picture.Bitmap.Assign(Jpg);

    finally
      Jpg.Free;
    end;

  finally
    Stream.Free;
  end;
end;

end.
