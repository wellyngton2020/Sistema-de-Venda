object frm_produtos_vendidos: Tfrm_produtos_vendidos
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Produtos Vendidos'
  ClientHeight = 403
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 631
    Height = 113
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 31
      Top = 48
      Width = 32
      Height = 19
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object e_data: TEdit
      Left = 69
      Top = 46
      Width = 148
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Button1: TButton
      Left = 223
      Top = 44
      Width = 106
      Height = 29
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 113
    Width = 631
    Height = 290
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 629
      Height = 288
      Align = alClient
      DataSource = DSItensVendidos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Width = 171
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'id'
          Visible = True
        end>
    end
  end
  object quItensVendidos: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '
      #9'a.nome as [nome],'
      '                a.id as [id]'
      'from itens_venda a '
      'join venda b on a.id_venda = b.id'
      'group by a.nome, a.id')
    Left = 523
    Top = 16
    object quItensVendidosnome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object quItensVendidosid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
  end
  object DSItensVendidos: TDataSource
    DataSet = quItensVendidos
    Left = 579
    Top = 16
  end
end
