object frm_venda: Tfrm_venda
  Left = 0
  Top = 0
  Caption = 'Venda'
  ClientHeight = 490
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 651
    Height = 160
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 6
      Width = 46
      Height = 13
      Caption = 'Vendedor'
    end
    object Label3: TLabel
      Left = 13
      Top = 52
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object cb_vendedor: TComboBox
      Left = 13
      Top = 25
      Width = 244
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'Brena'#11
        'Renan'#11
        'Wellyngton')
    end
    object dt_data: TDateTimePicker
      Left = 13
      Top = 71
      Width = 186
      Height = 21
      Date = 44421.000000000000000000
      Time = 0.771360092592658500
      TabOrder = 1
    end
    object btn_gerar_venda: TButton
      Left = 13
      Top = 114
      Width = 75
      Height = 25
      Caption = 'Gerar Venda'
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 651
    Height = 49
    Align = alTop
    Color = 844855
    ParentBackground = False
    TabOrder = 1
    object Label2: TLabel
      Left = 201
      Top = 6
      Width = 204
      Height = 45
      Caption = 'Caixa Livre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object TPanel
    Left = 0
    Top = 209
    Width = 651
    Height = 281
    Align = alClient
    TabOrder = 2
  end
  object DSVenda: TDataSource
    DataSet = quVenda
    Left = 472
  end
  object quVenda: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select  id, vendedor, data, status from venda')
    Left = 528
    object quVendaid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object quVendavendedor: TStringField
      FieldName = 'vendedor'
      Size = 30
    end
    object quVendadata: TDateTimeField
      FieldName = 'data'
    end
    object quVendastatus: TStringField
      FieldName = 'status'
      Size = 30
    end
  end
end
