unit LogViewer.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Agent.Controller, Controller.Dto, GetLog.Service;

type
  TFrm_LogViewer = class(TForm)
    Pnl_background: TPanel;
    RichText_Logs: TRichEdit;
    Timer_LoadLogs: TTimer;
    Pnl_ComputerInfo: TPanel;
    Lbl_ComputerInfo: TLabel;
    procedure Timer_LoadLogsTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FGetLog   : TGetLogService;
  public
    { Public declarations }
  end;

var
  Frm_LogViewer: TFrm_LogViewer;

implementation

{$R *.dfm}

uses Principal.Views;


procedure TFrm_LogViewer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caNone;
 Hide;
end;

procedure TFrm_LogViewer.FormCreate(Sender: TObject);
var
 ControllerDto : TControllerDto;
begin
  ControllerDto := Frm_LabSyncAgent.GetControllerDto;
  FGetLog       := TGetLogService.Create;
  Lbl_ComputerInfo.Caption := ControllerDto.username + ' ~ID ' +
  ControllerDto.Id + ' V. ' + ControllerDto.version + ' -- ' + FormatDateTime('yyyy/mm/dd', Now);
end;

procedure TFrm_LogViewer.FormDestroy(Sender: TObject);
begin
 FGetLog.Free;
end;

procedure TFrm_LogViewer.Timer_LoadLogsTimer(Sender: TObject);
var
  i       : Integer;
  MaxLine : Integer;
begin

  RichText_Logs.Perform(WM_SETREDRAW, 0, 0);

  try

    MaxLine := Frm_LabSyncAgent.GetViewerIndex +
               Frm_LabSyncAgent.GetViewerBatchSize;

    if MaxLine > Frm_LabSyncAgent.GetViewerLogs.Count then
      MaxLine := Frm_LabSyncAgent.GetViewerLogs.Count;

    for i := Frm_LabSyncAgent.GetViewerIndex to MaxLine - 1 do
    begin
      FGetLog.AppendLogLine(
        RichText_Logs,
        Frm_LabSyncAgent.GetViewerLogs[i]
      );
    end;

    Frm_LabSyncAgent.SetViewerIndex(MaxLine);

    // terminou
    if Frm_LabSyncAgent.GetViewerIndex >=
       Frm_LabSyncAgent.GetViewerLogs.Count then
    begin
      Timer_LoadLogs.Enabled := False;
    end;

  finally
    RichText_Logs.Perform(WM_SETREDRAW, 1, 0);
    RichText_Logs.Invalidate;
  end;
end;

end.
