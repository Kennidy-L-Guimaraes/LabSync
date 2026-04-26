program LabSync;

uses
  Vcl.Forms,
  Principal.Views in '.\src\Presentation\views\Principal.Views.pas' {Form1},
  Command.Parser in '.\src\Application\Parser\Command.Parser.pas',
  Command.Dispatcher in '.\src\Application\Dispatcher\Command.Dispatcher.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
