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
  TextHeight = 15
  object Pnl_background: TPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 298
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 360
    ExplicitTop = 304
    ExplicitWidth = 185
    ExplicitHeight = 41
    object RichText_Logs: TRichEdit
      Left = 0
      Top = 0
      Width = 744
      Height = 298
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
    end
  end
  object Timer_LoadLogs: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer_LoadLogsTimer
    Left = 22
    Top = 14
  end
end
