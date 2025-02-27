unit Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Banco;

type
  TfrmCliente = class(TForm)
    pnlPrincipal: TPanel;
    memResultado: TMemo;
    btnTeste: TButton;
    edtQuantidade: TEdit;
    btnPovoar: TButton;
    cboEstrutura: TComboBox;
    procedure btnTesteClick(Sender: TObject);
    procedure btnPovoarClick(Sender: TObject);
  private
    procedure PovoarLista;
    procedure PreencherListaUtilizandoWhile(pQuantidade: Integer);
    procedure PreencherListaUtilizandoRepeat(pQuantidade: Integer);
    procedure PreencherListaUtilizandoFor(pQuantidade: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

const
  MENSAGEM_DA_LISTA = 'Número do cliente %s';

{$R *.dfm}

procedure TfrmCliente.btnPovoarClick(Sender: TObject);
begin
  PovoarLista;
end;

procedure TfrmCliente.btnTesteClick(Sender: TObject);
begin
  const TURMA = 'ADS';
  var lTeste := 'ola mundo';
  memResultado.Lines.Add(lTeste);
  IntToStr(30);
end;

procedure TfrmCliente.PreencherListaUtilizandoWhile(pQuantidade: Integer);
begin
  var I := 1;
  memResultado.Lines.Clear;
  while (I <= pQuantidade) do
  begin
    memResultado.Lines.Add(Format(MENSAGEM_DA_LISTA, [I.ToString]));
    I := I + 1;
  end;
end;

procedure TfrmCliente.PreencherListaUtilizandoRepeat(pQuantidade: Integer);
begin
  var I := 1;
  memResultado.Lines.Clear;
  repeat
    memResultado.Lines.Add(Format(MENSAGEM_DA_LISTA, [I.ToString]));
    I := I + 1;
  until (I > pQuantidade);
end;

procedure TfrmCliente.PreencherListaUtilizandoFor(pQuantidade: Integer);
begin
  memResultado.Lines.Clear;
  for var I := 1 to pQuantidade do
    memResultado.Lines.Add(Format(MENSAGEM_DA_LISTA, [I.ToString]));
end;

procedure TfrmCliente.PovoarLista;
begin
  var lQuantidade := StrToIntDef(edtQuantidade.Text, 0);

  if lQuantidade = 0 then
    Exit;

  case cboEstrutura.ItemIndex of
    0: PreencherListaUtilizandoWhile(lQuantidade);
    1: PreencherListaUtilizandoRepeat(lQuantidade);
    2: PreencherListaUtilizandoFor(lQuantidade);
  end;

  edtQuantidade.SetFocus;
end;
end.
