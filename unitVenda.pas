unit unitVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Data.Win.ADODB;

type
  Tfrm_venda = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cb_vendedor: TComboBox;
    Panel2: TPanel;
    Label2: TLabel;
    DSVenda: TDataSource;
    quVenda: TADOQuery;
    Label3: TLabel;
    dt_data: TDateTimePicker;
    btn_gerar_venda: TButton;
    quVendaid: TAutoIncField;
    quVendavendedor: TStringField;
    quVendadata: TDateTimeField;
    quVendastatus: TStringField;
    procedure FormShow(Sender: TObject);
    procedure gerarVenda;
  private
    { Private declarations }
  public
    id: string;
    idVenda: string;
    { Public declarations }
  end;

var
  frm_venda: Tfrm_venda;

implementation

{$R *.dfm}

uses unitItensVenda, unitCadProdutos, unitDM, unitPrincipal;

procedure Tfrm_venda.gerarVenda;
begin
  with quVenda do
  begin
    Close;
    SQL.Text:= 'insert into venda (vendedor, data, status) values( ' + QuotedStr('Administrador') + ',' +
            QuotedStr(DateToStr(date)) + ',' +
            QuotedStr('aberto') + ')';
    ExecSQL;
    end;
    with DM.quVendas do
  begin
    Close;
    SQL.Text:= 'select * from venda' +
    ' where id =' + '(select max(id) from venda)' + ' and status =' + QuotedStr('aberto');
    Open;
  end;
  idVenda :=  DM.quVendas.FieldByName('id').AsString;
  frm_itens_venda.idVenda := idVenda;
  frm_itens_venda.pegaDados;
end;

procedure Tfrm_venda.FormShow(Sender: TObject);
begin
  dt_data.Date := date;
end;

end.
