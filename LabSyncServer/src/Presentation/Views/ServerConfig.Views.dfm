object Frm_ServerConfig: TFrm_ServerConfig
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Server Config'
  ClientHeight = 364
  ClientWidth = 435
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Pnl_Background: TPanel
    Left = 0
    Top = 0
    Width = 435
    Height = 364
    Align = alClient
    BevelOuter = bvNone
    Color = 1184274
    ParentBackground = False
    TabOrder = 0
    object Scbx_SettingsContent: TScrollBox
      Left = 0
      Top = 33
      Width = 435
      Height = 331
      HorzScrollBar.Smooth = True
      HorzScrollBar.Tracking = True
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 0
      object Pnl_PortDNS: TPanel
        Left = 0
        Top = 8
        Width = 435
        Height = 138
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object Lbl_PortDnsTitle: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 10
          Width = 425
          Height = 17
          Margins.Left = 5
          Margins.Top = 10
          Margins.Right = 5
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Connection port and DNS address'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 201
        end
        object Shp_Separator: TShape
          Left = 0
          Top = 136
          Width = 435
          Height = 2
          Margins.Left = 15
          Margins.Top = 15
          Margins.Right = 15
          Margins.Bottom = 15
          Align = alBottom
          Brush.Color = 4078652
          Pen.Color = clMedGray
          Pen.Style = psClear
          ExplicitLeft = 11
          ExplicitTop = 135
          ExplicitWidth = 160
        end
        object Lbl_serverAddress: TLabel
          AlignWithMargins = True
          Left = 27
          Top = 47
          Width = 70
          Height = 17
          Margins.Left = 5
          Margins.Top = 4
          Margins.Right = 5
          Margins.Bottom = 4
          Caption = 'Server DNS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
        end
        object Lbl_ServerPort: TLabel
          AlignWithMargins = True
          Left = 27
          Top = 72
          Width = 68
          Height = 17
          Margins.Left = 5
          Margins.Top = 4
          Margins.Right = 5
          Margins.Bottom = 4
          Caption = 'Server Port:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          AlignWithMargins = True
          Left = 249
          Top = 47
          Width = 57
          Height = 17
          Margins.Left = 5
          Margins.Top = 4
          Margins.Right = 5
          Margins.Bottom = 4
          Caption = 'Server ID:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
        end
        object lbl_ServerIDExample: TLabel
          AlignWithMargins = True
          Left = 316
          Top = 47
          Width = 70
          Height = 17
          Margins.Left = 5
          Margins.Top = 4
          Margins.Right = 5
          Margins.Bottom = 4
          Caption = 'Server DNS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          AlignWithMargins = True
          Left = 249
          Top = 72
          Width = 88
          Height = 17
          Margins.Left = 5
          Margins.Top = 4
          Margins.Right = 5
          Margins.Bottom = 4
          Caption = 'Server Version:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
        end
        object lbl_ServerVersionExample: TLabel
          AlignWithMargins = True
          Left = 347
          Top = 72
          Width = 31
          Height = 17
          Margins.Left = 5
          Margins.Top = 4
          Margins.Right = 5
          Margins.Bottom = 4
          Caption = '00.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          AlignWithMargins = True
          Left = 249
          Top = 97
          Width = 76
          Height = 17
          Margins.Left = 5
          Margins.Top = 4
          Margins.Right = 5
          Margins.Bottom = 4
          Caption = 'IP Local LAN:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
        end
        object lbl_ServerIPExample: TLabel
          AlignWithMargins = True
          Left = 335
          Top = 97
          Width = 69
          Height = 17
          Margins.Left = 5
          Margins.Top = 4
          Margins.Right = 5
          Margins.Bottom = 4
          Caption = '255.255.255'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
        end
        object Edt_ServerDns: TEdit
          Left = 105
          Top = 46
          Width = 121
          Height = 25
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 1184274
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = [fsItalic, fsUnderline]
          ParentFont = False
          TabOrder = 0
          Text = 'www.example.com'
        end
        object Edt_ServerPort: TEdit
          Left = 105
          Top = 69
          Width = 121
          Height = 25
          AutoSelect = False
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 1184274
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = [fsItalic, fsUnderline]
          NumbersOnly = True
          ParentFont = False
          TabOrder = 1
          Text = '5555'
        end
      end
      object Pnl_Connection: TPanel
        Left = 0
        Top = 152
        Width = 435
        Height = 138
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 1
        object Lbl_ConnectionTitle: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 10
          Width = 425
          Height = 17
          Margins.Left = 5
          Margins.Top = 10
          Margins.Right = 5
          Margins.Bottom = 10
          Align = alTop
          Alignment = taCenter
          Caption = 'Connection configuration'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 146
        end
        object Lbl_StartServerAuto: TLabel
          AlignWithMargins = True
          Left = 29
          Top = 50
          Width = 163
          Height = 15
          Cursor = crHandPoint
          Margins.Left = 5
          Margins.Top = 4
          Margins.Right = 5
          Margins.Bottom = 4
          Caption = 'Start the server automatically?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Malgun Gothic'
          Font.Style = []
          ParentFont = False
          OnClick = Lbl_StartServerAutoClick
        end
        object Lbl_BtnPassword: TLabel
          AlignWithMargins = True
          Left = 29
          Top = 75
          Width = 197
          Height = 17
          Cursor = crHandPoint
          Margins.Left = 5
          Margins.Top = 4
          Margins.Right = 5
          Margins.Bottom = 4
          Caption = 'Set Network Encryption Password'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4227327
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
        end
        object Lbl_BtnBlockList: TLabel
          AlignWithMargins = True
          Left = 29
          Top = 100
          Width = 150
          Height = 17
          Cursor = crHandPoint
          Margins.Left = 5
          Margins.Top = 4
          Margins.Right = 5
          Margins.Bottom = 4
          Caption = 'Add an IP to the blocklist.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
        end
        object Chbx_StartServerAuto: TCheckBox
          Left = 200
          Top = 50
          Width = 17
          Height = 17
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14671839
          Font.Height = -12
          Font.Name = '@Malgun Gothic'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object Pnl_SettingsBtns: TPanel
        Left = 0
        Top = 300
        Width = 435
        Height = 31
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Pnl_SaveBtn: TPanel
          AlignWithMargins = True
          Left = 352
          Top = 3
          Width = 80
          Height = 25
          Align = alRight
          BevelOuter = bvNone
          Caption = 'Save'
          Color = 4557312
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object Sbtn_Save: TSpeedButton
            Left = 0
            Top = 0
            Width = 80
            Height = 25
            Cursor = crHandPoint
            Align = alClient
            Flat = True
            OnClick = Sbtn_SaveClick
            ExplicitLeft = 48
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object Pnl_CancelBtn: TPanel
          AlignWithMargins = True
          Left = 266
          Top = 3
          Width = 80
          Height = 25
          Align = alRight
          BevelOuter = bvNone
          Caption = 'Cancel'
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object Sbtn_Cancel: TSpeedButton
            Left = 0
            Top = 0
            Width = 80
            Height = 25
            Cursor = crHandPoint
            Align = alClient
            Flat = True
            OnClick = Sbtn_CancelClick
            ExplicitLeft = 48
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
      end
    end
    object Pnl_Close: TPanel
      Left = 0
      Top = 0
      Width = 435
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      Color = 855309
      ParentBackground = False
      TabOrder = 1
      object Lbl_Title: TLabel
        Left = 42
        Top = 8
        Width = 92
        Height = 17
        Caption = 'LabSync Server'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -12
        Font.Name = '@Microsoft YaHei'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Img_LabSyncIco: TImage
        Left = 5
        Top = 1
        Width = 33
        Height = 32
        Picture.Data = {
          055449636F6E0000010001002020000001002000A81000001600000028000000
          2000000040000000010020000000000000100000130B0000130B000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000FFEEE400FFEEE400
          FFEEE406FFEEE409FFEEE409FFEEE408FFEEE408FFEEE408FFEEE408FFEEE40A
          FFEEE404FFEEE40CFFEEE425FFEEE426FFEEE426FFEEE426FFEEE426FFEEE426
          FFEEE426FFEEE424FFEEE40BFFEEE400FFEEE400000000000000000000000000
          000000000000000000000000000000000000000000000000FFEEE400FFEEE400
          FFEEE44FFFEEE4B2FFEEE4C0FFEEE4BFFFEEE4BDFFEEE4BFFFEEE4BFFFEEE4AC
          FFEEE436FFEEE48BFFEEE4ECFFEEE4EAFFEEE4EAFFEEE4EAFFEEE4EAFFEEE4EA
          FFEEE4EAFFEEE4E9FFEEE497FFEEE409FFEEE400000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFEEE400
          FFEEE40CFFEEE43EFFEEE47BFFEEE4D6FFEEE4FFFFEEE4D3FFEEE47AFFEEE439
          FFEEE412FFEEE46DFFEEE477FFEEE475FFEEE478FFEEE478FFEEE478FFEEE478
          FFEEE479FFEEE4C1FFEEE4E7FFEEE426FFEEE400000000000000000000000000
          00000000000000000000000000000000FFEEE400FFEEE402FFEEE42DFFEEE44B
          FFEEE44AFFEEE448FFEEE446FFEEE498FFEEE4FFFFEEE490FFEEE40AFFEEE40B
          FFEEE476FFEEE487FFEEE42FFFEEE42AFFEEE406FFEEE4000000000000000000
          FFEEE400FFEEE465FFEEE4F6FFEEE443FFEEE400000000000000000000000000
          00000000000000000000000000000000FFEEE400FFEEE42DFFEEE4DCFFEEE4FA
          FFEEE4F9FFEEE4F9FFEEE4F9FFEEE4FAFFEEE4FFFFEEE4CFFFEEE41DFFEEE48C
          FFEEE4FBFFEEE4FBFFEEE4F4FFEEE4ECFFEEE451FFEEE400FFEEE40000000000
          FFEEE400FFEEE440FFEEE4F6FFEEE468FFEEE400FFEEE4000000000000000000
          00000000000000000000000000000000FFEEE400FFEEE440FFEEE4F8FFEEE4B2
          FFEEE45BFFEEE45DFFEEE45CFFEEE45CFFEEE45DFFEEE44EFFEEE40BFFEEE435
          FFEEE4B6FFEEE4BDFFEEE47EFFEEE48AFFEEE483FFEEE40AFFEEE400FFEEE400
          FFEEE400FFEEE422FFEEE4E6FFEEE490FFEEE400FFEEE4000000000000000000
          00000000000000000000000000000000FFEEE400FFEEE421FFEEE4E5FFEEE4A9
          FFEEE403FFEEE40000000000FFEEE400FFEEE400FFEEE417FFEEE407FFEEE400
          FFEEE41FFFEEE456FFEEE404FFEEE400FFEEE411FFEEE406FFEEE40000000000
          FFEEE400FFEEE40EFFEEE4CBFFEEE4B7FFEEE406FFEEE4000000000000000000
          00000000000000000000000000000000FFEEE400FFEEE40BFFEEE4C2FFEEE4D4
          FFEEE414FFEEE40000000000FFEEE400FFEEE400FFEEE43FFFEEE4A1FFEEE494
          FFEEE4A0FFEEE4DFFFEEE48BFFEEE419FFEEE400FFEEE4000000000000000000
          FFEEE400FFEEE402FFEEE4A7FFEEE4D9FFEEE417FFEEE4000000000000000000
          00000000000000000000000000000000FFEEE400FFEEE400FFEEE495FFEEE4F0
          FFEEE431FFEEE4000000000000000000FFEEE400FFEEE409FFEEE4A1FFEEE4EB
          FFEEE4ECFFEEE4FDFFEEE4DDFFEEE441FFEEE400FFEEE4000000000000000000
          FFEEE400FFEEE400FFEEE480FFEEE4F0FFEEE430FFEEE4000000000000000000
          00000000000000000000000000000000FFEEE400FFEEE400FFEEE465FFEEE4FC
          FFEEE457FFEEE4000000000000000000FFEEE400FFEEE400FFEEE411FFEEE422
          FFEEE439FFEEE496FFEEE433FFEEE400FFEEE400000000000000000000000000
          00000000FFEEE400FFEEE458FFEEE4F8FFEEE450FFEEE4000000000000000000
          0000000000000000000000000000000000000000FFEEE400FFEEE43BFFEEE4F5
          FFEEE484FFEEE400FFEEE40000000000000000000000000000000000FFEEE400
          FFEEE403FFEEE408FFEEE400FFEEE447FFEEE48BFFEEE48AFFEEE48AFFEEE48B
          FFEEE48BFFEEE489FFEEE4ACFFEEE4FDFFEEE467FFEEE4000000000000000000
          0000000000000000000000000000000000000000FFEEE400FFEEE41BFFEEE4DE
          FFEEE4B2FFEEE405FFEEE40000000000000000000000000000000000FFEEE400
          FFEEE400FFEEE411FFEEE442FFEEE4BCFFEEE4FFFFEEE4EFFFEEE4E8FFEEE4E2
          FFEEE4E2FFEEE4E2FFEEE4E3FFEEE4C0FFEEE42AFFEEE4000000000000000000
          0000000000000000000000000000000000000000FFEEE400FFEEE407FFEEE4BA
          FFEEE4DAFFEEE418FFEEE40000000000000000000000000000000000FFEEE400
          FFEEE400FFEEE408FFEEE414FFEEE459FFEEE4F7FFEEE474FFEEE41FFFEEE41D
          FFEEE41DFFEEE41DFFEEE41DFFEEE411FFEEE400FFEEE4000000000000000000
          0000000000000000000000000000000000000000FFEEE400FFEEE400FFEEE48D
          FFEEE4F9FFEEE490FFEEE474FFEEE476FFEEE476FFEEE476FFEEE476FFEEE476
          FFEEE476FFEEE475FFEEE472FFEEE494FFEEE4FAFFEEE46FFFEEE40000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000FFEEE400FFEEE400FFEEE43D
          FFEEE4D6FFEEE4F3FFEEE4F3FFEEE4F3FFEEE4F3FFEEE4F3FFEEE4F3FFEEE4F3
          FFEEE4F3FFEEE4F3FFEEE4F3FFEEE4F3FFEEE4D4FFEEE435FFEEE40000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000FFEEE400FFEEE401
          FFEEE41EFFEEE433FFEEE434FFEEE434FFEEE434FFEEE434FFEEE434FFEEE434
          FFEEE434FFEEE434FFEEE434FFEEE434FFEEE41FFFEEE401FFEEE40000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFE00003FFE00001FFE00001FF0000F1FF0000F1FF000071FF0F2270F
          F0F01F0FF8F01F8FF8F83F8FF8FE400FF87F000FF87F001FFC0007FFFC0007FF
          FC0007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF}
        Stretch = True
      end
      object Lbl_TitleCaption: TLabel
        Left = 144
        Top = 9
        Width = 232
        Height = 16
        Caption = 'Configure the server settings and properties.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -11
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
      end
      object Pnl_BtnClose: TPanel
        Left = 403
        Top = 0
        Width = 32
        Height = 33
        Align = alRight
        BevelOuter = bvNone
        Color = 157
        ParentBackground = False
        TabOrder = 0
        object Sbtn_Close: TSpeedButton
          Left = -1
          Top = 0
          Width = 33
          Height = 33
          Align = alRight
          Caption = 'X'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Sbtn_CloseClick
          ExplicitLeft = 336
        end
      end
    end
  end
end
