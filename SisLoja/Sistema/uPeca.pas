unit uPeca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmPeca = class(TForm)
    pnlPeca: TPanel;
    pnlBotoes: TPanel;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    lblDescicao: TLabel;
    dbeDescricao: TDBEdit;
    dbeIdentificador: TDBEdit;
    lblIdentificador: TLabel;
    lblFabricante: TLabel;
    dbrOrigem: TDBRadioGroup;
    edtCodFabricante: TEdit;
    edtNomeFabricante: TEdit;
    btnPesquisaFabricante: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisaFabricanteClick(Sender: TObject);
    procedure edtCodFabricanteKeyPress(Sender: TObject; var Key: Char);
  private
    FEditando: Boolean;
    procedure PrepararAmbiente;
    procedure Gravar;
    procedure Cancelar;
    procedure ValidarDados;
    function NomeFabricante(const pCodigoFabricante: Integer): string;
    { Private declarations }
  public
    property Editando: Boolean write FEditando;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM, uFuncoes;

procedure TfrmPeca.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
  Close;
end;

procedure TfrmPeca.btnGravarClick(Sender: TObject);
begin
  ValidarDados;
  Gravar;
  Close;
end;

procedure TfrmPeca.btnPesquisaFabricanteClick(Sender: TObject);
begin
  edtCodFabricante.Text :=
    Pesquisa(
      'select codfabricante, nome from fabricante',
      'codfabricante',
      'Pesquisa de fabricante');

  edtNomeFabricante.Text := NomeFabricante(StrToIntDef(edtCodFabricante.Text, -1));
end;

procedure TfrmPeca.Cancelar;
begin
  DM.qryPeca.Cancel;
  edtCodFabricante.Clear;
  edtNomeFabricante.Clear;
end;

procedure TfrmPeca.edtCodFabricanteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtNomeFabricante.Text := NomeFabricante(StrToIntDef(edtCodFabricante.Text, -1));
end;

procedure TfrmPeca.FormActivate(Sender: TObject);
begin
  PrepararAmbiente;
end;

procedure TfrmPeca.Gravar;
begin
  DM.qryPecaATIVO.AsString := 'S';
  DM.qryPecaCODFABRICANTE.AsString := edtCodFabricante.Text;
  DM.qryPeca.Post;
  DM.qryPeca.Refresh;
  edtCodFabricante.Clear;
  edtNomeFabricante.Clear;
end;

function TfrmPeca.NomeFabricante(const pCodigoFabricante: Integer): string;
begin
  Result := EmptyStr;

  if DM.qryFabrincate.Locate('codfabricante', pCodigoFabricante, []) then
    Result := DM.qryFabrincateNOME.AsString;
end;

procedure TfrmPeca.PrepararAmbiente;
begin
  if FEditando then
    begin
      Caption := 'Peça [Editando]';
      edtCodFabricante.Text := DM.qryPecaCODFABRICANTE.AsString;
      if DM.qryFabrincate.Locate('codfabricante', DM.qryPecaCODFABRICANTE.AsString, []) then
        edtNomeFabricante.Text := DM.qryFabrincateNOME.AsString;
      DM.qryPeca.Edit;
    end
  else
    begin
      Caption := 'Peça [Inserindo]';
      DM.qryPeca.Append;
    end;
end;

procedure TfrmPeca.ValidarDados;
begin
  if (dbeDescricao.Text = EmptyStr) then
  begin
    Alerta('Informe a descrição');
    dbeDescricao.SetFocus;
    Abort;
  end;

  if (dbeIdentificador.Text = EmptyStr) then
  begin
    Alerta('Informe o identificador');
    dbeIdentificador.SetFocus;
    Abort;
  end;

  if (dbrOrigem.ItemIndex = -1) then
  begin
    Alerta('Selecione a origem');
    Abort;
  end;

  edtNomeFabricante.Text := NomeFabricante(StrToIntDef(edtCodFabricante.Text, -1));

  if (edtNomeFabricante.Text = EmptyStr) then
  begin
    Alerta('Informe o fabricante');
    edtCodFabricante.SetFocus;
    Abort;
  end;
end;

end.
