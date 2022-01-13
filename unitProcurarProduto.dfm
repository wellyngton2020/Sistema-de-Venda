object frm_procurar_produto: Tfrm_procurar_produto
  Left = 0
  Top = 0
  Caption = 'Pesquisar Produto'
  ClientHeight = 476
  ClientWidth = 840
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 840
    Height = 129
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 56
      Width = 182
      Height = 25
      Caption = 'Nome do produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_aviso: TLabel
      Left = 34
      Top = 0
      Width = 766
      Height = 30
      Caption = 'Coloque um % antes e depois do nome pesquisado. Ex: %Coca cola%;'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = 'Bassoon'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object e_procurar: TEdit
      Left = 8
      Top = 87
      Width = 345
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = e_procurarKeyPress
    end
    object btn_pesquisar: TButton
      Left = 359
      Top = 87
      Width = 98
      Height = 31
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_pesquisarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 840
    Height = 347
    Align = alClient
    Caption = 'Panel2'
    Color = clGray
    ParentBackground = False
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 825
      Height = 320
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'C'#243'd. Produto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -17
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o '
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -17
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 551
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Title.Caption = 'Pre'#231'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -17
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 126
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = quProcurarProduto
    Left = 600
    Top = 64
  end
  object quProcurarProduto: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from produtos')
    Left = 528
    Top = 64
    object quProcurarProdutoid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object quProcurarProdutocod_barras: TStringField
      FieldName = 'cod_barras'
      Size = 40
    end
    object quProcurarProdutonome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object quProcurarProdutotipo: TStringField
      FieldName = 'tipo'
      Size = 30
    end
    object quProcurarProdutovalor: TBCDField
      FieldName = 'valor'
      Precision = 10
      Size = 2
    end
    object quProcurarProdutostatus: TStringField
      FieldName = 'status'
    end
  end
  object Timer1: TTimer
    Interval = 800
    OnTimer = Timer1Timer
    Left = 656
    Top = 64
  end
end
