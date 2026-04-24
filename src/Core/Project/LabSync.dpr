program LabSync;

uses
  Vcl.Forms,
  Principal.Views in '..\..\Presentation\views\Principal.Views.pas' {Form1},
  Command.Parser in '..\..\Application\Parser\Command.Parser.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
