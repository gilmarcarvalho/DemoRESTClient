object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 582
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
    Width = 638
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
  object Label3: TLabel
    Left = 8
    Top = 127
    Width = 30
    Height = 13
    Caption = 'Posts:'
  end
  object Label5: TLabel
    Left = 8
    Top = 346
    Width = 54
    Height = 13
    Caption = 'Comments:'
  end
  object Button1: TButton
    Left = 8
    Top = 90
    Width = 75
    Height = 25
    Caption = 'Processar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 108
    Top = 37
    Width = 511
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = 'https://jsonplaceholder.typicode.com/'
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 8
    Top = 146
    Width = 611
    Height = 189
    DataSource = DataSource1
    TabOrder = 2
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
    Top = 365
    Width = 611
    Height = 189
    DataSource = DataSource2
    TabOrder = 3
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
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://jsonplaceholder.typicode.com/posts/1/comments'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 412
    Top = 168
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 484
    Top = 172
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    RootElement = 'Result[0]'
    Left = 556
    Top = 172
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
end
