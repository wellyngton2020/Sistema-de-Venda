unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Menus,
  Vcl.Imaging.jpeg, Vcl.StdCtrls;

type
  Tfrm_principal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Venda1: TMenuItem;
    Relatrios1: TMenuItem;
    Sair1: TMenuItem;
    Produtos1: TMenuItem;
    Venda2: TMenuItem;
    Vendadiaria1: TMenuItem;
    Image1: TImage;
    PesquisarProdutos1: TMenuItem;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    VendaSemanalMensal1: TMenuItem;
    Financeiro1: TMenuItem;
    Capital1: TMenuItem;
    EntradadePix1: TMenuItem;
    Produtosvendidos1: TMenuItem;
    procedure Produtos1Click(Sender: TObject);
    procedure Venda2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure PesquisarProdutos1Click(Sender: TObject);
    procedure Vendadiaria1Click(Sender: TObject);
    procedure VendaSemanalMensal1Click(Sender: TObject);
    procedure Capital1Click(Sender: TObject);
    procedure EntradadePix1Click(Sender: TObject);
    procedure Produtosvendidos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_principal: Tfrm_principal;

implementation

{$R *.dfm}

uses unitCadProdutos, unitDM, unitVenda, unitItensVenda, unitProcurarProduto,
  unitVendaDiaria, unitVendaSemanal, unitCapital, unitSenhaAdm,
  unitRelatorioPix, unitProdutosVendidos;

procedure Tfrm_principal.Capital1Click(Sender: TObject);
begin
  frm_senha_adm.ShowModal;
end;

procedure Tfrm_principal.EntradadePix1Click(Sender: TObject);
begin
  frm_entrada_pix.ShowModal;
end;

procedure Tfrm_principal.PesquisarProdutos1Click(Sender: TObject);
begin
  frm_procurar_produto.ShowModal;
end;

procedure Tfrm_principal.Produtos1Click(Sender: TObject);
begin
  frm_produtos.ShowModal;
end;

procedure Tfrm_principal.Produtosvendidos1Click(Sender: TObject);
begin
  frm_produtos_vendidos.ShowModal;
end;

procedure Tfrm_principal.Sair1Click(Sender: TObject);
begin
  frm_principal.Close;
end;

procedure Tfrm_principal.Venda2Click(Sender: TObject);
begin
  frm_venda.gerarVenda;
  frm_itens_venda.dt_data.Date := date;
  frm_itens_venda.ShowModal;
end;

procedure Tfrm_principal.Vendadiaria1Click(Sender: TObject);
begin
  frm_venda_diaria.ShowModal;
end;

procedure Tfrm_principal.VendaSemanalMensal1Click(Sender: TObject);
begin
  frm_venda_semanal.ShowModal;
end;

end.
