object Frm_LabSyncAgent: TFrm_LabSyncAgent
  Left = 0
  Top = 0
  Caption = 'LabSync Agent'
  ClientHeight = 636
  ClientWidth = 813
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Pnl_Background: TPanel
    Left = 0
    Top = 0
    Width = 813
    Height = 636
    Align = alClient
    BevelOuter = bvNone
    Color = 1184274
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -24
    object Pnl_AgentStatus: TPanel
      Left = 0
      Top = 0
      Width = 280
      Height = 520
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      ExplicitHeight = 634
      DesignSize = (
        280
        520)
      object Shp_AgentStatus: TShape
        Left = 0
        Top = 0
        Width = 280
        Height = 520
        Align = alClient
        Brush.Style = bsClear
        Pen.Color = clRed
        Pen.Width = 2
        ExplicitTop = 200
        ExplicitHeight = 435
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = -1
        Top = 33
        Width = 280
        Height = 19
        Margins.Left = 15
        Margins.Top = 15
        Margins.Right = 15
        Margins.Bottom = 15
        Alignment = taCenter
        Anchors = []
        AutoSize = False
        Caption = 'MACHINE INFORMATION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -13
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
        ExplicitTop = 30
      end
      object Label3: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 74
        Width = 91
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Caption = 'Machine Name:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 111
        Width = 80
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Caption = 'Machine CPU:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 148
        Width = 84
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Caption = 'Machine RAM:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 308
        Width = 48
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Caption = 'Local IP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 345
        Width = 38
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
      end
      object Lbl_ReturnName: TLabel
        AlignWithMargins = True
        Left = 134
        Top = 74
        Width = 91
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        AutoSize = False
        Caption = 'Machine Name:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8355711
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Lbl_ReturCPU: TLabel
        AlignWithMargins = True
        Left = 134
        Top = 111
        Width = 91
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        AutoSize = False
        Caption = 'Machine Name:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8355711
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Lbl_ReturnRAM: TLabel
        AlignWithMargins = True
        Left = 134
        Top = 148
        Width = 91
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        AutoSize = False
        Caption = 'Machine Name:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8355711
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Lbl_ReturnIP: TLabel
        AlignWithMargins = True
        Left = 134
        Top = 308
        Width = 91
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        AutoSize = False
        Caption = 'Machine Name:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8355711
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Lbl_ReturnStatus: TLabel
        AlignWithMargins = True
        Left = 134
        Top = 345
        Width = 91
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        AutoSize = False
        Caption = 'Machine Name:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8355711
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label17: TLabel
        Left = -1
        Top = 264
        Width = 280
        Height = 19
        Margins.Left = 15
        Margins.Top = 15
        Margins.Right = 15
        Margins.Bottom = 15
        Alignment = taCenter
        Anchors = []
        AutoSize = False
        Caption = 'NETWORK AND LAB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -13
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
      end
      object Shape2: TShape
        Left = 23
        Top = 227
        Width = 224
        Height = 2
        Margins.Left = 15
        Margins.Top = 15
        Margins.Right = 15
        Margins.Bottom = 15
        Brush.Color = 4078652
        Pen.Color = clMedGray
        Pen.Style = psClear
      end
      object Label1: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 185
        Width = 83
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Caption = 'Machine User:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
      end
      object Lbl_ReturnMachineUser: TLabel
        AlignWithMargins = True
        Left = 134
        Top = 185
        Width = 91
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        AutoSize = False
        Caption = 'Machine Name:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8355711
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Lbl_ReturnID: TLabel
        AlignWithMargins = True
        Left = 134
        Top = 382
        Width = 91
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        AutoSize = False
        Caption = 'Machine Name:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8355711
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label9: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 382
        Width = 69
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Caption = 'Machine ID:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
      end
      object Lbl_ReturnVersion: TLabel
        AlignWithMargins = True
        Left = 134
        Top = 419
        Width = 91
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        AutoSize = False
        Caption = 'Machine Name:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8355711
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label10: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 419
        Width = 98
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Caption = 'LabSync Version:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
      end
    end
    object Pnl_AgentLiveMode: TPanel
      Left = 286
      Top = 8
      Width = 519
      Height = 506
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object Panel3: TPanel
        Left = 0
        Top = 35
        Width = 519
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 0
        ExplicitLeft = 176
        ExplicitTop = 152
        ExplicitWidth = 185
        object Shape3: TShape
          Left = 0
          Top = 0
          Width = 519
          Height = 41
          Align = alClient
          Brush.Color = 1776411
          Pen.Color = 2697513
          Shape = stRoundRect
          ExplicitLeft = 168
          ExplicitTop = 16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object Image2: TImage
          Left = 11
          Top = 5
          Width = 30
          Height = 30
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
            003208060000001E3F88B1000000097048597300000B1300000B1301009A9C18
            000000C74944415478DAEDD5BD0DC2301086616E0FC420FC0CC022A9CED3D815
            93A427992483386709684014F8903F47DFDB589113E91EC97264B791A4F50084
            10021E216889AACE22726C3D4865B3841072EB293C7A41628C5D1EB3E7FC84A0
            44085A84A045085A84A045085A84A045085A84A045085A84A045085A6F90DE2B
            90C9D653EB416ACA394F6EC7E9D31155D54544F68FC7C5F60EDFDEAFE9DF90AB
            2D37C394BDC1F6C62E219EEF1342082184F841EC9ABDDB157BFEE5DBF2334B29
            5D08F1842044085A9B81AC093905B6BDA04C590000000049454E44AE426082}
          Proportional = True
        end
        object Label11: TLabel
          AlignWithMargins = True
          Left = 54
          Top = 12
          Width = 90
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Alignment = taCenter
          AutoSize = False
          Caption = 'Screenshot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label15: TLabel
          AlignWithMargins = True
          Left = 164
          Top = 12
          Width = 149
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Alignment = taCenter
          AutoSize = False
          Caption = 'Computer screenshots'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Shp_Screenshot: TShape
          Left = 419
          Top = 18
          Width = 10
          Height = 10
          Brush.Color = clLime
          Shape = stCircle
        end
        object Lbl_Screenshot: TLabel
          AlignWithMargins = True
          Left = 420
          Top = 14
          Width = 90
          Height = 14
          Cursor = crHandPoint
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Alignment = taCenter
          AutoSize = False
          Caption = 'Enabled'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          OnClick = Lbl_ScreenshotClick
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 519
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        object Shape4: TShape
          Left = 0
          Top = 0
          Width = 519
          Height = 35
          Align = alClient
          Brush.Color = 1118481
          Pen.Color = 2697513
          Shape = stRoundRect
          ExplicitLeft = 168
          ExplicitTop = 16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object Label12: TLabel
          AlignWithMargins = True
          Left = 54
          Top = 9
          Width = 90
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Alignment = taCenter
          AutoSize = False
          Caption = 'Permission'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label13: TLabel
          AlignWithMargins = True
          Left = 164
          Top = 9
          Width = 90
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Alignment = taCenter
          AutoSize = False
          Caption = 'Description'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label14: TLabel
          AlignWithMargins = True
          Left = 420
          Top = 9
          Width = 90
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Alignment = taCenter
          AutoSize = False
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 520
      Width = 813
      Height = 116
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      object Shape1: TShape
        Left = 0
        Top = 0
        Width = 813
        Height = 116
        Align = alClient
        Brush.Style = bsClear
        Pen.Color = 8453888
        Pen.Width = 2
        ExplicitTop = 200
        ExplicitWidth = 280
        ExplicitHeight = 435
      end
      object Panel2: TPanel
        Left = 8
        Top = 6
        Width = 797
        Height = 43
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object Label8: TLabel
          AlignWithMargins = True
          Left = 53
          Top = 9
          Width = 149
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Caption = 'Executing commands For:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
        end
        object Image1: TImage
          Left = 15
          Top = 5
          Width = 25
          Height = 25
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
            003208060000001E3F88B1000000097048597300000B1300000B1301009A9C18
            0000023E4944415478DAEDD9CF6B13411407F037D935E92F5044ACBDB825884A
            455089AE605A8381424F3DB57F81581ADA43F10FF01F2878094973F5182F5EC4
            83AD116A699746EB2FC45628DD0AC54357141BB169669F6F040F162F21617766
            99EF25246196F7E1CD9B64130611090BBB000D390C19A8E47B6A5DB159128DD1
            D3E36117D45CF02B023CFC95E8B9CB2CA75822C49DB04B6ACD8373ACDF2978A2
            133E626AFB7AEE65D8353593A43397F2015701C1234811C58B5BF6A492F3F2B7
            7E0D9125D185A89EE84122B3B5344443344443A44EEB9072D9F8F3383ECE9586
            582BC5E77423D0873118D9BE96DB5417E2141E3160A3B4D8650D7E73EBC694AB
            24A4AF5AEA4A70FE982E910913D39661EF7DFDA0BB63BFF684160E22E027FF80
            673EA7A77794838824ABA5A3BCE13F650CAE22C23A309E71EDA92FCA4144ACB5
            FBC7583DB14097BB429D7997308C5B1BA9895DE52022C9A5C249DF848AF88589
            4EB35718DFCFBA9767BE2907395B2D9DA8D31603069700F1236FF06C10F3D256
            88E80637619E8EE38B4122DA0AB19CFC2986C63C75E2026DA90F087E56B961A7
            13EB34E7FE022D3C03086B7133361CD490B70DD2BF94B7C0309E51279262B8EB
            C08777EC692F4844CB9081F7E578ADE66DD0028B666239661A239BA989EFFFBC
            BFE7BDA5CF9673CD1646C7F70BD7CE0D060281CA3DD3EAEC5DA6E55E47E3C8D8
            7AFAF68FC3D09F7BBB6F80B1F3CD4360D1B52787828148140D912D1A225B3444
            B668886CD110D912BDBFDE2CA7B0487776E9B00B6925E28BA692DBE97FD110D9
            F21B0CE1BE6F1F0B4E1F0000000049454E44AE426082}
          Stretch = True
        end
        object Lbl_CommandReceiver: TLabel
          AlignWithMargins = True
          Left = 208
          Top = 9
          Width = 149
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Caption = 'Executing commands For:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5343743
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
      end
      object Rch_LogReceiver: TRichEdit
        Left = 23
        Top = 55
        Width = 782
        Height = 48
        BevelInner = bvNone
        BorderStyle = bsNone
        Color = clBlack
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
        TabOrder = 1
        Transparent = True
      end
    end
  end
  object Timer_AgentLiveMode: TTimer
    Enabled = False
    Interval = 60
    OnTimer = Timer_AgentLiveModeTimer
    Left = 144
    Top = 560
  end
  object Timer_LogReceiver: TTimer
    Enabled = False
    Interval = 800
    OnTimer = Timer_LogReceiverTimer
    Left = 22
    Top = 560
  end
end
