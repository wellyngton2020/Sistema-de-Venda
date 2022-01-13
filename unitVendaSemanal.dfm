object frm_venda_semanal: Tfrm_venda_semanal
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Vendas Semanal/Mensal'
  ClientHeight = 529
  ClientWidth = 719
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
  object Label9: TLabel
    Left = 209
    Top = 6
    Width = 51
    Height = 25
    Caption = 'Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 719
    Height = 98
    Align = alTop
    Color = clBtnShadow
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -83
    ExplicitWidth = 720
    object Label1: TLabel
      Left = 25
      Top = 22
      Width = 122
      Height = 25
      Caption = 'Data Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 233
      Top = 22
      Width = 107
      Height = 25
      Caption = 'Data Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 196
      Top = 54
      Width = 13
      Height = 25
      Caption = #225
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_pesquisar: TButton
      Left = 391
      Top = 53
      Width = 113
      Height = 31
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btn_pesquisarClick
    end
    object e_data_inicial: TEdit
      Left = 24
      Top = 53
      Width = 152
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 98
    Width = 719
    Height = 431
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 66
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 680
      Height = 33
      Caption = '________________________________________'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 152
      Top = 64
      Width = 380
      Height = 25
      Caption = 'Relat'#243'rio de Venda Semanal/Mensal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 25
      Width = 680
      Height = 33
      Caption = '________________________________________'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 24
      Top = 29
      Width = 159
      Height = 23
      Caption = 'Adega Imp'#233'rium'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 444
      Top = 33
      Width = 260
      Height = 18
      Caption = 'Raz'#227'o Social: 44101291/0001-80'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 103
      Width = 91
      Height = 19
      Caption = 'Valor Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 25
      Top = 184
      Width = 37
      Height = 33
      Caption = 'R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_valor_total: TLabel
      Left = 68
      Top = 184
      Width = 76
      Height = 33
      Caption = '00,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 25
      Top = 193
      Width = 680
      Height = 33
      Caption = '________________________________________'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object e_data_final: TEdit
    Left = 233
    Top = 53
    Width = 152
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object quVendaSemanal: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select sum(valor) as [Valor Total] from venda')
    Left = 664
    Top = 16
    object quVendaSemanalValorTotal: TFMTBCDField
      FieldName = 'Valor Total'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object DSVendaSemanal: TDataSource
    DataSet = quVendaSemanal
    Left = 580
    Top = 16
  end
end
