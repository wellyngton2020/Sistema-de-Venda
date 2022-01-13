unit unitProcurarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  Tfrm_procurar_produto = class(TForm)
    e_procurar: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DataSource1: TDataSource;
    quProcurarProduto: TADOQuery;
    Panel2: TPanel;
    quProcurarProdutoid: TAutoIncField;
    quProcurarProdutocod_barras: TStringField;
    quProcurarProdutonome: TStringField;
    quProcurarProdutotipo: TStringField;
    quProcurarProdutovalor: TBCDField;
    quProcurarProdutostatus: TStringField;
    lbl_aviso: TLabel;
    Timer1: TTimer;
    btn_pesquisar: TButton;
    procedure procuraProdutos;
    procedure e_procurarKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_procurar_produto: Tfrm_procurar_produto;

implementation

{$R *.dfm}

procedure Tfrm_procurar_produto.btn_pesquisarClick(Sender: TObject);
begin
  procuraProdutos;
end;

procedure Tfrm_procurar_produto.e_procurarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    procuraProdutos;
  end;
end;

procedure Tfrm_procurar_produto.FormShow(Sender: TObject);
begin
  e_procurar.Text := '%%';
end;

procedure Tfrm_procurar_produto.procuraProdutos;
begin
  with quProcurarProduto do
  begin
    close;
    SQL.Text:= 'select * from produtos ' +
    ' where nome like ' + QuotedStr(e_procurar.Text);
    open;
  end;
end;

procedure Tfrm_procurar_produto.Timer1Timer(Sender: TObject);
begin
  lbl_aviso.Visible := not lbl_aviso.Visible ;
end;

end.
