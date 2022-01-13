unit unitProdutosVendidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB;

type
  Tfrm_produtos_vendidos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    e_data: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    quItensVendidos: TADOQuery;
    DSItensVendidos: TDataSource;
    quItensVendidosnome: TStringField;
    quItensVendidosid: TAutoIncField;
    procedure pegaItensVendidos;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_produtos_vendidos: Tfrm_produtos_vendidos;

implementation

{$R *.dfm}

procedure Tfrm_produtos_vendidos.Button1Click(Sender: TObject);
begin
  pegaItensVendidos;
end;

procedure Tfrm_produtos_vendidos.pegaItensVendidos;
begin
  with quItensVendidos do
  begin
    Close;
    SQL.Text := ' select max(a.id) as [id], a.nome as [nome] from itens_venda a' +
    ' join venda b on a.id_venda = b.id ' +
    ' where b.data = ' + e_data.Text +
    ' group by a.nome, a.id ';
    Open;
  end;
  ShowMessage(quItensVendidosid.AsString);
end;

end.
