program Loja;

uses
  Vcl.Forms,
  uListarCarro in 'uListarCarro.pas' {frmListarCarro},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uCarro in 'uCarro.pas' {frmCarro},
  uListarFornecedor in 'uListarFornecedor.pas' {frmListarFornecedor},
  uFornecedor in 'uFornecedor.pas' {frmFornecedor},
  uListarPeca in 'uListarPeca.pas' {frmListarPeca},
  uPeca in 'uPeca.pas' {frmPeca},
  uPesquisa in 'uPesquisa.pas' {frmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
