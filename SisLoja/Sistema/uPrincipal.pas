unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    mmMenu: TMainMenu;
    ss1: TMenuItem;
    Carro1: TMenuItem;
    imgPrincipal: TImage;
    stbStatus: TStatusBar;
    tmrPrincipal: TTimer;
    procedure Carro1Click(Sender: TObject);
    procedure tmrPrincipalTimer(Sender: TObject);
  private
    procedure AbrirTelaListarCarros;
    procedure PreencherBarraDeStatus;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uListarCarro;

{$R *.dfm}

procedure TfrmPrincipal.AbrirTelaListarCarros;
begin
  var lTelaListarCarros := TfrmListarCarro.Create(nil);
  try
    lTelaListarCarros.ShowModal;
  finally
    lTelaListarCarros.Free;
  end;
end;

procedure TfrmPrincipal.Carro1Click(Sender: TObject);
begin
  AbrirTelaListarCarros;
end;

procedure TfrmPrincipal.PreencherBarraDeStatus;
const
  NOME_APRESENTACAO = 'ADS 2025 - Delphi';
begin
  stbStatus.Panels[0].Text := DateToStr(Date);
  stbStatus.Panels[1].Text := TimeToStr(Time);
  stbStatus.Panels[2].Text := NOME_APRESENTACAO;
end;

procedure TfrmPrincipal.tmrPrincipalTimer(Sender: TObject);
begin
  PreencherBarraDeStatus;
end;

end.
