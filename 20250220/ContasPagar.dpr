program ContasPagar;

uses
  Vcl.Forms,
  Cliente in 'Cliente.pas' {frmCliente},
  Banco in 'Banco.pas' {frmBanco},
  Utilidade in 'Utilidade.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCliente, frmCliente);
  Application.CreateForm(TfrmBanco, frmBanco);
  Application.Run;
end.
