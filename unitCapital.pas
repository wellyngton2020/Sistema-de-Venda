unit unitCapital;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Imaging.pngimage;

type
  Tfrm_capital = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lbl_valor: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cb_entrada_saida: TComboBox;
    Label4: TLabel;
    e_data: TEdit;
    Label5: TLabel;
    cb_motivo: TComboBox;
    Label6: TLabel;
    e_valor: TEdit;
    Label7: TLabel;
    Button1: TButton;
    quCapital: TADOQuery;
    quPegaValor: TADOQuery;
    quPegaValorValor: TFMTBCDField;
    quCapitalid: TAutoIncField;
    quCapitaltipo: TStringField;
    quCapitalmotivo: TStringField;
    quCapitaldata: TDateTimeField;
    quCapitalvalor: TBCDField;
    Image1: TImage;
    procedure inserirCapital;
    procedure pegaCapital;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_entrada_saidaSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_capital: Tfrm_capital;

implementation

{$R *.dfm}

uses unitCadProdutos, unitDM, unitItensVenda, unitPrincipal,
  unitProcurarProduto, unitVenda, unitVendaDiaria, unitVendaSemanal;

procedure Tfrm_capital.Button1Click(Sender: TObject);
begin
  inserirCapital;
  pegaCapital;
end;

procedure Tfrm_capital.cb_entrada_saidaSelect(Sender: TObject);
begin
   if cb_entrada_saida.Text = 'Entrada' then
  begin
    cb_motivo.Items.Clear;
    e_data.Enabled := true;
    cb_motivo.Enabled := true;
    e_valor.Enabled := true;
    cb_motivo.Items.Add('INSERÇÃO DE CAPITAL');
    cb_motivo.Items.Add('FECHAMENTO DE CAIXA');
    cb_entrada_saida.Enabled := false;
  end;

  if cb_entrada_saida.Text = 'Saída' then
  begin
    cb_motivo.Items.Clear;
    e_data.Enabled := true;
    cb_motivo.Enabled := true;
    e_valor.Enabled := true;
    cb_motivo.Items.Add('ALIMENTAÇÃO');
    cb_motivo.Items.Add('COMPRAS');
    cb_motivo.Items.Add('CONTAS A PAGAR');
    cb_motivo.Items.Add('EMPRÉSTIMO');
    cb_motivo.Items.Add('PAGAMENTO FUNCIONÁRIO');
    cb_entrada_saida.Enabled := false;
  end;

end;

procedure Tfrm_capital.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cb_entrada_saida.Text := '';
  cb_motivo.Text := '';
  e_data.Text := '';
  e_valor.Text := '';
end;

procedure Tfrm_capital.FormShow(Sender: TObject);
begin
  pegaCapital;
  e_data.Text := DateToStr(Date());
  e_data.Enabled := false;
  cb_motivo.Enabled := false;
  e_valor.Enabled := false;
  cb_entrada_saida.Enabled := true;
end;

procedure Tfrm_capital.inserirCapital;
var somaCapital : string;
var salvarCapital : string;
var valor : string;
begin
  with quCapital do
  begin
    Close;
    SQL.Text := ' select * from capital where id = (select max(id) from capital)';
    Open;
  end;

  //e_valor.Text := StringReplace(e_valor.Text,',','.', [rfReplaceAll]);
  valor := e_valor.Text;
  somaCapital := quCapitalvalor.AsString;

  if cb_entrada_saida.Text = 'Entrada' then
  begin
  salvarCapital := FloatToStr(StrToFloat(somaCapital) + StrToFloat(valor));
  salvarCapital := StringReplace(salvarCapital,',','.', [rfReplaceAll]);
  with quCapital do
    begin
      Close;
      SQL.Text := ' Insert into capital (tipo, motivo, data, valor) values (' +
      QuotedStr(cb_entrada_saida.Text) + ',' +
      QuotedStr(cb_motivo.Text) + ',' +
      QuotedStr(e_data.Text) + ',' +
      QuotedStr(salvarCapital) + ')';
      ExecSQL;
    end;
  end;

  if cb_entrada_saida.Text = 'Saída' then
  begin
   salvarCapital := FloatToStr(StrToFloat(somaCapital) - StrToFloat(valor));
   salvarCapital := StringReplace(salvarCapital,',','.', [rfReplaceAll]);
    with quCapital do
    begin
      Close;
      SQL.Text := ' Insert into capital (tipo, motivo, data, valor) values (' +
      QuotedStr(cb_entrada_saida.Text) + ',' +
      QuotedStr(cb_motivo.Text) + ',' +
      QuotedStr(e_data.Text) + ',' +
      QuotedStr(salvarCapital) + ')';
      ExecSQL;
    end;
  end;
    cb_entrada_saida.Text := '';
    cb_motivo.Text := '';
    e_valor.Text := '';
    e_data.Enabled := false;
    cb_motivo.Enabled := false;
    e_valor.Enabled := false;
    cb_entrada_saida.Enabled := True;
end;

procedure Tfrm_capital.pegaCapital;
begin
  with quCapital do
  begin
    Close;
    SQL.Text := ' select * from capital where id = (select max(id) from capital)';
    Open;
  end;
  lbl_valor.Caption := quCapitalvalor.AsString;
end;

end.
