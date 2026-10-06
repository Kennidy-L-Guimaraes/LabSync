object Frm_MessageBox: TFrm_MessageBox
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Type your message'
  ClientHeight = 173
  ClientWidth = 350
  Color = 2037777
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  TextHeight = 15
  object Pnl_Background: TPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 173
    Align = alClient
    BevelOuter = bvNone
    Color = 3089434
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 259
    object Shp_AgentScreen: TShape
      Left = 0
      Top = 27
      Width = 350
      Height = 146
      Align = alClient
      Brush.Color = 2366483
      Pen.Color = 3155235
      Pen.Width = 2
      ExplicitHeight = 206
    end
    object Mem_Message: TMemo
      Left = 13
      Top = 119
      Width = 236
      Height = 33
      Cursor = crIBeam
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 2695190
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9927023
      Font.Height = -12
      Font.Name = '@Malgun Gothic'
      Font.Style = []
      ImeMode = imDisable
      Lines.Strings = (
        'Write your message here...')
      ParentFont = False
      TabOrder = 0
      OnClick = Mem_MessageClick
      OnKeyPress = Mem_MessageKeyPress
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 350
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      Color = 2037520
      ParentBackground = False
      TabOrder = 1
      object Shape1: TShape
        Left = 15
        Top = 8
        Width = 12
        Height = 12
        Brush.Color = 4259584
        Pen.Color = clLime
        Shape = stEllipse
      end
      object Label1: TLabel
        AlignWithMargins = True
        Left = 45
        Top = 4
        Width = 181
        Height = 19
        Caption = 'Encrypted Messaging System'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -13
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
      end
      object Pnl_CancelBtn: TPanel
        AlignWithMargins = True
        Left = 320
        Top = 3
        Width = 27
        Height = 21
        Align = alRight
        BevelOuter = bvNone
        Caption = 'X'
        Color = clMaroon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Sbtn_Cancel: TSpeedButton
          Left = 0
          Top = 0
          Width = 27
          Height = 21
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
    object Pnl_SaveBtn: TPanel
      AlignWithMargins = True
      Left = 255
      Top = 119
      Width = 80
      Height = 33
      BevelOuter = bvNone
      Caption = 'Send'
      Color = 4557312
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object Sbtn_Save: TSpeedButton
        Left = 0
        Top = 0
        Width = 80
        Height = 33
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
    object Panel2: TPanel
      Left = 13
      Top = 44
      Width = 322
      Height = 41
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 3
      object Shape2: TShape
        Left = 0
        Top = 0
        Width = 322
        Height = 41
        Align = alClient
        Brush.Color = 2366483
        Pen.Color = 4470323
        Pen.Width = 2
        ExplicitTop = 27
        ExplicitWidth = 350
        ExplicitHeight = 326
      end
      object Image1: TImage
        Left = 8
        Top = 4
        Width = 37
        Height = 33
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000640000
          0064080600000070E29554000000097048597300000B1300000B1301009A9C18
          0000075E4944415478DAED9D7B6F145514C0CF99D96D518960402050D1F88826
          3E0234D56EBB650A2C85B6FB28261BBE80F8B75F4049FC18E80730292ADB172B
          2D2D2B94020A8826FCA311D1F00C180328D0DD9DE3B95B28B39BD2EE6E67E6DE
          DDDE5F5276D899EEDC7B7F73EEB977663A8BA0510A945D004D315A886268218A
          A185288616A2185A886268218A214D48AB15DB6D80F12521347221C66CA4C318
          30D353A3DFDE94DD283291262464252E23C2C6A237896C423CC7854A838D231B
          D606CFF4F7F7E76537929F4813D2D699A0053722FA1B108FB2A431C2ECF0A9F1
          E12BB2CAEB176A0B2981082E22D0A0CD5D5CF6DEBACCD9B307B2B2CAEF153525
          A4883A8D9EDA155242BD444FDD0829A286A3A73E8594504BD1B3248414A178F4
          2C3D2125A8163D4B5E48110A448F16320F32A2470B29179FA2470BA912AFA247
          0B710317A3470BF180C5448F16E23515468F16E2330B458F162213A2DB6C6084
          30F0E9D4C43797C55B5A88027043FC38752CD52296B51035A093C752A678D542
          14818518A085A88316A2185A886268218AA185288616A2185A886268218AA185
          288616A2185A886268218AA185288616A2185A886268218AA185288616A218D2
          8584ACC41544582FBB215441BA90F6AD8918EFFD0B40582BBB315440BA104132
          9934AFDDCA6ECADB14E368D9CB6FBD25BB6164A1849052C23B3E7C359FCFC590
          30C9650B01A221BB4C7EA1A41027E170F2C55CF061B7411825821E8EA0E76497
          C94B9417E2A4391A7D76D91D730721450130518F79A7A684381179E7EACD6C88
          C08E12601F47CE9BB2CBE406352BA494A2BC83D00635FA0CB0BA11E2E449DE81
          2411EEE4E869945DA672A94B214E8AF30EF4F1886D8DEC32CD47DD0B71625956
          208B2BA741E1EE6C490911B475266C7008E1A1F467FCBF38BFD10C0A88AA2B21
          ADDB7B371879B387475DBD5CA16D5CABDB5CB734AF1AA6078DE3A74EF5DF2F15
          F2B801DEB7F6340580623C6AEBE3959DDCB535C8A8438D0BD96F843BCFB7D880
          223FF4F2CF2678EA514EF7B99AE3BCB677AE0670BE17EA8CB3501C9251A39A13
          D21C49AE68C83EEC82421450F76293340F933BD6AF094E391FB25978522A1A87
          9F6C45BF70134DF0C671FE8D57BCAC5F4D0829CC316C3B8264C7F858EE72BD3B
          71FCC9B28DF914E66173B110487343758B85F66DB1B76D32A24810F362BEA3B4
          900FB6F6BE6162E02057F93DBFF649447944BCC48BAF3BDE9E15E2A4A323F152
          CE64314409B7F28ED2424256FC2B6E9CBDB2CBC1FCCA07C527F6FD8609313098
          6B03D19536E6A677735B8A4BA0DD9C835656B3232DA41208FEE33C32CE8388A1
          601E468E1F4FFD35D766CDCD1F0783CBAF5B5CF6041271D7862F97BB0BA58514
          BA2CC3FC9ABBE9776597652EB87BBBC08D3DC2D133D4B4BAE1F4D39EBE1DDA1A
          DF8C06C4B999E3BCED96793ED03E99190880174244FF6A9BD06513ED14730231
          9EE1504E1B863D7037F0E0BB9F4747FF2DF7B31E27522E67948FD2101F79A61F
          0D5E21D78970DF54E6D0BCC3E5F648742364316EA3C19351EAE47609CEAE2498
          3C994985C5E2A285585672F934643B79273BF9D37858FAF4CBB02CE6016F37C6
          0B0359C80DFE9019B95EEE7E5A76F4AD0AE4A847C8E142EFE22374850F8D5D1E
          0457B8419BCADDFCD1105EE49B6E02CA1A41FBF3C9B1A13FC5BA2A84EC37DAAC
          F35BB841BA38D484805055A38C9907EF9FE1D79469C2C089F1818B655788FBEA
          86E7AF75801886028F768A4746FE53A190F9284B484937146101AB3CA8D66F42
          0E1930D0B4BA71B2926F450859518E4A93E5509425B77319031E946F6E086EF0
          DC64DFE4F7A941373E6E4E21E2D475F0AED1C6693FC2DD4C84FBEE2DE0E709B8
          4713361B69C86E9C3E74269DBE53EEAF86C3BD2FE44D335238703CBADCEBE5C3
          311F35F27E23BCEDC2E63C51A122BCC30E552EEECCE41D38C17DED1019F98395
          3C3ECF799B5121F72036575706BAC7653846680C7AFDF8582CDCB066C0015E5E
          E7D54E5C63117947307306C014374A4479F0D75134D229DD13D1395E9F060346
          E61BDABA0DD6F82D9D55E71DCB4AACCC19C879D18E710EE822710F18D15103E9
          70CE80F4E9F1C11B322A54EB4266E1AEED16FF335CCD7C4725B01EEFB12DE41D
          82A3BC94AA74BE239B425277DEEBC4A39B04D4D93DB66254C42FFDA681832726
          0E9D955D9EF99873285BCFF7D872F45CE2E8E1212B0DAAF06D08A52C38B7A8EB
          7B6C1731DFF18A8A267BADADC967CC86E948E15E27C438D4C250B94C1633DF71
          93AA67DF3AEF78836BA74374DE71074FCE4FB545E2EBED1CB21C8AB398EDBC93
          65DE3597CFB87C32B114CF4F188AEB25599CDE25AE3973657A3C3A53EC2F2E9E
          6E2FC5D74BB8337967BAC346715993E288F89A9FFB770BCE2F57A732A90D5E7C
          B6D46BEA216BCF3B88B69093E0C869915D9EB2E02E8B003F5AE8926DB528D300
          AACE77C4FD5AFCF253E13BDF7DF87230658438913DDF6109BF0B013CBA1A6B00
          1CCD6452FFF8B56F258538F163BEE3BC0065DB74E47426F587ACFA2A2FA41437
          E63B7E7743955073429C5492776476439550D3429CCCCE778887D440BBC51540
          D10DB18923791620B31BAA84BA11522F68218AA185288616A2185A886268218A
          F13FA7A881A12DFF1B0C0000000049454E44AE426082}
        Proportional = True
      end
      object Lbl_RecentLogs: TLabel
        AlignWithMargins = True
        Left = 52
        Top = 10
        Width = 127
        Height = 19
        Caption = 'Sending message to:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14671839
        Font.Height = -13
        Font.Name = '@Microsoft YaHei'
        Font.Style = []
        ParentFont = False
      end
      object Lbl_Target: TLabel
        AlignWithMargins = True
        Left = 184
        Top = 10
        Width = 114
        Height = 19
        Caption = 'No target selected'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4227327
        Font.Height = -13
        Font.Name = '@Microsoft YaHei'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
    end
  end
end
