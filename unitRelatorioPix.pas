unit unitRelatorioPix;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB;

type
  Tfrm_entrada_pix = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    e_data: TEdit;
    Label1: TLabel;
    btn_consultar: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    lbl_valor_total: TLabel;
    Label8: TLabel;
    quRelatorioPix: TADOQuery;
    quRelatorioPixValor: TFMTBCDField;
    quRelatorioValorPix: TADOQuery;
    quRelatorioValorPixVendaPix: TBCDField;
    procedure pegaDados;
    procedure btn_consultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_entrada_pix: Tfrm_entrada_pix;

implementation

{$R *.dfm}

uses unitCadProdutos, unitCapital, unitDM, unitItensVenda, unitPrincipal,
  unitProcurarProduto, unitSenhaAdm, unitVenda, unitVendaDiaria,
  unitVendaSemanal;

procedure Tfrm_entrada_pix.btn_consultarClick(Sender: TObject);
begin
  pegaDados;
end;

procedure Tfrm_entrada_pix.FormShow(Sender: TObject);
begin
  e_data.Text := DateToStr(Date());
end;

procedure Tfrm_entrada_pix.pegaDados;
begin
  if e_data.Text = '' then
  begin
    ShowMessage('Favor Digitar uma data Valida!');
    Exit;
  end;

  with quRelatorioPix do
  begin
    Close;
    SQL.Text := ' select sum(valor) as [Valor] from venda ' +
    'where data = ' + QuotedStr(e_data.Text) + ' and ' +  ' forma_pagamento =' + QuotedStr('Pix');
    Open;
    if quRelatorioPixValor.AsString = '' then
    begin
      ShowMessage('Nenhuma entrada de pix na data de hoje!');
      Exit;
    end;
  end;

  ShowMessage(quRelatorioPixValor.AsString);

  with quRelatorioValorPix do
  begin
    Close;
    SQL.Text := ' select sum(valor_pix) as [Venda Pix] from venda ' +
    ' where data = ' + QuotedStr(e_data.Text);
    Open;
  end;

  lbl_valor_total.Caption := FloatToStr(StrToFloat(quRelatorioPixValor.AsString) + StrToFloat(quRelatorioValorPixVendaPix.AsString));
end;

end.
