program LabSync;

uses
  Vcl.Forms,
  Principal.Views in 'src\Presentation\views\Principal.Views.pas' {Form1},
  Command.Parser in 'src\Application\Parser\Command.Parser.pas',
  Command.Dispatcher in 'src\Application\Dispatcher\Command.Dispatcher.pas',
  ID.Service in 'src\Application\Services\ID.Service.pas',
  Path.Service in 'src\Application\Services\Path.Service.pas',
  Screen.Service in 'src\Application\Services\Screen.Service.pas',
  Command.Logs in 'src\Application\Logs\Command.Logs.pas',
  Loop.Service in 'src\Application\Services\Loop.Service.pas',
  Screenshot.Queue in 'src\Application\Queue\Screenshot.Queue.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
