unit Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Banco;

type
  TfrmCliente = class(TForm)
    memResultado: TMemo;
    gbxParametrosEntrada: TGroupBox;
    edtQuantidade: TEdit;
    cboEstrutura: TComboBox;
    lblValor: TLabel;
    lblEstrutura: TLabel;
    pnlRodape: TPanel;
    btnPovoar: TButton;
    btnLimpar: TButton;
    procedure btnLimparClick(Sender: TObject);
    procedure btnPovoarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
  private
    procedure PovoarLista;
    procedure PreencherListaUtilizandoWhile(pQuantidade: Integer);
    procedure PreencherListaUtilizandoRepeat(pQuantidade: Integer);
    procedure PreencherListaUtilizandoFor(pQuantidade: Integer);
    procedure PreencherWhileComBreak(pQuantidade: Integer);
    procedure PreencherForComContinue(pQuantidade: Integer);
    procedure PreencherCampoTipoEstrutura;
    procedure LimparTela;
    procedure ValidarDados;
    function ExibirUltimoElemento(pValores: TStrings): string;
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
  ValidarDados;
  PovoarLista;
end;

procedure TfrmCliente.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnPovoar.Click;
end;

function TfrmCliente.ExibirUltimoElemento(pValores: TStrings): string;
begin
  var lQuantidadeLinhas := pValores.Count;
  Result := pValores[lQuantidadeLinhas - 1];
end;

procedure TfrmCliente.btnLimparClick(Sender: TObject);
begin
  LimparTela;
end;

procedure TfrmCliente.FormActivate(Sender: TObject);
begin
  PreencherCampoTipoEstrutura;
end;

procedure TfrmCliente.LimparTela;
begin
  memResultado.Clear;
  edtQuantidade.Clear;
  cboEstrutura.ItemIndex := -1;
  edtQuantidade.SetFocus;
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

procedure TfrmCliente.PreencherWhileComBreak(pQuantidade: Integer);
begin
  var I := 1;
  memResultado.Lines.Clear;
  while (I <= pQuantidade) do
  begin
    memResultado.Lines.Add(Format(MENSAGEM_DA_LISTA, [I.ToString]));

    if (I = 5) then
      Break;

    Inc(I);
  end;
end;

procedure TfrmCliente.ValidarDados;
const
  MENSAGEM_ESTRUTURA = 'Selecione a estrutura';
  MENSAGEM_QUANTIDADE = 'Informe a quantidade';
begin
  if (cboEstrutura.ItemIndex = -1) then
  begin
    ShowMessage(MENSAGEM_ESTRUTURA);
    cboEstrutura.SetFocus;
    Abort;
  end;

  if (edtQuantidade.Text = EmptyStr) then
  begin
    ShowMessage(MENSAGEM_QUANTIDADE);
    edtQuantidade.SetFocus;
    Abort;
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

procedure TfrmCliente.PreencherCampoTipoEstrutura;
begin
  cboEstrutura.Items.Clear;
  cboEstrutura.Items.Add('While');
  cboEstrutura.Items.Add('Repeat');
  cboEstrutura.Items.Add('For');
  cboEstrutura.Items.Add('While com break');
  cboEstrutura.Items.Add('For com continue');
  cboEstrutura.SetFocus;
end;

procedure TfrmCliente.PreencherForComContinue(pQuantidade: Integer);
begin
  memResultado.Lines.Clear;
  for var I := 1 to pQuantidade do
  begin
    if (I mod 2 = 0) then
      Continue;

    memResultado.Lines.Add(Format(MENSAGEM_DA_LISTA, [I.ToString]));
  end;
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
    3: PreencherWhileComBreak(lQuantidade);
    4: PreencherForComContinue(lQuantidade);
  end;

  var lUltimoElemento := ExibirUltimoElemento(memResultado.Lines);
  ShowMessage(lUltimoElemento);
  edtQuantidade.SetFocus;
end;
end.
