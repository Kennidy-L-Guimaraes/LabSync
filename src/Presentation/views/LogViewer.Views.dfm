object Frm_LogViewer: TFrm_LogViewer
  Left = 0
  Top = 0
  Caption = 'Log Viewer'
  ClientHeight = 298
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Pnl_background: TPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 298
    Align = alClient
    BevelOuter = bvNone
    Color = 1776411
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 296
    object RichText_Logs: TRichEdit
      AlignWithMargins = True
      Left = 15
      Top = 28
      Width = 726
      Height = 267
      Margins.Left = 15
      Align = alClient
      BevelInner = bvNone
      BorderStyle = bsNone
      Color = 1776411
      Ctl3D = False
      EnableURLs = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 3815994
      Font.Height = -11
      Font.Name = '@Microsoft YaHei'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 41
      ExplicitWidth = 744
      ExplicitHeight = 281
    end
    object Pnl_ComputerInfo: TPanel
      Left = 0
      Top = 0
      Width = 744
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object Lbl_ComputerInfo: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 3
        Width = 91
        Height = 22
        Margins.Left = 10
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = '$Computer Info'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clChartreuse
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 11
        ExplicitTop = 4
        ExplicitHeight = 17
      end
    end
  end
  object Timer_LoadLogs: TTimer
    Enabled = False
    Interval = 700
    OnTimer = Timer_LoadLogsTimer
    Left = 34
    Top = 249
  end
end
