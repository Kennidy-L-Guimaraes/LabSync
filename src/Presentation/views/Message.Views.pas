unit Message.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TFrm_Message = class(TForm)
    Pnl_Background: TPanel;
    Pnl_Close: TPanel;
    Sbtn_Close: TSpeedButton;
    Lbl_Title: TLabel;
    Img_LabSyncIco: TImage;
    Rch_Message: TRichEdit;
    Timer_Message: TTimer;
    procedure Sbtn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer_MessageTimer(Sender: TObject);
  private
    { Private declarations }
    FBlinkCount: Integer;
    FState: Boolean;
  public
    { Public declarations }
  end;

var
  Frm_Message: TFrm_Message;

implementation

{$R *.dfm}

procedure TFrm_Message.FormShow(Sender: TObject);
begin
  FBlinkCount := 0;
  FState := False;
  Timer_Message.Interval := 80;
  Timer_Message.Enabled := True;
end;

procedure TFrm_Message.Sbtn_CloseClick(Sender: TObject);
begin
 Close;
end;

procedure TFrm_Message.Timer_MessageTimer(Sender: TObject);
begin
      FState := not FState;
   if FState then
      Pnl_Close.Color := StringToColor('$0000009F')
  else
    Pnl_Close.Color := StringToColor('$001B1B1B');
    Inc(FBlinkCount);
  if FBlinkCount >= 10 then
  begin
    Timer_Message.Enabled := False;
    Pnl_Close.Color := StringToColor('$001B1B1B');
  end;
end;

end.
