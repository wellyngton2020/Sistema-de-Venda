unit unitDM;

interface

uses
  System.SysUtils, System.Classes, Data.Win.ADODB, Data.DB, frxClass, frxDBSet;

type
  TDM = class(TDataModule)
    conexao: TADOConnection;
    qu: TADOQuery;
    tb_produtos: TADOTable;
    quProdutos: TADOQuery;
    quProdutosnome: TStringField;
    quProdutoscod_barras: TStringField;
    quProdutosid: TAutoIncField;
    quProdutosvalor: TBCDField;
    quProdutosstatus: TStringField;
    quProdutostipo: TStringField;
    quVendas: TADOQuery;
    quVendasid: TAutoIncField;
    frxRelVenda: TfrxReport;
    quRelVenda: TADOQuery;
    frxDBRelVenda: TfrxDBDataset;
    quRelVendadata: TDateTimeField;
    quRelVendaValorTotal: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unitCadProdutos, unitPrincipal;

{$R *.dfm}

end.
