object frm_itens_venda: Tfrm_itens_venda
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Caixa'
  ClientHeight = 673
  ClientWidth = 864
  Color = clGradientActiveCaption
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
    Top = 43
    Width = 864
    Height = 41
    Align = alTop
    Color = clLime
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 12
      Width = 77
      Height = 19
      Caption = 'N'#186' Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 693
      Top = 16
      Width = 39
      Height = 19
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 377
      Top = 10
      Width = 157
      Height = 25
      Caption = 'CAIXA ABERTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object e_n_venda: TEdit
      Left = 90
      Top = 8
      Width = 142
      Height = 27
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dt_data: TDateTimePicker
      Left = 736
      Top = 11
      Width = 114
      Height = 27
      Date = 44427.000000000000000000
      Time = 0.618762812497152500
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 156
    Width = 655
    Height = 517
    Align = alLeft
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 1
    ExplicitHeight = 518
    object Label3: TLabel
      Left = 479
      Top = 399
      Width = 88
      Height = 33
      Caption = 'TOTAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 163
      Top = 399
      Width = 121
      Height = 23
      Caption = 'Desconto R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_valor: TLabel
      Left = 536
      Top = 438
      Width = 108
      Height = 45
      Caption = '00,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 479
      Top = 438
      Width = 51
      Height = 45
      Caption = 'R$'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 304
      Top = 399
      Width = 130
      Height = 23
      Caption = 'Acrescimo R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_remover_item: TButton
      Left = 7
      Top = 415
      Width = 129
      Height = 38
      Caption = 'Remover Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 0
      ParentFont = False
      TabOrder = 0
      OnClick = btn_remover_itemClick
    end
    object e_desconto: TEdit
      Left = 163
      Top = 428
      Width = 116
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnKeyPress = e_descontoKeyPress
    end
    object btn_zerar_desconto: TButton
      Left = 163
      Top = 461
      Width = 116
      Height = 33
      Caption = 'Zerar Desconto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btn_zerar_descontoClick
    end
    object DBGrid1: TDBGrid
      Left = 7
      Top = 6
      Width = 642
      Height = 387
      DataSource = DSItensVenda
      DrawingStyle = gdsGradient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlue
      TitleFont.Height = -16
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o do Produto'
          Width = 369
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Title.Caption = 'Valor'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'X'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sub'
          Title.Caption = 'Sub'
          Width = 121
          Visible = True
        end>
    end
    object btn_zerar_acresimo: TButton
      Left = 304
      Top = 461
      Width = 146
      Height = 33
      Caption = 'Zerar Acrescimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btn_zerar_descontoClick
    end
    object e_acrescimo: TEdit
      Left = 304
      Top = 428
      Width = 146
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnKeyPress = e_acrescimoKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 84
    Width = 864
    Height = 72
    Align = alTop
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 2
    object Label2: TLabel
      Left = 16
      Top = 10
      Width = 182
      Height = 19
      Caption = 'Buscar por c'#243'd. Barras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 604
      Top = 10
      Width = 39
      Height = 19
      Caption = 'Qtde'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 304
      Top = 10
      Width = 65
      Height = 19
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 671
      Top = 10
      Width = 46
      Height = 19
      Caption = 'Pre'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 223
      Top = 10
      Width = 56
      Height = 19
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object e_cod_barras: TEdit
      Left = 16
      Top = 35
      Width = 193
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = e_cod_barrasKeyPress
    end
    object btn_adicionar: TButton
      Left = 738
      Top = 32
      Width = 109
      Height = 34
      Caption = 'Adicionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_adicionarClick
    end
    object e_nome_produto: TEdit
      Left = 304
      Top = 35
      Width = 287
      Height = 27
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnKeyPress = e_cod_barrasKeyPress
    end
    object e_qtde: TEdit
      Left = 604
      Top = 35
      Width = 51
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnKeyPress = e_cod_barrasKeyPress
    end
    object e_preco: TEdit
      Left = 671
      Top = 35
      Width = 61
      Height = 27
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnKeyPress = e_cod_barrasKeyPress
    end
    object e_cod_produto: TEdit
      Left = 223
      Top = 35
      Width = 66
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnKeyPress = e_cod_produtoKeyPress
    end
  end
  object Panel5: TPanel
    Left = 655
    Top = 156
    Width = 209
    Height = 517
    Align = alClient
    Color = clGradientActiveCaption
    FullRepaint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    ExplicitHeight = 518
    object Label4: TLabel
      Left = 19
      Top = 46
      Width = 174
      Height = 19
      Caption = 'Forma de Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 38
      Top = 120
      Width = 123
      Height = 19
      Caption = 'Valor Recebido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 39
      Top = 194
      Width = 114
      Height = 19
      Caption = 'Troco a voltar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 47
      Top = 266
      Width = 104
      Height = 19
      Caption = 'Valor em Pix'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object e_troco_voltar: TEdit
      Left = 19
      Top = 219
      Width = 174
      Height = 27
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object e_valor_recebido: TEdit
      Left = 19
      Top = 145
      Width = 174
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = e_valor_recebidoKeyPress
    end
    object cb_forma_pagamento: TComboBox
      Left = 19
      Top = 71
      Width = 174
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Items.Strings = (
        'Dinheiro'
        'D'#233'bito'
        'Cr'#233'dito'
        'Pix'
        'Dinheiro e Pix'
        'Dinheiro e Credito'
        'Dinheiro e D'#233'bito')
    end
    object btn_cancelar_venda: TButton
      Left = 19
      Top = 420
      Width = 174
      Height = 42
      Caption = 'Cancelar Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btn_cancelar_vendaClick
    end
    object btn_finalizar_venda: TButton
      Left = 18
      Top = 352
      Width = 175
      Height = 46
      Caption = 'Finalizar Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btn_finalizar_vendaClick
    end
    object e_valor_pix: TEdit
      Left = 19
      Top = 291
      Width = 174
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 864
    Height = 43
    Align = alTop
    TabOrder = 4
    object btn_pesquisar_produto: TButton
      Left = 128
      Top = 0
      Width = 137
      Height = 44
      Caption = 'Pesquisar Pre'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btn_pesquisar_produtoClick
    end
    object btn_sair: TButton
      Left = 0
      Top = 0
      Width = 129
      Height = 44
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_sairClick
    end
    object Button1: TButton
      Left = 264
      Top = 0
      Width = 153
      Height = 44
      Caption = 'Cadastrar Prod.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object DSItensVenda: TDataSource
    DataSet = quPegaDados
    Left = 811
    Top = 8
  end
  object quItensVenda: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from venda')
    Left = 720
    Top = 8
    object quItensVendaid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object quItensVendavendedor: TStringField
      FieldName = 'vendedor'
      Size = 30
    end
    object quItensVendadata: TDateTimeField
      FieldName = 'data'
    end
    object quItensVendastatus: TStringField
      FieldName = 'status'
      Size = 30
    end
    object quItensVendavalor: TIntegerField
      FieldName = 'valor'
    end
    object quItensVendaforma_pagamento: TStringField
      FieldName = 'forma_pagamento'
      Size = 40
    end
  end
  object quPrecoTotal: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select sum(valor * quantidade) as [Valor Total] from itens_venda')
    Left = 768
    Top = 8
    object quPrecoTotalValorTotal: TFMTBCDField
      FieldName = 'Valor Total'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object quPegaDados: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  id_produto, nome, sum(quantidade) as quantidade, valor, ' +
        'sum(quantidade * valor) as sub from itens_venda'
      'group by  id_produto, nome, valor ')
    Left = 672
    Top = 8
    object quPegaDadosnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object quPegaDadosquantidade: TIntegerField
      FieldName = 'quantidade'
      ReadOnly = True
    end
    object quPegaDadosvalor: TBCDField
      FieldName = 'valor'
      DisplayFormat = '#,.00'
      Precision = 10
      Size = 2
    end
    object quPegaDadossub: TFMTBCDField
      FieldName = 'sub'
      ReadOnly = True
      DisplayFormat = '#,.00'
      Precision = 38
      Size = 2
    end
    object quPegaDadosid_produto: TIntegerField
      FieldName = 'id_produto'
    end
  end
  object quDeleteItens: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id from itens_venda')
    Left = 544
    Top = 8
    object quDeleteItensid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
  end
  object quPegaQuantidade: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select quantidade from itens_venda')
    Left = 616
    Top = 8
    object quPegaQuantidadequantidade: TIntegerField
      FieldName = 'quantidade'
    end
  end
end
