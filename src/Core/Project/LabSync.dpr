program LabSync;

uses
  Vcl.Forms,
  Principal.Views in '..\..\Presentation\views\Principal.Views.pas' {Form1},
  Command.Parser in '..\..\Application\Parser\Command.Parser.pas',
  Command.Dispatcher in '..\..\Application\Dispatcher\Command.Dispatcher.pas',
  Command.Logs in '..\..\Application\Logs\Command.Logs.pas',
  Screen.Service in '..\..\Application\Services\Screen.Service.pas',
  Path.Service in '..\..\Application\Services\Path.Service.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
