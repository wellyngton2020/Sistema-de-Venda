unit unitItensVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.ComCtrls,
  Vcl.ToolWin, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_itens_venda = class(TForm)
    DSItensVenda: TDataSource;
    Panel1: TPanel;
    e_n_venda: TEdit;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    e_cod_barras: TEdit;
    btn_adicionar: TButton;
    btn_remover_item: TButton;
    cb_forma_pagamento: TComboBox;
    Label4: TLabel;
    e_valor_recebido: TEdit;
    Label5: TLabel;
    e_troco_voltar: TEdit;
    Label6: TLabel;
    btn_cancelar_venda: TButton;
    Label7: TLabel;
    quItensVenda: TADOQuery;
    quPrecoTotal: TADOQuery;
    quPrecoTotalValorTotal: TFMTBCDField;
    Label8: TLabel;
    Panel3: TPanel;
    Panel5: TPanel;
    e_nome_produto: TEdit;
    Label9: TLabel;
    e_qtde: TEdit;
    e_preco: TEdit;
    Label10: TLabel;
    dt_data: TDateTimePicker;
    Label11: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    e_desconto: TEdit;
    quItensVendaid: TAutoIncField;
    quItensVendavendedor: TStringField;
    quItensVendadata: TDateTimeField;
    quItensVendastatus: TStringField;
    quItensVendavalor: TIntegerField;
    quItensVendaforma_pagamento: TStringField;
    quPegaDados: TADOQuery;
    quPegaDadosnome: TStringField;
    quPegaDadosquantidade: TIntegerField;
    quPegaDadosvalor: TBCDField;
    quPegaDadossub: TFMTBCDField;
    btn_finalizar_venda: TButton;
    quDeleteItens: TADOQuery;
    quDeleteItensid: TAutoIncField;
    quPegaDadosid_produto: TIntegerField;
    quPegaQuantidade: TADOQuery;
    quPegaQuantidadequantidade: TIntegerField;
    e_cod_produto: TEdit;
    Label13: TLabel;
    btn_zerar_desconto: TButton;
    btn_sair: TButton;
    btn_pesquisar_produto: TButton;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Button1: TButton;
    lbl_valor: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    btn_zerar_acresimo: TButton;
    e_acrescimo: TEdit;
    Label16: TLabel;
    e_valor_pix: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btn_adicionarClick(Sender: TObject);
    procedure pegaDados;
    procedure adicionarItens;
    procedure pegaProdutos;
    procedure somaValor;
    procedure finalizarVenda;
    procedure cancelarVenda;
    procedure removerItem;
    procedure zerarAcrescimo;
    procedure btn_finalizar_vendaClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure e_cod_barrasKeyPress(Sender: TObject; var Key: Char);
    procedure e_valor_recebidoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_cancelar_vendaClick(Sender: TObject);
    procedure e_descontoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_remover_itemClick(Sender: TObject);
    procedure pegaProdutosCod;
    procedure e_cod_produtoKeyPress(Sender: TObject; var Key: Char);
    procedure zerarDesconto;
    procedure btn_zerar_descontoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn_pesquisar_produtoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure e_acrescimoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
   idVenda,
   id,
   codBarras,
   idProduto,
   nomeProduto,
   valorProduto,
   valorTotal
   :string;
    { Public declarations }
  end;

var
  frm_itens_venda: Tfrm_itens_venda;

implementation

{$R *.dfm}

uses unitCadProdutos, unitDM, unitPrincipal, unitVenda, unitProcurarProduto;

procedure Tfrm_itens_venda.pegaProdutos;
begin
  with frm_produtos.QuCadProdutos do
  begin
    Close;
    SQL.Text:= 'select * from produtos' +
    ' where cod_barras =' + QuotedStr(e_cod_barras.Text);
    Open;
  end;
  if frm_produtos.quCadProdutoscod_barras.Value = '' then
  begin
    ShowMessage('Produto não encontrado!');
    e_cod_barras.Text := '';
    e_cod_produto.Text := '';
    e_nome_produto.Text := '';
    e_qtde.Text := '';
    e_preco.Text := '';
    e_cod_barras.SetFocus;
    Exit;
  end;

  e_nome_produto.Enabled := true;
  codBarras := frm_produtos.QuCadProdutoscod_barras.AsString;
  e_cod_produto.Text := frm_produtos.quCadProdutosid.AsString;
  nomeProduto := frm_produtos.QuCadProdutosnome.AsString;
  idProduto := frm_produtos.QuCadProdutosid.AsString;
  valorProduto := frm_produtos.QuCadProdutosvalor.AsString;

  e_nome_produto.Text := nomeProduto;
  e_cod_produto.Enabled := false;
  e_preco.Text := StringReplace(valorProduto,',','.', [rfReplaceAll]);
  //e_qtde.Text := '1';
