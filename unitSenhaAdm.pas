unit unitSenhaAdm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tfrm_senha_adm = class(TForm)
    e_senha: TEdit;
    Label1: TLabel;
    btn_entrar: TButton;
    procedure acessar;
    procedure btn_entrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_senha_adm: Tfrm_senha_adm;

implementation

{$R *.dfm}

uses unitCadProdutos, unitCapital, unitDM, unitItensVenda, unitPrincipal,
  unitProcurarProduto, unitVenda, unitVendaDiaria, unitVendaSemanal;

procedure Tfrm_senha_adm.acessar;
begin
  if e_senha.Text = '123' then
  begin
    frm_capital.ShowModal;
    frm_senha_adm.Close;
  end
  else
  begin
    ShowMessage('Senha incorreta!!');
  end;
  e_senha.Text := '';
end;

procedure Tfrm_senha_adm.btn_entrarClick(Sender: TObject);
begin
  acessar;
end;

end.
