unit Warning.Views;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TFrm_Warning = class(TForm)
    Pnl_Background: TPanel;
    Pnl_Close: TPanel;
    Sbtn_Close: TSpeedButton;
    Lbl_Title: TLabel;
    Img_Warning: TImage;
    RchEdt_Warning: TRichEdit;
    Pnl_Btns: TPanel;
    Pnl_BtnNo: TPanel;
    Pnl_BtnYes: TPanel;
    SpBtn_Yes: TSpeedButton;
    Spbtn_No: TSpeedButton;
    procedure Sbtn_CloseClick(Sender: TObject);
    procedure SpBtn_YesClick(Sender: TObject);
    procedure Spbtn_NoClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Frm_Warning: TFrm_Warning;

implementation

{$R *.dfm}

procedure TFrm_Warning.Sbtn_CloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


procedure TFrm_Warning.SpBtn_YesClick(Sender: TObject);
begin
  ModalResult := mrYes;
end;

procedure TFrm_Warning.Spbtn_NoClick(Sender: TObject);
begin
  ModalResult := mrNo;
end;

end.
