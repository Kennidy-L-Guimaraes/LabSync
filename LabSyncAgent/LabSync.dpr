program LabSync;

{$R *.dres}

uses
  Vcl.Forms,
  Principal.Views in 'src\Presentation\views\Principal.Views.pas' {Frm_LabSyncAgent},
  Command.Parser in 'src\Application\Parser\Command.Parser.pas',
  Command.Dispatcher in 'src\Application\Dispatcher\Command.Dispatcher.pas',
  ID.Service in 'src\Application\Services\ID.Service.pas',
  Path.Service in '..\shared\Application\src\services\Path.Service.pas',
  Screen.Service in 'src\Application\Services\Screen.Service.pas',
  Command.Logs in '..\shared\Application\src\Logs\Command.Logs.pas',
  Loop.Service in 'src\Application\Services\Loop.Service.pas',
  Screenshot.Queue in 'src\Application\Queue\Screenshot.Queue.pas',
  GetPrint.Command in 'src\Core\Command\GetPrint.Command.pas',
  GetLiveMode.Command in 'src\Core\Command\GetLiveMode.Command.pas',
  CommandSuggestion.Service in 'src\Application\Services\CommandSuggestion.Service.pas',
  GetSysInfo.Command in 'src\Core\Command\GetSysInfo.Command.pas',
  Transporter.Dto in '..\shared\Application\src\Dtos\Transporter.Dto.pas',
  Config.Service in 'src\Application\Services\Config.Service.pas',
  Agent.Controller in 'src\Application\Controllers\Agent.Controller.pas',
  CommandParsed.Dto in 'src\Application\Dtos\CommandParsed.Dto.pas',
  Message.Views in 'src\Presentation\views\Message.Views.pas' {Frm_Message},
  showMessage.Command in 'src\Core\Command\showMessage.Command.pas' {$R *.res},
  ExecShutdown.Command in 'src\Core\Command\ExecShutdown.Command.pas',
  ServerConfig.Service in 'src\Application\Services\ServerConfig.Service.pas',
  Warning.Views in 'src\Presentation\views\Warning.Views.pas' {Frm_Warning},
  LogViewer.Views in 'src\Presentation\views\LogViewer.Views.pas' {Frm_LogViewer},
  Controller.Dto in 'src\Application\Dtos\Controller.Dto.pas',
  AgentConnect.Service in 'src\Application\Services\AgentConnect.Service.pas',
  GetLog.Service in '..\shared\Application\src\services\GetLog.Service.pas',
  ApplicationMode.types in '..\shared\Application\src\types\ApplicationMode.types.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_LabSyncAgent, Frm_LabSyncAgent);
  Application.CreateForm(TFrm_Message, Frm_Message);
  Application.CreateForm(TFrm_Warning, Frm_Warning);
  Application.CreateForm(TFrm_LogViewer, Frm_LogViewer);
  Application.Run;
end.
