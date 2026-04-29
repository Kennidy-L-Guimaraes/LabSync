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
    ExplicitLeft = 136
    ExplicitTop = 240
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Pnl_AgentStatus: TPanel
      Left = 0
      Top = 0
      Width = 280
      Height = 636
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      DesignSize = (
        280
        636)
      object Shp_AgentStatus: TShape
        Left = 0
        Top = 0
        Width = 280
        Height = 636
        Align = alClient
        Brush.Style = bsClear
        Pen.Color = clRed
        Pen.Width = 2
        ExplicitTop = 200
        ExplicitHeight = 435
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 25
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
      object Label6: TLabel
        AlignWithMargins = True
        Left = 23
        Top = 302
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
        Top = 339
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
      object Lbl_ReturnID: TLabel
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
        Top = 302
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
        Top = 339
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
        Left = 0
        Top = 253
        Width = 280
        Height = 19
        Margins.Left = 15
        Margins.Top = 15
        Margins.Right = 15
        Margins.Bottom = 15
        Alignment = taCenter
        Anchors = []
        AutoSize = False
        Caption = 'NETWORK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -13
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
      end
      object Shape2: TShape
        Left = 23
        Top = 221
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
    end
    object Pnl_AgentLiveMode: TPanel
      Left = 286
      Top = 8
      Width = 519
      Height = 305
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object Img_AgentLiveMode: TImage
        Left = 0
        Top = 35
        Width = 519
        Height = 270
        Align = alBottom
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000640000
          0064080600000070E29554000000097048597300000B1300000B1301009A9C18
          00000B524944415478DAED9D7B7015D51DC7EF0D3737E481855661D4F04AC925
          09242071A0DAEA08323A0E8848A12D543AB45A9DB614FF80A11D2D3395D24AED
          94B102D3CA7446AD56B0945A8AB6556BA5D3164AC7E04042DE06228CA0A82026
          215C92D0CF2FEE756EC2BEEEEED9BBABDDEFCCCE6E76CF9EF3FB9DCF9EE7EEB9
          894642054A51BF0D08355021908029041230854002A61048C014020998422001
          5308C423151717E71716167E87C3EA6834DA1A8BC536D5D5D5BD65755F08C403
          9594948C8CC7E32F7158953A77E1C285A3BDBDBDD5ADADAD27CDEE0D812896C0
          C8CDCDFD3BA56292CEE5758D8D8D6BCCEE0F812894050C2925DB9A9A9A169BC5
          110251242B182280AC06C8CFCCE2098128901D18E8208DFC353535355D667185
          405C4A83F13230269B046B649B45FB71DC2ABE10880BA986210A813894173044
          211007F20A86E86309A4AAAAAAB0ABAB6B0487798C8087D37BC9EB77261A3DC7
          768601580FD74F1C3B76ECACEAB46DF6A60E9D3F7F7E565B5BDBDB99C61F6820
          894462FC902143A6F7F5F54D23034A38350E67C773FC199B519C941132E18FB2
          AFE7EFD788ABA6A5A5A5CD893D5EC310050A48696969494E4ECE5C0E6FC2E9E9
          EC2FF3221D32ED34BBDDEC5F647BC10EA06CC010F90E64E2C48995ECBECA36D7
          A21FEF95BAD96652D7FFC72840B660887C013261C2844BA8FBE7E3C4529C9CED
          870D22D24FB25BC8E8799751182F1B703D651508A5E10A76ABD8EEC6C1C26CA6
          ADA36EDA93DB9B9B9BFF6A14209B2523A5AC00292F2F1F8BF3AB71EC1BFC3934
          1B695A289030449E0291EE693299BC8FC3956C792EA27A1DE75F25735AD81FE6
          EFC334FEC7C88CB3F9F9F99DB5B5B56738D74B267E2A1E8FC7E8F68EA4773692
          4C1F4DB8895C4B70DF55DC5FCA7137C7F3A9A65E304ACC2F1822AF8044A99E16
          E3D0431C5FE9E0FE26B63FB1FDA3A7A7E7BF562F75EC8AB6EB32DAAE11D4F5CD
          46616CC2380E8CA9AA61F4679CEA08B576E2311CBA2993FBE489E369FE0D4FF5
          4E9EDE26D576D991CD59DB94B6B37D0BB8EFAAB4412910602C64F72BBB033720
          7411761B87BFC6B1BD2A6DC95419C248D97F82F07761FBF3AAEC500264ECD8B1
          43A9CB7FC9E1329BB77C80339BA9EB37A8AA8EDCC8098C417A94D2BDA2BEBE3E
          E9D616D740185D5F4903FA070EA7DB082E734B1B307E03C6BFE7366D15520023
          A57FD1DE2D70FB80B902427776064FBAC0B8C22AAC166E25CDC311978E2B93DD
          DE14D7656AE5561B511E21FC3C7CAC756A9363208944E2169EF41D1CE69B85C3
          C037B47AF6250579A84C99766DCBCACABEC2A94722D6F36B521D2F32EB569BC9
          11104AC67C7A43CFE04CDC22E86FF3F2F2961F3870E0B4CACC742BA7E30C1EC2
          4BB9E711B6C51649C8C0730103CFBF646A5BC640E449C1D827312A66E24C07D7
          BF49A9D8E6519E3A968A411FBDC97BB8FF1711F3C1EE396D36202328190101C6
          1C8CFDA3190C741843E663C8410FF2B35F1515159F969137BDB404B65CCE2999
          17EB292A2A7AC0ECAB0EBB300873A3D5679FE4C5E7221F8E458A4D82650CC536
          109E8AABD9EDB69814DC8D018B30E01DC7B96D207959459BB554A63DB0610AA7
          72D22E2B9B0EB10323A5C993278FA224ED24CE1926717662F7750D0D0DAFD989
          D31610EDC5D11E121E65126C17DDBE4574FBCE39CC735DF1244EC3A91F90F66D
          91811052F205464A94D622995DE0709649DC47E5CD275DFD1356F1590291AFB8
          A90AF671586912EC7785858577505D9CCF28B74D5459593982A76F3D877745F4
          41887C8591920C8CD176D2986B92C6BEEEEEEE1BDADBDBBBCDE2B2044255B545
          1A6893849E2143E48D5FAF13670CD2BC96DD56D21D63124C158C7AC2CC720A23
          A5EAEAEADC8E8E0EE979DE6E92D613D8BBCC2C1E53205417D2BD7BDA24C82B54
          53B7A8ACA680B184DDE338966B124C158C76C2CC700B23256D4D88BC5DBCC624
          4D7943B9C3E8BA211079A9C4CD32E21C6610E4603299BC9EAEE1FB2A9CD1D2BC
          9334B7448CAB289112189AA454DFA1B27BAE8D55F6B24D30087232168B551A3D
          04864078529F23D2397AD7C890F768E4A7D1736857E8C86DDAC87F8849309530
          52BEF4889F407951952F3C58A534F47B4D66BD7792DE7CBD0BBA40641A9DC8B6
          1BF9C0368F089F53E900195313312E8D22E5303E7288078C31CD74AADED715FA
          241F713C6B12640979B875F0C98B80685F8434440C260C49E42132E57BAA0C47
          4368ABE4139CAB4DC2780623CDAF7F12FF0D1CF6A9720CBF1E6577B7417AEDF4
          BACA06F7BA2E0242E9588B536B0C22A9A33F5DAD62DE3FCDE8E5EC369A04F11C
          469AEEE1A9DDA2CA377A5E059D9D9D52F2CBF4AEEB2DE0190084CC913A4FA69A
          2FD1B95F9E9C2FA87CB3A77D04211F2D18CDA0661346FFBB7232F0B32ABF09D6
          5E51EC89E87454E40B4A69FCD35F030F0042E9789000DF3730761319F35D5586
          6AE9DD4B7A0F1B5CCE2A8C343F5790E646F7310DF0F3096CFC9AC1E59F036455
          EA8F8F8048E9C09823DC58A463E4E9783C5E525B5B7B4AB1A1750699E90B0C4D
          B5645095FB6806F829ED71935EDEA2F7F17534BE7E207F44D36E5AC50DBA0B12
          652E891B7EACD2C88A8A8AA9740DF526DCFC84D12FEC9AA27AB69AFCBD1F7BD7
          195C5ECE43B0590E5240E43BAA466E48E8047E870C2A491154254AA4F4D4D60F
          3A2D23FE85665D6A9BDFDABA929DD5B2994A1AF88E8E8E37F4C626A4D7427AD2
          F0F7F503A1E199CD49DD57AC9CBF9FC03F51EDB4CEC0D3F79291E6F39FB1638E
          FB982EF2793DB61B0D196E96C169540BB88D805FD6312C49068C5135D7932E4A
          88F4E6C66B7F060686E6773BB68C531D2F63BC62860D6D06F3744F0164699440
          B22C4C3E5DB968948C615B316C896AC3646694EEA50C88A42B18281829D77372
          7286AA1C6FA5C4C3FFB4DE3B79F2E0545151D128693B6E2680EE57E0049A4946
          ED566D9436DE91B78A4184D12FC647A3BCF876D72CBF65AD8C00D9CCC1B775AE
          9FA408C9FB6A65EF39529A3469D2E8DEDEDEE6A0C210D1D32AA1A7755875BCF4
          2EE3F8FE163E0DD7B9BC5180B4184C153F0E90AF7BE1AC36455D1D541822AAAC
          CBEDBC7275226A88A7221F2EE31B201ED0560172CA80D602803C6B1DBD7AF90D
          434417B5C08B65D522F2FC8BF8F6FBC1E7FBA752A025EB306E1D74E178777777
          89D5FB5F2F140418E84D1E4627EB5A6C49FB4E41DE250D9EC3DB15A54E1B437D
          F98AE4859C912502F29AD1C957776E15101892072F539D7ABA18958230577E3F
          2BEDB3AA36AAC999FDE310AD1B2A0B6C8601E76F5E7C5765A5A0C0D0F4434AC8
          035E2722DF75F5F4F4CCC2E7B3050505CFCB573BBEAF5317050C869490CF5342
          F6F891B6EF40B231379589B451BACC205CF0237D5F8104AD648800B20620EBDC
          C7E44CBE01095AC9D074069BC6A97EEF93897C0112C492A1E93E1AF307FD3420
          EB40020CA3916EE7142F26143351568104B49A12C98BB16B291DFBFD36246B40
          025C3268C72FDC4943FE98DF8688B202C4EE92007632725D9B2DBBB4743D7923
          EA549E3B9EE99A3E59BFC7A94D16CBE65448BE335B4935F5B0EB9814CA53204E
          1758969797DF28F33C1C5EEA855DC4FD2E362D53F97DB22A7906C4ED6A576D9E
          47D6857F49A55DB26835168BAD3874E8D051AF7C77234F80A8FCBD294ACBF57D
          7D7DEB88EB3A9766FD9B6DADCA65075E483910AF7EFC0B305701467E916E9EC5
          52B774BD294B02185F3CD9D0D0B04F7DF6A9975220D9FA25B644225146264FE5
          50D219C9365CF345A63CDE268D06B6FDCDCDCD8DD9C94675520624DBBFDEF949
          951220210C75720D2484A156AE808430D4CB319010863772042484E19D320612
          C2F05619010961782FDB404218D9912D20218CECC9CECF330D03844CCC19FE5E
          96573F4CFFFF283B40E4D7DC7E64743D84A1567680EC00C802BD6B210CF5B203
          E4A700593DF87C08C31BD90122BF42F0AAF673AC29D52693C9D9210CF5B2D5CB
          D2A0DCABFD2FC1FD3939391BEBEBEB3BFC36FE9328DFBF7E0F35502190802904
          1230854002A61048C01402099842200153082460FA1F72A6AE9F3384280A0000
          000049454E44AE426082}
        ShowHint = True
      end
    end
  end
  object Timer_AgentLiveMode: TTimer
    Enabled = False
    Interval = 60
    OnTimer = Timer_AgentLiveModeTimer
    Left = 296
    Top = 16
  end
end
