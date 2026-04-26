object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 211
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 178
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 457
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 112
    Top = 136
  end
end
