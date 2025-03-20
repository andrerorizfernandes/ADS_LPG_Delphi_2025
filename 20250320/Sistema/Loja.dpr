program Loja;

uses
  Vcl.Forms,
  uListarCarro in 'uListarCarro.pas' {frmListarCarro},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFuncoes in 'uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmListarCarro, frmListarCarro);
  Application.Run;
end.