end;

procedure Tfrm_itens_venda.zerarAcrescimo;
begin
  somaValor;
end;

procedure Tfrm_itens_venda.pegaProdutosCod;
begin
  if e_cod_produto.Text > '0' then
  begin
    with frm_produtos.quCadProdutos do
    begin
    Close;
    SQL.Text := ' select * from produtos ' +
    ' where id = ' + e_cod_produto.Text;
    Open;
    e_cod_barras.Text := frm_produtos.QuCadProdutoscod_barras.AsString;
    e_cod_barras.Enabled := false;
    //e_qtde.Enabled := false;
    e_cod_produto.Text := frm_produtos.quCadProdutosid.AsString;
    e_nome_produto.Text := frm_produtos.QuCadProdutosnome.AsString;
    e_preco.Text := frm_produtos.QuCadProdutosvalor.AsString;
    e_preco.Text := StringReplace(valorProduto,',','.', [rfReplaceAll]);
    //e_qtde.Text := '1';
    btn_adicionar.SetFocus;
    end;
  end;

  if e_cod_produto.Text < '0' then
  begin
    ShowMessage('Código não encontrado!');
    e_cod_barras.Text := '';
    e_cod_produto.Text := '';
    e_nome_produto.Text := '';
    e_qtde.Text := '';
    e_preco.Text := '';
    e_cod_produto.SetFocus;
  end;
end;

