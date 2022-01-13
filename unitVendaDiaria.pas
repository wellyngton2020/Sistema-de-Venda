unit unitVendaDiaria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  Tfrm_venda_diaria = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btn_pesquisar: TButton;
    quVendaDiaria: TADOQuery;
    Panel2: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    lbl_valor_total: TLabel;
    Label10: TLabel;
    DSVendaDiaria: TDataSource;
    quVendaDiariaValorTotal: TFMTBCDField;
    e_data: TEdit;
    procedure btn_pesquisarClick(Sender: TObject);
    procedure PegaVendaDiaria;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_venda_diaria: Tfrm_venda_diaria;

implementation

{$R *.dfm}

uses unitCadProdutos, unitDM, unitItensVenda, unitPrincipal,
  unitProcurarProduto, unitVenda, unitVendaSemanal;

procedure Tfrm_venda_diaria.btn_pesquisarClick(Sender: TObject);
begin
  PegaVendaDiaria;
end;

procedure Tfrm_venda_diaria.FormShow(Sender: TObject);
begin
  e_data.Text := DateToStr(Date());
  lbl_valor_total.Caption := ''
end;

procedure Tfrm_venda_diaria.PegaVendaDiaria;
begin
  with quVendaDiaria do
    begin
      Close;
      SQL.Text := ' select sum(valor) as [Valor Total] from venda ' +
      ' where data = ' + QuotedStr(e_data.Text);
      Open;
    end;
    if quVendaDiariaValorTotal.AsString = '' then
    lbl_valor_total.Caption := '00,00'
    else
    begin
      lbl_valor_total.Caption := quVendaDiariaValorTotal.AsString;
    end;
end;

end.
