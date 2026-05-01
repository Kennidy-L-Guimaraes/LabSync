program LabSync;

uses
  Vcl.Forms,
  Principal.Views in 'src\Presentation\views\Principal.Views.pas' {Frm_LabSyncAgent},
  Command.Parser in 'src\Application\Parser\Command.Parser.pas',
  Command.Dispatcher in 'src\Application\Dispatcher\Command.Dispatcher.pas',
  ID.Service in 'src\Application\Services\ID.Service.pas',
  Path.Service in 'src\Application\Services\Path.Service.pas',
  Screen.Service in 'src\Application\Services\Screen.Service.pas',
  Command.Logs in 'src\Application\Logs\Command.Logs.pas',
  Loop.Service in 'src\Application\Services\Loop.Service.pas',
  Screenshot.Queue in 'src\Application\Queue\Screenshot.Queue.pas',
  GetPrint.Command in 'src\Core\Command\GetPrint.Command.pas',
  GetLiveMode.Command in 'src\Core\Command\GetLiveMode.Command.pas',
  CommandSuggestion.Service in 'src\Application\Services\CommandSuggestion.Service.pas',
  GetSysInfo.Command in 'src\Core\Command\GetSysInfo.Command.pas',
  Transporter.Dto in 'src\Application\Dtos\Transporter.Dto.pas',
  Config.Service in 'src\Application\Services\Config.Service.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_LabSyncAgent, Frm_LabSyncAgent);
  Application.Run;
end.