procedure Tfrm_itens_venda.finalizarVenda;
begin
  if cb_forma_pagamento.Text = 'Dinheiro e Pix' then
  begin
    if e_valor_pix.Text <= '0.00' then
    begin
      ShowMessage('Favor informar o valor do Pix');
      Exit;
    end;
  end;

  if cb_forma_pagamento.Text = '' then
  begin
    ShowMessage('Informe a forma de pagamento!');
    Exit;
  end;

  if e_valor_recebido.Text = '' then
  begin
    ShowMessage('Informe o valor recebido!');
    Exit;
  end;

  lbl_valor.Caption := StringReplace(lbl_valor.Caption,',','.', [rfReplaceAll]);
  e_desconto.Text := StringReplace(e_desconto.Text,',','.', [rfReplaceAll]);
  e_valor_pix.Text := StringReplace(e_valor_pix.Text,',','.', [rfReplaceAll]);

  if Application.MessageBox('Tem certeza que deseja finalizar a venda?',
  'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  with frm_venda.quVenda do
  begin
     Close;
     SQL.Text:='update venda set valor = ' + QuotedStr(lbl_valor.Caption) + ',' +
            ' forma_pagamento =' + QuotedStr(cb_forma_pagamento.Text) + ',' +
            ' desconto =' + QuotedStr(e_desconto.Text) + ',' +
            ' valor_pix =' + QuotedStr(e_valor_pix.Text) + ',' +
            ' status =' + QuotedStr('finalizado') +
            ' where id =' + idVenda;
     ExecSQL;
     frm_itens_venda.Close;
  end;
  cb_forma_pagamento.ItemIndex := -1;
  e_troco_voltar.Text := '';
  e_valor_recebido.Text := '';
  lbl_valor.Caption := '';
end;

procedure Tfrm_itens_venda.adicionarItens;
begin
  if e_cod_barras.Text = '' then
  begin
    ShowMessage('Favor digitar o código de barras do produto!');
    Exit;
  end;

  if frm_produtos.QuCadProdutos.fieldbyName('cod_barras').AsString = '' then
  begin
     ShowMessage('Produto não encontrado');
     Exit;
  end;

  if e_qtde.Text = '' then
  begin
    ShowMessage('Insira a quantidade!');
    Exit;
  end;

  if e_qtde.Text <= '0' then
  begin
    ShowMessage('Insira uma quantidade valida!');
    Exit;
  end;

  with quItensVenda do
  begin
    Close;
    SQL.Text:='insert into itens_venda (id_venda, id_produto, cod_barras, nome, valor, quantidade) values (' +
            QuotedStr(idVenda) + ',' +
            QuotedStr(idProduto) + ',' +
            QuotedStr(codBarras) + ',' +
            QuotedStr(nomeProduto) + ',' +
            QuotedStr(e_preco.Text) + ',' +
            QuotedStr(e_qtde.Text) + ')';
    ExecSQL;
  end;

  e_cod_barras.Text := '';
  e_qtde.Text := '';
  e_nome_produto.Text := '';
  e_nome_produto.Enabled := false;
  e_preco.Text := '';
  e_cod_produto.Text := '';
  e_cod_produto.Enabled := true;
  e_cod_barras.Enabled := true;
  //e_qtde.Enabled := false;
end;

procedure Tfrm_itens_venda.somaValor;
begin
  with quPrecoTotal do
  begin
    Close;
    SQL.Text := ' select sum(valor * quantidade) as [Valor Total] from itens_venda' +
    ' where id_venda =' + idVenda +
    ' group by id_venda';
    Open;
  end;
  //e_valor_total.Text := quPrecoTotalValorTotal.AsSTring;
  lbl_valor.Caption := quPrecoTotalValorTotal.AsString;
  e_desconto.Text := StringReplace(e_desconto.Text,',','.', [rfReplaceAll]);
end;

procedure Tfrm_itens_venda.pegaDados;
begin
  with quPegaDados do
  begin
    Close;
    SQL.Text := 'select id_produto, upper(nome) as nome, sum(quantidade) as quantidade, valor, sum(quantidade * valor) as sub from itens_venda' +
    ' where id_venda =' + idVenda +
    ' group by id_produto, nome, valor ';
    Open;
  end;
end;

procedure Tfrm_itens_venda.btn_adicionarClick(Sender: TObject);
var
     TextOnEdit: UnicodeString;
     Value: Currency;
begin
  pegaProdutos;
  adicionarItens;
  pegaDados;
  somaValor;

  TextOnEdit := lbl_valor.Caption;

  if TryStrToCurr(TextOnEdit, Value) then
    lbl_valor.Caption := FormatFloat('#.##', Value)
  else
    lbl_valor.Caption := '0.00'; //se caso não conseguiu converter o valor digitado em número, mostra 0
end;

procedure Tfrm_itens_venda.btn_cancelar_vendaClick(Sender: TObject);
begin
  cancelarVenda;
end;

procedure Tfrm_itens_venda.btn_finalizar_vendaClick(Sender: TObject);
begin
   finalizarVenda;
end;

procedure Tfrm_itens_venda.btn_pesquisar_produtoClick(Sender: TObject);
begin
  frm_procurar_produto.ShowModal;
end;

procedure Tfrm_itens_venda.btn_remover_itemClick(Sender: TObject);
begin
  removerItem;
end;

procedure Tfrm_itens_venda.btn_sairClick(Sender: TObject);
begin
  cancelarVenda;
  frm_itens_venda.Close;
end;

procedure Tfrm_itens_venda.btn_zerar_descontoClick(Sender: TObject);
begin
  zerarDesconto;
  somaValor;
end;

procedure Tfrm_itens_venda.Button1Click(Sender: TObject);
begin
  frm_produtos.ShowModal;
end;

procedure Tfrm_itens_venda.e_acrescimoKeyPress(Sender: TObject; var Key: Char);
var acrescimo: string;
begin
  if Key = #13 then
  begin
    acrescimo :=  FloatToStr(StrToFloat(lbl_valor.Caption) + StrToFloat(e_acrescimo.text));
    lbl_valor.Caption := acrescimo;
  end;
end;

procedure Tfrm_itens_venda.e_cod_barrasKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin
  pegaProdutos;
  adicionarItens;
  pegaDados;
  somaValor;
  end;

  if key= ',' then
   Key := '.';


end;

procedure Tfrm_itens_venda.e_cod_produtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    pegaProdutosCod;
  end;
end;

procedure Tfrm_itens_venda.e_descontoKeyPress(Sender: TObject; var Key: Char);
var desconto: string;
begin
  if Key = #13 then
  begin
  // FloatToStr(StrToFloat(e_valor_total.text) - StrToFloat(e_desconto.text));
  if e_desconto.Text = '' then
  begin
    lbl_valor.Caption := quPrecoTotalValorTotal.AsSTring;
    e_desconto.Text := '0';
    exit;
  end
  else
  begin
  desconto :=  FloatToStr(StrToFloat(lbl_valor.Caption) - StrToFloat(e_desconto.text));
  lbl_valor.Caption := desconto;
  e_desconto.Enabled := false;
  end;

  end;

end;

procedure Tfrm_itens_venda.e_valor_recebidoKeyPress(Sender: TObject; var Key: Char);
var troco: string;
begin
  if Key = #13 then
  begin
  if e_valor_recebido.Text < lbl_valor.Caption then
  begin
    ShowMessage('Valor recebido invalido!');
    Exit;
  end
  else
  begin
  FloatToStr(StrToFloat(e_valor_recebido.text) - StrToFloat(lbl_valor.Caption));
  troco :=  FloatToStr(StrToFloat(e_valor_recebido.text) - StrToFloat(lbl_valor.Caption));
  e_troco_voltar.Text := troco;
  end;
  end;

  if e_valor_recebido.Text > '0' then
  begin
    e_desconto.Enabled := false;
  end;

end;

procedure Tfrm_itens_venda.FormShow(Sender: TObject);
begin
  e_cod_barras.SetFocus;
  e_desconto.Enabled := true;
  e_desconto.Text := '0,00';
  dt_data.Date := date;
  e_n_venda.text := idVenda;
  e_valor_pix.Text := '0,00';
  e_acrescimo.Text := '0,00';
end;

procedure Tfrm_itens_venda.cancelarVenda;
begin
  if Application.MessageBox('Tem certeza que deseja cancelar a venda?',
  'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  with frm_venda.quVenda do
  begin
     Close;
     SQL.Text:='delete venda' +
     ' where id =' + idVenda;
     ExecSQL;

     Close;
     SQL.Text := 'delete itens_venda' +
     ' where id_venda = ' + idVenda;
     ExecSQL;

     e_troco_voltar.Text := '';
     lbl_valor.Caption := '';
     e_valor_recebido.Text := '';
     e_cod_barras.Text := '';
     e_cod_produto.Text := '';
     e_nome_produto.Text := '';
     e_qtde.Text := '';
     e_preco.Text := '';
     frm_itens_venda.Close;
  end;
end;

procedure Tfrm_itens_venda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (Column.Field.FieldName = 'sub') then
  begin
    DBGrid1.Canvas.Brush.Color:= clSkyBlue;
    DBGrid1.Canvas.Font.Color:= clWindowText;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

if (Column.Field.FieldName = 'nome') then
  begin
    DBGrid1.Canvas.Brush.Color:= clMoneyGreen;
    DBGrid1.Canvas.Font.Color:= clWindowText;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

if (Column.Field.FieldName = 'quantidade') then
  begin
    DBGrid1.Canvas.Brush.Color:= clMoneyGreen;
    DBGrid1.Canvas.Font.Color:= clWindowText;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

if (Column.Field.FieldName = 'valor') then
  begin
    DBGrid1.Canvas.Brush.Color:= clMoneyGreen;
    DBGrid1.Canvas.Font.Color:= clWindowText;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;



procedure Tfrm_itens_venda.removerItem;
begin
    with quPegaQuantidade do
    begin
       Close;
       SQL.Text := ' select sum(quantidade) as quantidade from itens_venda' +
       ' where id_venda =' + idVenda + ' and id_produto = ' + quPegaDados.FieldByName('id_produto').AsString;
       Open;
    end;

    if Application.MessageBox('Tem certeza que deseja excluir este produto?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    with quItensVenda do
      begin
        Close;
        SQL.Text := 'delete itens_venda' +
        ' where id_produto =' + quPegaDados.FieldByName('id_produto').AsString;
        ExecSQL;
      end;
      pegaDados;
      somaValor;
end;

procedure tfrm_itens_venda.zerarDesconto;
begin
  e_desconto.Text := '0,00';
  e_desconto.Enabled := true;
end;

end.




