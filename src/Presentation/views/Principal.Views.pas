unit Principal.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Command.Parser,
  Command.Dispatcher, Command.Logs, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
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
   Command := '$get_printscreen quality=100';
   CommandDis.Execute(Command)
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
 Timer1.Enabled := True;
 ShowLog := Tlog.Create;
 Memo1.Clear;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 Memo1.Lines.add(ShowLog.ReadLogs);
end;

end.
