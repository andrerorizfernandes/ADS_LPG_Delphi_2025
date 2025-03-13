program SisEscola;

uses
  Vcl.Forms,
  uEscola in 'uEscola.pas' {frmEscola};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmEscola, frmEscola);
  Application.Run;
end.
