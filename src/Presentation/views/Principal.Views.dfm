object Frm_LabSyncAgent: TFrm_LabSyncAgent
  Left = 0
  Top = 0
  Caption = 'LabSync Agent'
  ClientHeight = 636
  ClientWidth = 825
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
    Width = 825
    Height = 636
    Align = alClient
    BevelOuter = bvNone
    Color = 1184274
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 634
    object Pnl_AgentStatus: TPanel
      Left = 5
      Top = 5
      Width = 280
      Height = 510
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      ExplicitHeight = 508
      DesignSize = (
        280
        510)
      object Shp_AgentStatus: TShape
        Left = 0
        Top = 0
        Width = 280
        Height = 510
        Align = alClient
        Brush.Color = 1776411
        Pen.Color = 2697513
        Pen.Width = 2
        ExplicitTop = 200
        ExplicitHeight = 435
      end
      object Lbl_MachineInformation: TLabel
        AlignWithMargins = True
        Left = -1
        Top = 78
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
        ExplicitTop = 79
      end
      object Lbl_MachineName: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 123
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
      object Lbl_MachineCPU: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 160
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
      object Lbl_MachineRAM: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 197
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
      object Lbl_LocalIP: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 367
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
      object Lbl_MachineStatus: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 404
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
        Top = 123
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
        Top = 160
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
        Top = 197
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
        Top = 367
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
        Top = 404
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
      object Lbl_NetworkLab: TLabel
        Left = -1
        Top = 320
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
        ExplicitTop = 323
      end
      object Shp_Separator: TShape
        Left = 23
        Top = 282
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
      object Lbl_MachineUser: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 234
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
        Top = 234
        Width = 91
        Height = 17
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
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
        Top = 441
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
      object Lbl_MachineID: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 441
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
        Top = 478
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
      object Lbl_LabSyncVersion: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 478
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
      object Lbl_LabSyncAgent: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 15
        Width = 280
        Height = 28
        Margins.Left = 15
        Margins.Top = 15
        Margins.Right = 15
        Margins.Bottom = 15
        Alignment = taCenter
        Anchors = []
        AutoSize = False
        Caption = 'LabSync Agent'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -20
        Font.Name = '@Microsoft YaHei'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Pnl_Options: TPanel
      Left = 302
      Top = 11
      Width = 519
      Height = 506
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object Pnl_Information: TPanel
        Left = 0
        Top = 363
        Width = 519
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        object Shp_BtnInformation: TShape
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
        object Img_Information: TImage
          Left = 11
          Top = 5
          Width = 30
          Height = 30
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
            003208060000001E3F88B1000000097048597300000B1300000B1301009A9C18
            0000010C4944415478DAED995B0AC23010453BFD700F3E56D2AE45B7A1E8471B
            04EB36742D3E56D22EC28FC65B8D7FAD0454661CE640985012B8274D20104A94
            40DC014CC44484D32B5214C58888B6E8CE51C7DC21038DF7FE885638E76E5122
            18B8475972271FA0C242AF63456A94095A864957EEE41DC891A5697A46B7417F
            1A2BE2C3645167E85D2E1331110922AFEFBF6668014D44EDD6E2C644D48A7CE3
            B07FB23826A2766B7163226A45D45C51D48870632226225D44CD15458D083726
            6222D245D45C51D488706322262248E4F1F4D6B66D8EFE855B2064CA514EDEFB
            BA2CCB599408065644B4E20EDF074476C8B7891209CFD30E6D913C1F45D9E9FE
            04CA01D5453F4FFF2326220D1391C61DF31279423029B9280000000049454E44
            AE426082}
          Proportional = True
        end
        object Lbl_PermissionInformation: TLabel
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
          Caption = 'Information'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Lbl_DescriptionInformation: TLabel
          AlignWithMargins = True
          Left = 164
          Top = 12
          Width = 213
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          AutoSize = False
          Caption = 'Allow retrieving system information.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Shp_StateInformation: TShape
          Left = 419
          Top = 18
          Width = 10
          Height = 10
          Brush.Color = clLime
          Pen.Color = clLime
          Shape = stCircle
        end
        object Lbl_StateInformation: TLabel
          AlignWithMargins = True
          Left = 432
          Top = 14
          Width = 78
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
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          OnClick = Lbl_StateInformationClick
        end
      end
      object Pnl_Commands: TPanel
        Left = 0
        Top = 322
        Width = 519
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 2
        object Shp_BtnCommands: TShape
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
        object Img_Commands: TImage
          Left = 11
          Top = 5
          Width = 30
          Height = 30
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
            003208060000001E3F88B1000000097048597300000B1300000B1301009A9C18
            000001EE4944415478DAED994D4B024118C71BB70DDD824242EA921041510411
            76CB9202C15327F723F4053A28826F7859B00F505FC12E5DA483BD818187C8A8
            207A81C04B74C82842F092DB7F61BA4817DB6D7766993FFCD967DD9DE1F9B9CF
            23332EE9738988D30908906E906C363BE4F178B611C761BFD309F5A837784F51
            942D92CBE57609219B4E676446BAAEEF907C3EDF44EC074C2893C95C389D542F
            423585504DE700691A203AFD90CB7EF9C95F80B022F782F02EF781B8A6B40488
            001120028469990629954A92715455F58B6B10EC634EB1F41FEF743A31CCF1C4
            33C83E4036B017684892B49A4EA71B5C82E07E059B9A32C288933096347BB158
            1C6CB55A07783261C03CC211CCF7CC1D88214DD386DBED7605304B00B9A7302F
            DC81D0B12328B323848B00B981D730EF2B7720747C0030270867E13A7ECDD631
            F73B8F20A300A9205C80EF28C8BFF78BD5A515408F1CC2F37642580A82716314
            620EA7B71482AF66C79809DAE45368F04B386A57935B0652281482F8F68F114E
            C2755996A3A954AA6927846910DC3B80527A8083780A35AFD71B4B26931F5DD7
            AFE1E93FE47686F161BB40FA515235E33F579FCF174F24129FDDA0B87E8570A6
            570ACC59C53A6EC51610962440589300614D0284350910D6244058932B5FBD55
            715C763A113332169A5C96D36F1220ACE91B5D24B503E2FFADA5000000004945
            4E44AE426082}
          Proportional = True
        end
        object Lbl_PermissionCommands: TLabel
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
          Caption = 'Commands'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Lbl_DescriptionCommands: TLabel
          AlignWithMargins = True
          Left = 164
          Top = 12
          Width = 213
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          AutoSize = False
          Caption = 'Allow execution of Shell commands.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Shp_StateCommands: TShape
          Left = 419
          Top = 18
          Width = 10
          Height = 10
          Brush.Color = clLime
          Pen.Color = clLime
          Shape = stCircle
        end
        object Lbl_StateCommands: TLabel
          AlignWithMargins = True
          Left = 432
          Top = 14
          Width = 78
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
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          OnClick = Lbl_StateCommandsClick
        end
      end
      object Pnl_Folders: TPanel
        Left = 0
        Top = 281
        Width = 519
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 3
        object Shp_BtnFolders: TShape
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
        object Img_Folders: TImage
          Left = 11
          Top = 5
          Width = 30
          Height = 30
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
            003208060000001E3F88B1000000097048597300000B1300000B1301009A9C18
            000003774944415478DAED994D68134118869B28550F5614A1B61EA4F6642B88
            909E52F5D81E04AB9E4405857AAA0A5EAC28E4B790A2C44B8AA05504C11C0A12
            3DF9739254056D3DB605D1AA076351D0528A8896C667A4BB4C369B8991922F29
            7961996F3BBBF479766677B289A76E85C4230D501359B122C160B0DEE3F144A9
            8FD33695706E667171B12F1C0EDF9796F82B02C8206DFFFF9C9CCD667F23EFE7
            628C5582C827DA66AEAE9FFAC5BF9EC8B15769CEB1BDE1DCDDECFF9016C9AA82
            AB5AD2FDC2F16B198D71B67646E65A2814EAAB4A11954824B28BD17889CC9A32
            3267B87077D882B0FF5A1691A5F3F67BBDDEEB94CD65945189F1BF2F2E9B48B9
            03AF9FE6195B06E6AD552BB22493C75C13A90A11EAD53C89C294274B5CEDCB1D
            FB09E62AC29A7009810169CA12122B24F21691D65257FB72477F82E589D06E61
            5DF84CF985BA511AD6149DD54DA49BCE87CCBBC78C4CB7346C11119B354F04F8
            7EA6D5209D97552D0D6B8ACE9A27C27E92E608071C0D0402496958537456B711
            99A46307377A3B7D93D2B045442668DA146B8E483C1E5F373F3F3FC7EE029DEB
            E95B90862D14276B8E087507E52BB671F63BA4614D81CFC78D3E66B1E68830AD
            4E31AD6E70F3DC54B534AC29BC0BF5C2396CB13A47648852BDE99D617F481AD6
            14E0135CF4D316AB536494B2936D2FFBA3D2B04544D288ECB1586D111EB55EEA
            EF940D0CD726EA5969D84281CFC3D4FA46BBC162B545B8F35BB979DED1F11EDB
            EDD2B0A644A3D11678A775565DE43022F7E84CD179481AD614A6520FAC299DD5
            16E18F11E65C8096BE50581AD6149843CA4767D5451E207280913958295F831A
            4452343D3AAB2EF211916D74B6F0B70FD2B0A6300AD3B0B6E8ACBA886AE7987F
            1B39282B0D5B28F035C037EB64B5459692A6739F34AC29F0AAB523ED64758A24
            E83C2B0D5B4444ADE609276B8E08B3AB97F9774B1AD614F886994EBD4ED61C11
            0EF0B1C2BF968635055EF589D7E764D545AC77909FD2B085323232B26A6A6A4A
            BD83D43B59F5A7D60443B5531AD614EE893656F40937567D44EE72E031695853
            8057EFE74937567D44CE73E015695853ACDF3BDD58F50F8D5DD44FA4614D01FE
            1123D2E5C6AA8B3451CF48C316119941A4D18D55897CA5DDCCD6C9BC7B2E0D5B
            2870AA55FC699DE3972A5B04CB189617A4414B7142249427A27E0BE19136C00D
            74420D9B34A5216A2ADD665A05DCBE6FAB9A5FA98AA5265269F903F15A73FA9A
            CD8DF30000000049454E44AE426082}
          Proportional = True
        end
        object Lbl_PermissionFolders: TLabel
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
          Caption = 'Folders'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Lbl_DescriptionFolders: TLabel
          AlignWithMargins = True
          Left = 164
          Top = 12
          Width = 197
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          AutoSize = False
          Caption = 'Allow access to files and folders.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Shp_StateFolders: TShape
          Left = 419
          Top = 18
          Width = 10
          Height = 10
          Brush.Color = clLime
          Pen.Color = clLime
          Shape = stCircle
        end
        object Lbl_StateFolders: TLabel
          AlignWithMargins = True
          Left = 432
          Top = 14
          Width = 78
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
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          OnClick = Lbl_StateFoldersClick
        end
      end
      object Pnl_Registry: TPanel
        Left = 0
        Top = 240
        Width = 519
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 4
        object Shp_BtnRegistry: TShape
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
        object Img_Registry: TImage
          Left = 11
          Top = 5
          Width = 30
          Height = 30
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
            003208060000001E3F88B1000000097048597300000B1300000B1301009A9C18
            000004814944415478DAED99576854411486B3AE4B8222A2E625B18B22890F89
            1121B6D81E1451F4C5D840C108C18615443765532C0816A22801F5C5066B47B0
            10D1586204C5F61041144BA2C62EF125A266FD8ECE959B4B92BD77757747D981
            C3997266EEFF9F3977E6DC5D575C984A61616182CBE53A877442E6171414DCB3
            33CFE7F35DC47EACC3C75D73858B485151D14ED462A90702812FA835902B0364
            20C8BC809DF5AD252C44003315F02700FD157D1C3D53113A8DCC67FC5D302290
            B685CDB0FFEB4400D003E077916E3457D1DEAA88ED953EF46BF43CFACF6B4B84
            87B7A354501D879CE3BD98648452494949CFA6A6A60354B320237D3B92929256
            E7E6E67ED58E088BFA0483781D49A75D6F1EF7FBFDEE9A9A9AD5C20B821E6C6E
            BADDEE59F9F9F98FB521C282A3007609802E3C3F81F685D66C019989D921A42F
            CD06E62DE2B43A1875223CB4AB7A2F7AD25C4F3BCFCE1CC2702FD569AA6B2D7D
            9BA246046FBA8A8B8B8F0B20EA55C81816FF66D301099091B04A665E19BBB22C
            6A4478F8627642EE8C4F84D460167E6A772EB665A8A590788C64D06E880A91F2
            F2724F7D7DFD27AA1D00B20F52390E484C61CE29B96B70C008DAB7CCC022BE23
            2CB40BB550354F022A87BE0F6DCD0164322125294B629CBA6BACC01C130935B7
            E141A38C066BCC4095B34E67BC5C8B9EC3F8D5564898EF9A33DC3593CD694BC8
            294AA813AD1EA3DD471DA9C320F39DAE92D4D4D4D2ECECECEF663B48AFC56603
            36AF3C1E4F9AD7EB7D6BF1B03860A4132CAC75D515EA56B6644F5F7BBC9DC7C2
            798075D37583F66C2EBC276AEE5039D9642CD85D13F28EFC0D22269BB100DE0F
            E0EEE8F7E89CF8F8F8CAC6C6C63B7209D2B7819DF13A01AA9C3011396B1C0C61
            27A2C61301BD0F99A272AB47D407A0AFB31BA3EDDC35DC4F43B0CDA63A5D6501
            12460F70426AC488A887CAFA4B00B1996602ED8FE4568309B5676D3820037B01
            2E04FA99865E32BFA31C28904B63DDFB112362F26C1A2024947633EF520BE0D3
            79977E7A1EE96F1A92A4F318C0FDE86BD86C8FFB758196B22BF91127D286F7B3
            F0F01E15724679A33EC6FC29292957CCA79ED843E632D587D4076A4384B54A51
            5E807F461F56E02BAD47B689483B6CEA902424DDFC3B40B47724130F5743E405
            D28BB59B82CD21A4764062499C25CB8E2A1175183C01586F956F5DB741FE6778
            49A209A9DFEF535489280F6F81C84A806DA7BEC2061149716AA926332F83F0BA
            D38C48984BB3DCCCE2986128D9893A40F50AF673919A63FCD4B49175D7459248
            AB3BA8C2EB997C5DDA0D2F6C46A32A9147AC3BA01991708596CD9446D2F8154E
            C2CB38BD203F84F9B77521623BBC24E7424D87F402ECBAA0E1EE2BD28248B0F0
            32C02BE9631A7A8ECC65EDCB5A10918257B74164B9115EA43583A88BE7675B6E
            FE3AB9F99123D85519BBA70D11C68773AC565195CFE4068BE705FC5105BEBAA5
            D0D38688FA594942A5876ABF401D93B48570AB0E76EB6B4344D9CAB13A1EA900
            7C959D94454B227F526244B425A259693537FBD78838DE41ED422BD4508C11D1
            C53E464437FB1811DDEC634474B3FF7F89E8564221E2F83FBB7017F94F904FDA
            2C27737E00E31F2E0F8625D5070000000049454E44AE426082}
          Proportional = True
        end
        object Lbl_PermissionRegistry: TLabel
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
          Caption = 'Edit registry'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Lbl_DescriptionRegistry: TLabel
          AlignWithMargins = True
          Left = 164
          Top = 12
          Width = 242
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          AutoSize = False
          Caption = 'Allow editing of Windows registry entries.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Shp_StateRegistry: TShape
          Left = 419
          Top = 18
          Width = 10
          Height = 10
          Brush.Color = clLime
          Pen.Color = clLime
          Shape = stCircle
        end
        object Lbl_StateRegistry: TLabel
          AlignWithMargins = True
          Left = 432
          Top = 14
          Width = 78
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
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          OnClick = Lbl_StateRegistryClick
        end
      end
      object Pnl_Shutdown: TPanel
        Left = 0
        Top = 199
        Width = 519
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 5
        object Shp_BtnShutdown: TShape
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
        object Img_Shutdown: TImage
          Left = 11
          Top = 5
          Width = 30
          Height = 30
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
            003208060000001E3F88B1000000097048597300000B1300000B1301009A9C18
            000006254944415478DADD9A7D4C955518C0DF8BC06511F382A360B6A5A559B8
            9C4C2AA2C59C951F888ED5C61FB5FEE89F707DE12CDAC090CB57C0D41A9119B5
            F547736BA3656BA4A2AD98A34C71E864D6251267D3454906544697AFDBEFD93D
            EF76EFEDBD977BB92FBC37CFF6EC9CF7BEE73CE7F99DEFF3BCD7A6DD20C166B5
            01FF1B90EAEAEA5344D35555550FC62C08C6C51115DA6CB66DC4979D4E678901
            8847E5B519BCFB906811F2EEF4F4F4219EA7E71504A31231FE79922F122F553F
            7FCFEF2B23041920BA433D5E445A323232F69594944CCC3908953F2C2D8864C9
            B3C7E3F911987768D10F78F74724208D8D8D0BDD6EF73324A55196297DDF21DB
            28F7F59C80343737DB4746469AA9E4590C97727D18FF327147A821110A440F6A
            8816A0760FB2823A3CC432DCB6537EDC3490868686D4F1F1F18324D752C70495
            BCE17038AA4A4B4BDD33950D07440FADADAD098383833BD0EFE43189BABE418A
            D0F15BD420B5B5B54BA7A6A68EA896BA1C1717B765D7AE5DE7C269804841F440
            DED5D4D34EF236CDDBF39BD07369D620284C03E08440F0D88BF2C2CACACACBE1
            1A345B100975757599939393EDD4BD4660121313F3CACBCB872306919509C38F
            6ADEE1D483ACC5A8BF2231261A10094D4D4D29636363C781C9A6FE4E6463B039
            1354397BC27ED91F643821B928F8395243A2059140CF2C66689FD4BCC36C3F7A
            9E0B1B4496588C97967023B991CC09B34154599933DF62931DC9375A9A6D0685
            64489DD5BCFB4425CF75B335C02C10098C902A59CD649FC9CCCCCC0EDC348D76
            DB1D447B29E0425687BB8ECF3588EC63C3C3C3E7D4EAB91DB0E6A0206D6D6D0B
            5C2ED705924B90022A3F124DE56682281D856A59BEC892BCDC7723B605642C22
            E3A772EC20BD027A4F2C81C8868F3E97DA0EB6A2B3DD1084EEEA20D30692A564
            7A2BDA8ACD0651FAB613BD8974A073D37F40F8F1267A43369C38BA2D9D0223B1
            08821E07760E91C4CCE954F4FF1D08F22819BE20D94DFA01332A9D0B10A5F334
            510EB20EBD9D7E200CAB5A86D56B2477F3F2D51807D9432427EF6AF43AFD4078
            29C791F548112F3F8B65107D51D27CE6896F8FF4D323CB19776BA8FC4C8C83E4
            0022C3AB8FF43D812023802C24C3124EB83FC53208578BDB69F04B2CC7C3D89D
            1608320E48021992F595205641D40A7B9DE43869BB1F0815CA6D2F11107BB4C7
            9200902EB9BAD250F966E954D7EE7F50EB466F5220C835A234401691FEDDAC4A
            E722D4D7D7A773E9BA0AC81020B7F881E8931DC9E2D8EEB2DAD850A1A6A66625
            10E7911FB0FB6E3F107AE110518166F2F23B1701FB1E678E7C02483B205B0341
            F44D867C5535561B1B2A60AB53ECD47C366FDF238A7EF2ED84729DD5C6CE0072
            9C289FF9BC85F4E77E20E2BB72BBDD72189B0426C3AC43A3D9413C3B34F8A0E6
            3DDC2ED2BD9B7E6BBB7E4C116F22BDF2BED5461B056C1487F97EE430509BF5DF
            03EF234FB16A1D10F70FE91CAB8D0E0CEA62D5A3DC434F62E3478620EA5E3C40
            C6C53C6E84F8A8D5C6FB069FABEE1587C3B1CCD7651BCAF970362B2BEBBEE2E2
            E229AB0114443C103D245769063758237750123D721EB9D3C85B6155D01B18E9
            A73756053AD08339E8E48C7F189031E565ECB5124277D0914C62A5DA803DC702
            F3847299EEA357C43DD99F90909057515171CD0A0875AE3AA1793F04B500F592
            51BE504EEC245AA18B640EBD722A3939F991B2B2B2EBF309810D3763C39724EF
            47BA1952F9C1BEC984BC23486B4C4C4C7429EFDE697A66F3CE9D3B87E609224D
            AD5079D43D40DD0F51F7AFC1F287F5A18771296352BA564EC8C5D138B5C38490
            39F1B1D429CE42647D541F7AF440CFDCCA3895338D0CB331602A807B1BE59326
            03C8122B73A01E910B53B73A4F5D9DA96C249FC36459DEAB1600D965C5A15C6E
            867F58766CEE187285785DF3EE13125A981365E17CA78C08C4076823ADD6A2A9
            CFC9843318F29EDD6E6F0BF5692C882E9907C5EA4B71B68292A1F482D1126B2A
            8832405634F99AF58A3ACE48907BFE497EFB8ADF7A91FEF8F8F85F3851FF292F
            014D219D49F22EDEDD8BC85521174954E5AF20BBE985D6707B216A103DC8D96C
            7474F4098C7F1A790CE31644A842E6D831CA1E484D4D3D381B0053407C83FA17
            83784AE49F11E2349315271DB814794F5A7A4626ED057EEB23EE62221F37FAB7
            84A52056871B06E45F39148360FB9432810000000049454E44AE426082}
          Proportional = True
        end
        object Lbl_PermissionShutdown: TLabel
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
          Caption = 'Shutdown'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Lbl_DescriptionShutdown: TLabel
          AlignWithMargins = True
          Left = 164
          Top = 12
          Width = 242
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          AutoSize = False
          Caption = 'Allow computer to shut down or restart.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Shp_StateShutdown: TShape
          Left = 419
          Top = 18
          Width = 10
          Height = 10
          Brush.Color = clLime
          Pen.Color = clLime
          Shape = stCircle
        end
        object Lbl_StateShutdown: TLabel
          AlignWithMargins = True
          Left = 432
          Top = 14
          Width = 78
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
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          OnClick = Lbl_StateShutdownClick
        end
      end
      object Pnl_Downloads: TPanel
        Left = 0
        Top = 158
        Width = 519
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 6
        object Shp_BtnDownload: TShape
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
        object Img_Downloads: TImage
          Left = 11
          Top = 5
          Width = 30
          Height = 30
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
            003208060000001E3F88B1000000097048597300000B1300000B1301009A9C18
            000003084944415478DAED984B6B1351148033C988310BAD8295B8150B628BB8
            288AF82056F1854A15E9B2D485F9010A89256F12CC42F70617AD3B2958028252
            250BAD82D6554BEB63278846A40BABC512F3F2BB32912424B19DB133D3760E5C
            CEB999B9E79CEFDC3B77EE44B2AD12918C4EC00259D3209148A41F95922469BD
            9EC995CBE51CCA4BFCBB9A41C2E1F076BBDD3E83D9A62744957C277E673018FC
            A809846AA49989F398A3405DD49380D8A3C4EEC57C48EC33AA4170D487A37B4C
            F19C2CCBBB0381C0273D41E2F1B8BB5028CC90C3665A5F28141A59320815D8C2
            E037B46D805C01EA8E9E101521AE971C6E63CE964AA55DD168747649200C1846
            F503F114280FCECA4680105F229727C4EFC11E066C60D1200CF4302883F98B07
            6D2F53FAD608888AC462B19DCCC624301BD027C8EFF13F41A8BE8B0153B41DC0
            0C52811B46425484E4075109DA0760BAE8CFB704E1869BA8AB404CBADDEE6EAF
            D79B371A42482A955A97CD665F53E03D746F51F06B2D4198819F620A35C47C4E
            9043AD6EA0582F5007D406A0C80BE4E96A094210CD0FB5D3E9DCE8F3F97E34BA
            964C2637E572B96F5A6350AC9ADC9B82D4DFB81861ACD8E72FB1867BB1D34D12
            B8C006729FAA8E88F7948A180DF3FBDF20E2049026C9F7B4FDF46B2A8FCF3620
            5E6176D0CED17F604A1065CF1FE3193B2E60D0D7999D8C72F918106207ECE0DA
            18FE4FA97937E90252557551E9834D60C77986CEFAFDFE3935FE750351C6CA0E
            87E332490FD0BA949FA76843F487885150EB5B5790E5140BC46C621808EF8A97
            A8125AF59BDC14207AF9B3402C100BC402B1405636082FBC67281787C2D3F8F8
            DACA1F763B27E44798F3D847CC0632C1F74537E634DF203D15987A7F0A84F846
            E9A44DD0DF672A904422B1359FCF678011C7F6771CE38F0602816CB5BFFA7B00
            F670FD8BA9409AC1148BC5CFE29A2CCBED5A21740351C6552F9D6945DBAAEC9A
            A5675A10217533532D7F979C5ADFBA6FBF0D6034431802A2F8F8B3CD8A7F5768
            27D52E27C34196432C10B3C9DA0531BB2C0664DCD6E4EF4EB388F8DB95B3DDE1
            96202B552C10B3C9AA01F90DDD957F510FDEAA930000000049454E44AE426082}
          Proportional = True
        end
        object Lbl_PermissionDownload: TLabel
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
          Caption = 'Downloads'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Lbl_DescriptionDownload: TLabel
          AlignWithMargins = True
          Left = 164
          Top = 12
          Width = 221
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          AutoSize = False
          Caption = 'Allow downloads from all sources.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Shp_StateDownloads: TShape
          Left = 419
          Top = 18
          Width = 10
          Height = 10
          Brush.Color = clLime
          Pen.Color = clLime
          Shape = stCircle
        end
        object Lbl_StateDownloads: TLabel
          AlignWithMargins = True
          Left = 432
          Top = 14
          Width = 78
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
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          OnClick = Lbl_StateDownloadsClick
        end
      end
      object Pnl_Messages: TPanel
        Left = 0
        Top = 117
        Width = 519
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 7
        object Shp_BtnMessages: TShape
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
        object Img_Messages: TImage
          Left = 11
          Top = 5
          Width = 30
          Height = 30
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
            003208060000001E3F88B1000000097048597300000B1300000B1301009A9C18
            000006294944415478DAED9A0B4C95651880391CB928172FB30DC9599822E025
            B1B6AC10725AAE684DCD91B76E5B490DC31CB243ED20D784C54E85668BD574B3
            D0C4CA4B8E4AB7AC2431BB6A0A4AC3EC82E156020589D4819E777DA71D7EFE73
            819DC3CF9CDFF6EE7DCFFF7DFFF7BFCFF77EB7FFFB8F29E00A4926A31DB80AE2
            2F90BCBCBCF1818181B7F6F4F4DC6C329926A163D023C90A5745DAB9D6863E8B
            34627F111414546BB55A9B0C07292A2ABAC16EB73F84B908A7A7EB9551CE0728
            28BDFCE3E4EDE9EEEEDE5650507076504168FD241EFE2CB2809F81CAA16FF8FD
            29FA73E40C97CEE258ABE6BE51A889949B829E8D4E46CF54D9DDDCF73ED79EA3
            5CAD5F4178C044BA4F39E6BDEA92B46005D776E6E6E6FE38C046B99EFB9702B1
            0A8818D5287B91A76988733E05A152139566F2A00DFC1C212D8E9D4B777887EB
            DD0301D0010A349BCD69D45DC0CF587407DA929F9FBFD92720656565611D1D1D
            5B705C1E72894B05681B00FFF802409B2A2A2A829A9B9BB3317391509EF55658
            58D863D9D9D91D030629292919DDD5D5558D395BA2802C06A0CE1F00DA545858
            385D224E034EE6E711EC54ED98F30A84508753C9C7C84D001C421652D11F8301
            E148A5A5A5233B3B3BF7E2438A4CD74466AEABC8E88254555599EBEAEAA48254
            2AF85041740E268423D96CB6E1EDEDEDFB30E7E3C77BCA973EE352178401F68C
            1AD8DF868686265B2C963F8D8070247A472433DB61CC198885DFCF7B04A1D00C
            20BEC4EC641649645A6D3412C2911833931927B2560521B3D6AF5F7FCA2D08D1
            3840C13B319F04EA55A3019C135D6A356A13F201BEDDED1284CC6442F809E6C9
            F8F8F89969696976A39DD7F8370CFF8E6326109D3980D5E88290B10BB58488AC
            2074DBDDB48CF4D7243FF95B83C3735C65D2C55632E0DF90F585DEB3AC0F880C
            28007EC3BC48A10938DB650408CF3E8C83C9AEF2CBCBCB435A5A5A7EC68CA4EC
            587C69D7822C216CBBC87C9D8A1EF7536BFB24E1FC16D4A374AFFBB1DFED05C2
            8517506B89CA0374AB2AA39D7597E85EB2C9DC81692300EBB4200751F3018903
            E48CD1CE7A00890744B64A070059A005A947C545454505A7A7A7FF6DB4B3EE12
            CE07330C2E0353CF3048E805C285F3A84874B8F6461F0EEE3E33921775EBCE62
            DC277BAE56F2AED582FC821A831EE12F10BD19C953DDAE66319720647C879AC6
            4C30DCA80DA2B7C96DD7721AECB10CF6EF8D76D65DF234D84B51160AAC84B2D2
            6867DD2559D16970D979E84EBF8B50B2B8BC46E62AA39DF500B21590473017E3
            EBEE5E20EADDFC02052E334EC619B54509F0B0D7922D4A6B6BAB4C4CE1F8794D
            9F2D8A22AD046439DD6B39F60E23403CEDB5C87B101FB7516E3BF60AC775ED36
            7E967AA96A484848983AD4B6F1EA84E504661CD1B89D063DA20B22894CE9730B
            21CE847893D1CE3B27FC594343BF84594DA3A73AE7E9BDEACA91E609C4047522
            600D460328BFE2583BBEA281CDE84496887AB7208A3C038E97314F86848424E5
            E4E4B4190C310A7F6A90A980ACC33F9BB68C2E881C91B2E86CC57C58CEB42222
            2252B3B2B22E1904310280FDC85C7EEE51EF20DE1D07A90A82B9B91A9907CC67
            C87D54707190212412FB10998E8F02310F1FFED22BEBF6C8541D8EC94B969CBE
            3750D1322AFA7A3020E81137D2786F634E426AD491A9CB934E8F87D86ACA7B11
            33039145728D3F8F89D4F364AB642512215CAA046295AB48780DE2D442721ABF
            136962B08DF735803AA65D8AF3F9FC944F7772BA99CDB32ABCB9DF6B10A210CD
            B4D7C4036AA9FC365F01A88F474B31D391093D32D3984CBB89C25AA2F093B7F5
            F427228E17FECD3C7CB5369F873E41FE149C3A25DF0571E487E8E8E836E7D766
            EE1B839A68369B6565BE053BC5F1ED917B6417B11FBD81BA8EF5B741BC06210A
            3205CA6A7A170E1D74726E18D76D48A68B5BA56FCB47A148BD4CF5EDD1F131F4
            5C7F01FA05525C5C3CCE6EB74B98CFF3C018C73C0E442C11903E7C070E5D40CB
            16E23A6C6965F91E28D3E768598DD11DE8DFD1E7D08DE86344E6A8D56AFD75A0
            CEF71B04C737A29E423270FE15642C8EC8A707E962C1C869001751EEB42F9CF2
            0B084E4F933D4EC07FDD43BEEBC9E2748F0290AEB11D4977BC170C5910C6C647
            6A7BF07F52338B9CDA17027AC84800AF4168E9375129AA7FCB5F2F6A8850F550
            3B8DBCFAA79AA196AE18907F01EF846C603083AFFA0000000049454E44AE4260
            82}
          Proportional = True
        end
        object Lbl_PermissionMessage: TLabel
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
          Caption = 'Messages'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Lbl_DescriptionMessages: TLabel
          AlignWithMargins = True
          Left = 164
          Top = 12
          Width = 242
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          AutoSize = False
          Caption = 'Allow sending message or notification.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Shp_StateMessages: TShape
          Left = 419
          Top = 18
          Width = 10
          Height = 10
          Brush.Color = clLime
          Pen.Color = clLime
          Shape = stCircle
        end
        object Lbl_StateMessages: TLabel
          AlignWithMargins = True
          Left = 432
          Top = 14
          Width = 78
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
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          OnClick = Lbl_StateMessagesClick
        end
      end
      object Pnl_LiveMode: TPanel
        Left = 0
        Top = 76
        Width = 519
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 8
        object Shp_BtnLiveMode: TShape
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
        object Img_LiveMode: TImage
          Left = 11
          Top = 5
          Width = 30
          Height = 30
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
            003208060000001E3F88B1000000097048597300000B1300000B1301009A9C18
            0000021D4944415478DAED993D4BC34018C7935614B10A8E8A1FC0C1599D0475
            B48383A34EE2E02228D8144CFA66B08A2F9FC141475DD4D1BAEBEAEEE20B386A
            112CA5F177984AA9556B95E412EE81877B72B9BBFC7F77C73579AA6B2131DD6F
            010A4481486E0A44365320B2D907483A9D8E47229165C77146745DEFF2504311
            BFC4F7D070F627906C366B53AC7928BEA13189762693B15A027157E284415E59
            09331A8D1E9AA6F9E09578DBB6FBCAE5F22CE13ACFEFA08CB7B2323A33506080
            71E25506D8F10AA0DED815098A2DBC808EC966FBD1B60DFD0B02E489A09B95E8
            F772251A08EA6767DCB1339ED1D4F3537BDAE9B95C6E9A70031FD49909C71DC8
            F713AC592DDC1F055AACDE58B52E5020D40F0190278CBB55B7F8406040B81E60
            FB8BD36C9E322AB61FE55E2C16DB2A168B2FD283E4F3F9DE52A964207C09E19D
            549588F7718BB68FB57DA404A9542A1D085F14B2287B45157EC4B6322CCBBA69
            D4474A10AD66EF33FB6778927BD7DFF591154498786D49A2EBA2993EB282CCA4
            52A963B695D36C1F29417EA34581281005A240FC07D1C272FC0AE3D7FC0A1023
            E83F88E1784509CD4B63685EE37FFAB0D2DE7361BB81F9B0AAB7C07FEA3600FA
            9C7C08533AE89C60821B0906D8F60B84671B4CE8A6D66A820E9029AE4FDD9469
            8AA3EF80BA7BAF00C44AF0DC393CC765BBD66ACAD49D0D917735BD12FF95FD29
            895D0DDC9559C187F19887FAFFEF6F8530980291CD14886CA640643305229BBD
            01349DCE44F39CF6300000000049454E44AE426082}
          Proportional = True
        end
        object Lbl_PermissionLiveMode: TLabel
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
          Caption = 'Live Mode'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Lbl_DescriptionLiveMode: TLabel
          AlignWithMargins = True
          Left = 164
          Top = 12
          Width = 242
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          AutoSize = False
          Caption = 'Check the computer screen in real time.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Shp_StateLiveMode: TShape
          Left = 419
          Top = 18
          Width = 10
          Height = 10
          Brush.Color = clLime
          Pen.Color = clLime
          Shape = stCircle
        end
        object Lbl_StateLiveMode: TLabel
          AlignWithMargins = True
          Left = 432
          Top = 14
          Width = 78
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
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          OnClick = Lbl_StateLiveModeClick
        end
      end
      object Pnl_Screenshot: TPanel
        Left = 0
        Top = 35
        Width = 519
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 9
        object Shp_BtnScreenshot: TShape
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
        object Img_Screenshot: TImage
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
        object Lbl_PermissionScreenshot: TLabel
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
        object Lbl_DescriptionScreenshot: TLabel
          AlignWithMargins = True
          Left = 164
          Top = 12
          Width = 149
          Height = 17
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          AutoSize = False
          Caption = 'Computer screenshots.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 8355711
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Shp_StateScreenshot: TShape
          Left = 419
          Top = 18
          Width = 10
          Height = 10
          Brush.Color = clLime
          Pen.Color = clLime
          Shape = stCircle
        end
        object Lbl_StateScreenShot: TLabel
          AlignWithMargins = True
          Left = 432
          Top = 14
          Width = 78
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
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = '@Microsoft YaHei'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          OnClick = Lbl_StateScreenShotClick
        end
      end
      object Pnl_AboutOpt: TPanel
        Left = 0
        Top = 0
        Width = 519
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 0
        object Shp_AboutOpt: TShape
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
        object Lbl_Permission: TLabel
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
        object Lbl_Description: TLabel
          AlignWithMargins = True
          Left = 164
          Top = 9
          Width = 149
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
        object Lbl_Status: TLabel
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
    object Pnl_LogReceiver: TPanel
      Left = 0
      Top = 520
      Width = 825
      Height = 116
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      ExplicitTop = 518
      object Shp_LogReceiver: TShape
        Left = 0
        Top = 0
        Width = 825
        Height = 116
        Align = alClient
        Brush.Color = 1776411
        Pen.Color = 2697513
        Pen.Width = 2
        ExplicitTop = 200
        ExplicitWidth = 280
        ExplicitHeight = 435
      end
      object Pnl_Log: TPanel
        Left = 8
        Top = 6
        Width = 797
        Height = 43
        BevelOuter = bvNone
        Color = 1776411
        ParentBackground = False
        TabOrder = 0
        object Lbl_ExecutingCommands: TLabel
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
        object Img_LogReceiver: TImage
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
        object Pnl_Connection: TPanel
          Left = 442
          Top = 0
          Width = 355
          Height = 43
          Align = alRight
          BevelOuter = bvNone
          Caption = 'Pnl_Connection'
          Color = 1776411
          ParentBackground = False
          TabOrder = 0
          object Shp_ConnectServer: TShape
            Left = 9
            Top = 1
            Width = 339
            Height = 37
            Brush.Color = 1776411
            Pen.Color = 2697513
            Shape = stRoundRect
          end
          object Img_Server: TImage
            Left = 20
            Top = 5
            Width = 25
            Height = 25
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
              003208060000001E3F88B1000000097048597300000B1300000B1301009A9C18
              0000041F4944415478DAED593D6FD36010BEB3DFA4850AA1F221920CB0010303
              1F652269416264410844610106D868114894160910B4140989960D069800F1A1
              2EFC82360942022418E9061249684B5B84A04D63FB383BA1C48D9B38891D3755
              3DC4F69BD7F73E8F7D77CF9D8DB04C36F41AC09227928E8776C944BD04100102
              E285A22A624F4338F1B16E88503CB85DD1E80322AE368D13FD1128EDC670E273
              5D1051628121367D98813F1742EB30C654F93E2F768C0F87443879A42E886462
              C13136BC51CE28413C309ED2C768784350957D092218F345929B5688D492C8BC
              6B01BC10202EE8632A2803BC3B0AF5E45A140B6D5388DE21C21AD338C12F81B8
              B76E82DD003D12DAAA48DA65043C639C033D129A74075B13A36EACE7BA202AB1
              20E97B762757D72A30EEB490554BC42E1E93713784AC1A22E95868A7C411C717
              3695C263326ECA36B27ADE18AB52C8AA21C2D7BEE6DD213B784CC6DDC8FFD510
              29078F35113513C2B689A4E942A0295F38B5AEB64402939CF59A2DF114236272
              AD8C92AD917C62507F947CA10EE88900E8C148F2AB9B44281ED8A210F47168B7
              B316A1151E28E65A86900107BB4570F14C896D36329F591E1A108DE97E6C99FA
              E924117ADFBC56996DB8C2871DF36B116805C907E0B700DCB368B0EB9B9E2938
              DDDDE2C9ADC604846155937AFCA84D33C93E1E3991BB4BE348DA0D79D5F787D8
              02996A88D07BF0A933C17384748D4D6FC83E7D7ACA60BBE7406A9641EB35E121
              E96A43E4DBA77C1B65FBED5C34B8871FCD5D3EDC9FBD3B34CAACAE8A48EA6525
              4432D1D04104BAC74876E486DEF223B8E8DF9778530EAE8AD5D62E80C588947B
              435C23622C6EB8C4A6B384D2353DDBE5BB04076AA3825A172F71CA7045A2C782
              A47E90B5B439906982FFBC5ECA455D25F29FD08220259A61D34A41F5CB41CABF
              725ED218E4A471DB4ED2A8099179A0D1E06605A097ADB6B361D94A91F9A9693C
              F39990388DEF4B7D716A6D773AC468E007A7CC75968A5CA1B07A4BC4529169D2
              1749AD5FD244B28A8C3739188E737CF82C2B043EE4D3678233543915424D8814
              2A3207B5A1C885AD6EB64280A62515EC968A8C1CC808DD9091FD8A50BB38CD9E
              CEA5D9474291B3E9D75421E8E917B942483EF024FDBA25887238F58A0992EB44
              E6628116095007D0960FC0D11245834BFED664BC2A22A61E599F4030A282D4ED
              97D4E942452EED12F68BC6051542CE45E7888B461D0F72D168B7672FD6232F28
              E36D076905653C9735D059B48C2FDDB32FDE23E7DFA57214B9A2C6EA5F850070
              72BEB172AC67079A66456EB60BA61A22FFF1E45A5D477B762F5F3E38D9B38327
              AF83ECE3B1D7B35BF4C8B520520E1E7B3DBB458F5C0B22E5E059BE2FB19DDA8C
              CF0ADCEAB2069C36CE73AD6E5D7D5630849568A4EE3FF4988455CD741A63B26F
              60E5ABAEE7441C14564F88B821AC9E107143583D21A26F4E0BAB67446ABD2D1B
              227F01DAE0D260BCF933890000000049454E44AE426082}
            Stretch = True
          end
          object Lbl_ApplyServer: TLabel
            AlignWithMargins = True
            Left = 280
            Top = 8
            Width = 61
            Height = 18
            Cursor = crHandPoint
            Margins.Left = 10
            Margins.Top = 10
            Margins.Right = 10
            Margins.Bottom = 10
            Alignment = taCenter
            AutoSize = False
            Caption = 'Apply'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 56044
            Font.Height = -13
            Font.Name = '@Microsoft YaHei'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object Edt_ConnectServer: TEdit
            Left = 52
            Top = 11
            Width = 230
            Height = 23
            AutoSelect = False
            AutoSize = False
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            CharCase = ecLowerCase
            Color = 1776411
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5131854
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsItalic, fsUnderline]
            HideSelection = False
            ParentFont = False
            TabOrder = 0
            Text = 'https://company.com/lbsc'
          end
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
        TabOrder = 1
        Transparent = True
      end
    end
    object Pnl_Separator: TPanel
      Left = 0
      Top = 515
      Width = 825
      Height = 5
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 3
      ExplicitTop = 513
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 825
      Height = 5
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 4
    end
    object Panel2: TPanel
      Left = 0
      Top = 5
      Width = 5
      Height = 510
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 5
      ExplicitHeight = 508
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
  object TryIcon_LabSyncAgent: TTrayIcon
    Animate = True
    BalloonHint = 'LabSyn Agent'
    BalloonTitle = 'LabSync Agent'
    Visible = True
    OnClick = TryIcon_LabSyncAgentClick
    Left = 286
    Top = 560
  end
end
