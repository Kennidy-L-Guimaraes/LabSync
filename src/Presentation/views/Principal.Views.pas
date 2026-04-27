unit Principal.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Command.Parser,
  Command.Dispatcher, Command.Logs, Vcl.ExtCtrls, ID.Service, IOUtils,
  Screenshot.Queue;

type
  TForm1 = class(TForm)
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
    FLastShown : string;
  public
    { Public declarations }
  end;

var
  Form1    : TForm1;
  ShowLog : Tlog;

implementation
{
 Please note that LABSYNC is not malicious software.
 It is an official project that synchronizes computers on the same network to follow administrator instructions
  such as shutdowns, updates, and compliance checks according to company policy.
 It is not hidden, and although it performs actions in the background, they are not malicious.
}
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 CommandDis: TCommandDispatcher;
 Command   : string;
begin
  CommandDis := TCommandDispatcher.Create;
  try
   Command := Edit1.Text;    //$get_printloop value=true target=all
   CommandDis.Execute(Command);
   Memo1.Clear;
   Memo1.Lines.Add(TLog.ReadLogs('Audit.log'));
   Timer1.Enabled := true;
  finally
  CommandDis.Free;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Showlog.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 ShowLog := Tlog.Create;
 Memo1.Clear;
 Memo1.Lines.Add(TLog.ReadLogs('Audit.log'));
 TId.CreateNewID;
 ShowMessage(TId.GetID);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  Stream: TMemoryStream;
begin
  if TScreenshotStreamQueue.Dequeue(Stream) then
  try
    Stream.Position := 0;
    Image1.Picture.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

end.
