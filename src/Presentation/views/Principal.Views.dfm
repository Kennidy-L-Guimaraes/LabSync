object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 363
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    710
    363)
  TextHeight = 15
  object Image1: TImage
    Left = 280
    Top = 8
    Width = 409
    Height = 347
    Anchors = [akLeft, akTop, akRight, akBottom]
    Center = True
    ParentShowHint = False
    ShowHint = True
    Stretch = True
  end
  object Button1: TButton
    Left = 135
    Top = 271
    Width = 75
    Height = 23
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 253
    Height = 248
    Anchors = []
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDimgray
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 8
    Top = 271
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 60
    OnTimer = Timer1Timer
    Left = 8
    Top = 296
  end
end
