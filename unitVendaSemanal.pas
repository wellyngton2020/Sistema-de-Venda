unit unitVendaSemanal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Data.Win.ADODB;

type
  Tfrm_venda_semanal = class(TForm)
    Panel1: TPanel;
    btn_pesquisar: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    lbl_valor_total: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    e_data_inicial: TEdit;
    Label9: TLabel;
    e_data_final: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    quVendaSemanal: TADOQuery;
    quVendaSemanalValorTotal: TFMTBCDField;
    DSVendaSemanal: TDataSource;
    procedure PegaVendaSemanal;
    procedure btn_pesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_venda_semanal: Tfrm_venda_semanal;

implementation

{$R *.dfm}

uses unitCadProdutos, unitDM, unitItensVenda, unitPrincipal,
  unitProcurarProduto, unitVenda, unitVendaDiaria;

procedure Tfrm_venda_semanal.FormShow(Sender: TObject);
begin
  lbl_valor_total.Caption := ''
end;

procedure Tfrm_venda_semanal.PegaVendaSemanal;
begin
  with quVendaSemanal do
    begin
      Close;
      SQL.Text := ' select sum(valor) as [Valor Total] from venda ' +
      ' where data between ' + QuotedStr(e_data_inicial.Text) +
      ' and ' + QuotedStr(e_data_final.Text);
      Open;
    end;

    if e_data_inicial.Text > e_data_final.Text then
    begin
    ShowMessage('Data inicial não pode ser maior que a data final!');
    lbl_valor_total.Caption := '00,00';
    exit;
    end;

    if quVendaSemanalValorTotal.AsString = '' then
    begin
    lbl_valor_total.Caption := '00,00'
    end
    else
    begin
      lbl_valor_total.Caption := quVendaSemanalValorTotal.AsString;
    end;
end;

procedure Tfrm_venda_semanal.btn_pesquisarClick(Sender: TObject);
begin
    PegaVendaSemanal;
end;

end.
