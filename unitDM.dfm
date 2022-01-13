object DM: TDM
  OldCreateOrder = False
  Height = 550
  Width = 785
  object conexao: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=\wellyngton;Initial Catalog=db_adega;Data Sourc' +
      'e=LAPTOP-47ISIVGB\SQLEXPRESS01'
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object qu: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    Parameters = <>
    Left = 24
    Top = 80
  end
  object tb_produtos: TADOTable
    Connection = conexao
    Left = 96
    Top = 16
  end
  object quProdutos: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from produtos')
    Left = 88
    Top = 80
    object quProdutosnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object quProdutoscod_barras: TStringField
      FieldName = 'cod_barras'
      Size = 30
    end
    object quProdutosid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object quProdutosvalor: TBCDField
      FieldName = 'valor'
      Precision = 10
      Size = 2
    end
    object quProdutosstatus: TStringField
      FieldName = 'status'
    end
    object quProdutostipo: TStringField
      FieldName = 'tipo'
      Size = 30
    end
  end
  object quVendas: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from venda')
    Left = 160
    Top = 80
    object quVendasid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
  end
  object frxRelVenda: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44431.656783240700000000
    ReportOptions.LastChange = 44431.659465740700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 88
    Top = 176
    Datasets = <
      item
        DataSet = frxDBRelVenda
        DataSetName = 'frxDBRelVenda'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio Total Vendido por Dia')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220472000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBRelVenda."data"'
        object Memo4: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          DataField = 'data'
          DataSet = frxDBRelVenda
          DataSetName = 'frxDBRelVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 16053492
          Memo.UTF8W = (
            '[frxDBRelVenda."data"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 487.559370000000000000
          Top = 30.236240000000000000
          Width = 291.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSet = frxDBRelVenda
        DataSetName = 'frxDBRelVenda'
        RowCount = 0
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Width = 291.000000000000000000
          Height = 18.897650000000000000
          DataField = 'Valor Total'
          DataSet = frxDBRelVenda
          DataSetName = 'frxDBRelVenda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBRelVenda."Valor Total"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 487.779840000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'R$')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Top = 264.567100000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = -0.779530000000000000
          Width = 733.228820000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520100000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
  object quRelVenda: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=db_adega;Data Source=LAPTOP-47ISIVGB\SQ' +
      'LEXPRESS01'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select data, sum(valor) as  [Valor Total] from venda'
      'where status = '#39'finalizado'#39
      'group by data')
    Left = 88
    Top = 304
    object quRelVendadata: TDateTimeField
      FieldName = 'data'
    end
    object quRelVendaValorTotal: TFMTBCDField
      FieldName = 'Valor Total'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object frxDBRelVenda: TfrxDBDataset
    UserName = 'frxDBRelVenda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'data=data'
      'Valor Total=Valor Total')
    DataSet = quRelVenda
    BCDToCurrency = False
    Left = 88
    Top = 248
  end
end
