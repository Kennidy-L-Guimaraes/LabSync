unit LogViewer.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Principal.Views;

type
  TFrm_LogViewer = class(TForm)
    Pnl_background: TPanel;
    RichText_Logs: TRichEdit;
    Timer_LoadLogs: TTimer;
    procedure Timer_LoadLogsTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_LogViewer: TFrm_LogViewer;

implementation

{$R *.dfm}


procedure TFrm_LogViewer.Timer_LoadLogsTimer(Sender: TObject);
var
  i       : Integer;
  MaxLine : Integer;
begin

  RichText_Logs.Perform(WM_SETREDRAW, 0, 0);

  try

    MaxLine := Frm_LabSyncAgent.FViewerIndex +
               Frm_LabSyncAgent.FViewerBatchSize;

    if MaxLine > Frm_LabSyncAgent.FViewerLogs.Count then
      MaxLine := Frm_LabSyncAgent.FViewerLogs.Count;

    for i := Frm_LabSyncAgent.FViewerIndex to MaxLine - 1 do
    begin
      Frm_LabSyncAgent.AppendLogLine(
        RichText_Logs,
        Frm_LabSyncAgent.FViewerLogs[i]
      );
    end;

    Frm_LabSyncAgent.FViewerIndex := MaxLine;

    // terminou
    if Frm_LabSyncAgent.FViewerIndex >=
       Frm_LabSyncAgent.FViewerLogs.Count then
    begin
      Timer_LoadLogs.Enabled := False;
    end;

  finally
    RichText_Logs.Perform(WM_SETREDRAW, 1, 0);
    RichText_Logs.Invalidate;
  end;
end;

end.
