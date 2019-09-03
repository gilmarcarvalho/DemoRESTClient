object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 555
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 40
    Width = 100
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'URL Base'
  end
  object Label4: TLabel
    Left = 0
    Top = 0
    Width = 713
    Height = 25
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Consumindo Webservice REST/JSON - Gilmar Carvalho'
    Color = 16761220
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    Layout = tlCenter
    ExplicitWidth = 670
  end
  object Edit1: TEdit
    Left = 108
    Top = 37
    Width = 511
    Height = 21
    ReadOnly = True
    TabOrder = 0
    Text = 'https://jsonplaceholder.typicode.com/'
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 89
    Width = 707
    Height = 463
    ActivePage = TabSheet2
    Align = alBottom
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Postagens'
      object Label3: TLabel
        Left = 8
        Top = 39
        Width = 54
        Height = 13
        Caption = 'Postagens:'
      end
      object Label5: TLabel
        Left = 8
        Top = 253
        Width = 129
        Height = 13
        Caption = 'Coment'#225'rios da postagem:'
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 8
        Top = 58
        Width = 611
        Height = 183
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'userId'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'title'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'body'
            Width = 300
            Visible = True
          end>
      end
      object DBGrid2: TDBGrid
        AlignWithMargins = True
        Left = 8
        Top = 272
        Width = 611
        Height = 149
        DataSource = DataSource2
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'postId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'body'
            Width = 300
            Visible = True
          end>
      end
      object Button1: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Processar'
        TabOrder = 2
        OnClick = Button1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Fotos'
      ImageIndex = 1
      object DBGrid3: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 44
        Width = 502
        Height = 388
        Align = alClient
        DataSource = DataSource3
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'albumId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'title'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'url'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'thumbnailUrl'
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 699
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Button2: TButton
          Left = 3
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Processar'
          TabOrder = 0
          OnClick = Button2Click
        end
      end
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 511
        Top = 44
        Width = 185
        Height = 388
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        object Image1: TImage
          Left = 0
          Top = 20
          Width = 185
          Height = 165
          Align = alTop
          Center = True
          Stretch = True
          ExplicitTop = 0
        end
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 185
          Height = 20
          Align = alTop
          AutoSize = False
          Caption = 'Foto:'
        end
      end
    end
  end
  object FDMemTable1: TFDMemTable
    AfterScroll = FDMemTable1AfterScroll
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 476
    Top = 232
    object FDMemTable1userId: TIntegerField
      FieldName = 'userId'
    end
    object FDMemTable1id: TIntegerField
      FieldName = 'id'
    end
    object FDMemTable1title: TStringField
      FieldName = 'title'
      Size = 255
    end
    object FDMemTable1body: TStringField
      FieldName = 'body'
      Size = 600
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 476
    Top = 292
  end
  object FDMemTable2: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 524
    Top = 232
    object FDMemTable2postId: TIntegerField
      FieldName = 'postId'
    end
    object FDMemTable2id: TIntegerField
      FieldName = 'id'
    end
    object FDMemTable2name: TStringField
      FieldName = 'name'
      Size = 255
    end
    object FDMemTable2email: TStringField
      FieldName = 'email'
      Size = 255
    end
    object FDMemTable2body: TStringField
      FieldName = 'body'
      Size = 600
    end
  end
  object DataSource2: TDataSource
    DataSet = FDMemTable2
    Left = 524
    Top = 292
  end
  object FDMemTable3: TFDMemTable
    AfterScroll = FDMemTable3AfterScroll
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 588
    Top = 228
    object FDMemTable3albumId: TIntegerField
      FieldName = 'albumId'
    end
    object FDMemTable3id: TIntegerField
      FieldName = 'id'
    end
    object FDMemTable3title: TStringField
      FieldName = 'title'
      Size = 255
    end
    object FDMemTable3url: TStringField
      FieldName = 'url'
      Size = 255
    end
    object FDMemTable3thumbnailUrl: TStringField
      FieldName = 'thumbnailUrl'
      Size = 255
    end
  end
  object DataSource3: TDataSource
    DataSet = FDMemTable3
    Left = 588
    Top = 288
  end
end
