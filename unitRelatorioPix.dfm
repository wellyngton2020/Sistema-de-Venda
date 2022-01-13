object frm_entrada_pix: Tfrm_entrada_pix
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Entrada de Pix'
  ClientHeight = 421
  ClientWidth = 700
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
    Width = 700
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 34
      Width = 44
      Height = 19
      Caption = 'Data '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object e_data: TEdit
      Left = 74
      Top = 31
      Width = 145
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object btn_consultar: TButton
      Left = 225
      Top = 30
      Width = 96
      Height = 29
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_consultarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 700
    Height = 340
    Align = alClient
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 1
    object Label6: TLabel
      Left = 8
      Top = 19
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
      Left = 428
      Top = 23
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
    object Label5: TLabel
      Left = 8
      Top = 23
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
      Left = 217
      Top = 62
      Width = 286
      Height = 25
      Caption = 'Relat'#243'rio de Entrada de Pix'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 62
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
    object Label3: TLabel
      Left = 8
      Top = 95
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
    object Label10: TLabel
      Left = 8
      Top = 289
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
    object lbl_valor_total: TLabel
      Left = 51
      Top = 280
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
    object Label8: TLabel
      Left = 8
      Top = 280
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
  end
  object quRelatorioPix: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select sum(valor) as [Valor] from venda'
      '')
    Left = 496
    Top = 32
    object quRelatorioPixValor: TFMTBCDField
      FieldName = 'Valor'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object quRelatorioValorPix: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select valor_pix as [Venda Pix] from venda')
    Left = 592
    Top = 32
    object quRelatorioValorPixVendaPix: TBCDField
      FieldName = 'Venda Pix'
      Precision = 10
      Size = 2
    end
  end
end
