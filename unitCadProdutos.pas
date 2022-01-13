unit unitCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  Tfrm_produtos = class(TForm)
    PageControl1: TPageControl;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    ImageList1: TImageList;
    btn_fechar: TAction;
    btn_editar: TAction;
    btn_excluir: TAction;
    btn_novo: TAction;
    salvar: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    btn_salvar: TToolButton;
    DS: TDataSource;
    DBGrid1: TDBGrid;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    Panel1: TPanel;
    e_nome: TEdit;
    Label1: TLabel;
    e_valor: TEdit;
    Label2: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    e_cod_barras: TEdit;
    Label4: TLabel;
    cb_tipo: TComboBox;
    quCadProdutos: TADOQuery;
    quCadProdutosid: TAutoIncField;
    quCadProdutoscod_barras: TStringField;
    quCadProdutosnome: TStringField;
    quCadProdutostipo: TStringField;
    quCadProdutosvalor: TBCDField;
    quCadProdutosstatus: TStringField;
    Image1: TImage;
    Panel3: TPanel;
    e_pesquisar_nome: TEdit;
    btn_procurar: TButton;
    Panel4: TPanel;
    Label5: TLabel;
    btn_atualizar: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    lbl_aviso: TLabel;
    Timer1: TTimer;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    procedure pegaDados;
    procedure limpaDados;
    procedure FormShow(Sender: TObject);
    procedure btn_fecharExecute(Sender: TObject);
    procedure btn_novoExecute(Sender: TObject);
    procedure salvarExecute(Sender: TObject);
    procedure btn_editarExecute(Sender: TObject);
    procedure btn_excluirExecute(Sender: TObject);
    procedure e_valorExit(Sender: TObject);
    procedure procuraProduto;
    procedure btn_procurarClick(Sender: TObject);
    procedure btn_atualizarExecute(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Panel4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure e_pesquisar_nomeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
     id: string;
     idProduto: string;
     validaCodBarras: string;
  end;

var
  frm_produtos: Tfrm_produtos;

implementation

{$R *.dfm}

uses unitDM, unitPrincipal, unitItensVenda, unitVenda;

procedure Tfrm_produtos.btn_atualizarExecute(Sender: TObject);
begin
  pegaDados;
end;

procedure Tfrm_produtos.btn_editarExecute(Sender: TObject);
begin
   id:= QuCadProdutosid.AsString; // conforme o id que estiver setado na dbgrid1 ele traz nos campos as informaçoes
   e_nome.Text := quCadProdutosNome.AsString;
   cb_tipo.Text := quCadProdutosTipo.AsString;
   e_cod_barras.Text := quCadProdutoscod_barras.AsString;
   e_valor.Text := QuCadProdutosvalor.AsString;
end;

procedure Tfrm_produtos.btn_excluirExecute(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir o registro selecionado?',
  'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
  with DM.qu do
    begin
     close;
     SQL.Text:= 'delete produtos' +
     ' where id =' + quCadProdutos.FieldByName('id').AsString;
     ExecSQL;
     pegaDados;
    end;
  end;
end;

procedure Tfrm_produtos.btn_fecharExecute(Sender: TObject);
begin
  frm_produtos.Close;
end;

procedure Tfrm_produtos.btn_novoExecute(Sender: TObject);
begin
  e_nome.Text := '';
  e_valor.Text := '';
end;

procedure Tfrm_produtos.btn_procurarClick(Sender: TObject);
begin
  procuraProduto;
end;

procedure Tfrm_produtos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (Column.Field.FieldName = 'tipo') then
begin
DBGrid1.Canvas.Brush.Color:= clAqua;
DBGrid1.Canvas.Font.Color:= clWindowText;
DBGrid1.Canvas.FillRect(Rect);
DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
end;


procedure Tfrm_produtos.e_pesquisar_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    procuraProduto;
  end;
end;

procedure Tfrm_produtos.e_valorExit(Sender: TObject);
var
     TextOnEdit: UnicodeString;
     Value: Currency;
begin

     TextOnEdit := e_valor.Text;

     if TryStrToCurr(TextOnEdit, Value) then
           e_valor.Text := FormatFloat('#.##', Value)
     else
           e_valor.Text := '0.00'; //se caso não conseguiu converter o valor digitado em número, mostra 0
end;


procedure Tfrm_produtos.FormShow(Sender: TObject);
begin
  e_pesquisar_nome.Text := '%%';
  limpaDados;
  pegaDados;
end;

procedure tfrm_produtos.pegaDados;
begin
  with QuCadProdutos do
    begin
      close;
      SQL.Text:= 'select id, cast(cod_barras AS varchar) as cod_barras, upper(nome) as nome, valor, upper(tipo) as tipo, status from produtos' +
      ' where status =' + QuotedStr('ativo') +
      ' order by tipo, nome';
      open;
    end;
end;

procedure tfrm_produtos.limpaDados;
begin
  e_nome.Text := '';
  e_valor.Text := '';
  e_cod_barras.Text := '';
  cb_tipo.ItemIndex := -1;
end;

procedure Tfrm_produtos.Panel4Click(Sender: TObject);
begin
  e_pesquisar_nome.Text := '';
  pegaDados;
end;

procedure Tfrm_produtos.salvarExecute(Sender: TObject);
begin
    if e_nome.Text = '' then
    begin
      ShowMessage('Por favor preencher o nome do produto!!');
      exit;
    end;

    if e_valor.Text = '' then
    begin
      ShowMessage('Por favor preencher o valor do produto!!');
      exit;
    end;

    if cb_tipo.Text = '' then
    begin
      ShowMessage('Escolha a categoria do produto!');
      Exit;
    end;

    e_valor.Text := StringReplace(e_valor.Text,',','.', [rfReplaceAll]);

    with DM.qu do
      begin
        close;
        if id <> '' then
          begin
            SQL.Text:= 'update produtos set nome = ' +
            QuotedStr(e_nome.Text) + ',' +
            ' cod_barras = ' + QuotedStr(e_cod_barras.Text) + ',' +
            ' tipo = ' + QuotedStr(cb_tipo.Text) + ',' +
            ' valor = ' + QuotedStr(e_valor.Text) +
            ' where id = ' + id;
            ShowMessage('Informações alteradas com sucesso!');
            id := '';
            limpaDados;
          end
          else
          begin
              SQL.Text:= 'insert into produtos (nome, valor, status, cod_barras, tipo) values( ' + QuotedStr(e_nome.Text) + ',' +
              QuotedStr(e_valor.Text) + ',' + QuotedStr('ativo') + ',' + QuotedStr(e_cod_barras.Text) + ',' + QuotedStr(cb_tipo.Text) + ')';
              ShowMessage('Produto Cadastrado com sucesso!!');
          end;
            ExecSQL;
      end;
        pegaDados;
        limpaDados;
end;

procedure Tfrm_produtos.Timer1Timer(Sender: TObject);
begin
  lbl_aviso.Visible := not lbl_aviso.Visible ;
end;

procedure Tfrm_produtos.procuraProduto;
begin
    with quCadProdutos do
  begin
    close;
    SQL.Text:= 'select * from produtos ' +
    ' where nome like ' + QuotedStr(e_pesquisar_nome.Text);
    open;
  end;

  if quCadProdutos.FieldByName('cod_barras').AsString = '' then
  begin
    ShowMessage('Produto não encontrado!');
    pegaDados;
  end;
end;


end.
