program LabSyncServer;

uses
  Vcl.Forms,
  Principal.Views in 'src\Presentation\Views\Principal.Views.pas' {Frm_LabSyncServer},
  Server.Controller in 'src\Application\Controllers\Server.Controller.pas',
  Config.Service in 'src\Application\Services\Config.Service.pas',
  Path.Service in '..\shared\Application\src\services\Path.Service.pas',
  ServerConfig.Service in 'src\Application\Services\ServerConfig.Service.pas',
  Command.Logs in 'src\Application\logs\Command.Logs.pas',
  Transporter.Dto in '..\shared\Application\src\Dtos\Transporter.Dto.pas',
  ID.Service in 'src\Application\Services\ID.Service.pas',
  LocalIP.Service in 'src\Application\Services\LocalIP.Service.pas',
  Server.Service in 'src\Application\Services\Server.Service.pas',
  AgentCard.Component in 'src\Application\Components\AgentCard.Component.pas',
  AgentCard.Manager in 'src\Application\Managers\AgentCard.Manager.pas',
  AgentInfo.Service in 'src\Application\Services\AgentInfo.Service.pas',
  ServerConfig.Views in 'src\Presentation\Views\ServerConfig.Views.pas' {Frm_ServerConfig},
  GetLog.Service in '..\shared\Application\src\services\GetLog.Service.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_LabSyncServer, Frm_LabSyncServer);
  Application.CreateForm(TFrm_ServerConfig, Frm_ServerConfig);
  Application.Run;
end.
