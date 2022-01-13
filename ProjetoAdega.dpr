program ProjetoAdega;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {frm_principal},
  unitCadProdutos in 'unitCadProdutos.pas' {frm_produtos},
  unitDM in 'unitDM.pas' {DM: TDataModule},
  unitVenda in 'unitVenda.pas' {frm_venda},
  unitItensVenda in 'unitItensVenda.pas' {frm_itens_venda},
  unitProcurarProduto in 'unitProcurarProduto.pas' {frm_procurar_produto},
  unitVendaDiaria in 'unitVendaDiaria.pas' {frm_venda_diaria},
  unitVendaSemanal in 'unitVendaSemanal.pas' {frm_venda_semanal},
  unitCapital in 'unitCapital.pas' {frm_capital},
  unitSenhaAdm in 'unitSenhaAdm.pas' {frm_senha_adm},
  unitRelatorioPix in 'unitRelatorioPix.pas' {frm_entrada_pix},
  unitProdutosVendidos in 'unitProdutosVendidos.pas' {frm_produtos_vendidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.CreateForm(Tfrm_produtos, frm_produtos);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_venda, frm_venda);
  Application.CreateForm(Tfrm_itens_venda, frm_itens_venda);
  Application.CreateForm(Tfrm_procurar_produto, frm_procurar_produto);
  Application.CreateForm(Tfrm_venda_diaria, frm_venda_diaria);
  Application.CreateForm(Tfrm_venda_semanal, frm_venda_semanal);
  Application.CreateForm(Tfrm_capital, frm_capital);
  Application.CreateForm(Tfrm_senha_adm, frm_senha_adm);
  Application.CreateForm(Tfrm_entrada_pix, frm_entrada_pix);
  Application.CreateForm(Tfrm_produtos_vendidos, frm_produtos_vendidos);
  Application.Run;
end.
