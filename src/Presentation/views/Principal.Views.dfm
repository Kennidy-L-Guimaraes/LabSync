object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 470
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    495
    470)
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 437
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
    Height = 417
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDimgray
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 1
    ExplicitHeight = 415
  end
end
