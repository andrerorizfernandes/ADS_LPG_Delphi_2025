unit uPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, uDM, FireDAC.Comp.Client;

type
  TfrmPesquisa = class(TForm)
    dbgPesquisa: TDBGrid;
    lblQuantidadeRegistros: TLabel;
    pnlPesquisa: TPanel;
    gbxValorFiltro: TGroupBox;
    gbxCampoFiltro: TGroupBox;
    gbxTipoFiltro: TGroupBox;
    btnPesquisar: TBitBtn;
    cboCampoFiltro: TComboBox;
    cboTipoFiltro: TComboBox;
    edtValorFiltro: TEdit;
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
  private
    FqryPesquisa: TFDQuery;
    FdsrPesquisa: TDataSource;
    FSelectSql,
    FNomeCampoRetorno: string;

    function Pesquisar: Variant;
    procedure CriarObjetos;
    procedure DestruirObjetos;
    procedure PreencherCampo;
    procedure PreencherTipoFiltro;
    procedure AbrirQueryPesquisa;
    procedure AtualizarQuantidadeRegistros;
    procedure ValidarDados;
    { Private declarations }
  public
    property SelectSql: string write FSelectSQL;
    property NomeCampoRetorno: string write FNomeCampoRetorno;
    { Public declarations }
  end;

implementation

uses
  uFuncoes;

{$R *.dfm}

procedure TfrmPesquisa.AbrirQueryPesquisa;
const
  INSTRUCAO_SQL = '%s Where %s = -1';
begin
  try
    FqryPesquisa.Close;
    FqryPesquisa.SQL.Text := Format(INSTRUCAO_SQL, [FSelectSQL, FNomeCampoRetorno]);
    FqryPesquisa.Open;
  except
    on E: Exception do
    begin
      Erro('Ocorreu um erro interno. ' + E.Message);
    end;
  end;

  AtualizarQuantidadeRegistros;
end;

procedure TfrmPesquisa.AtualizarQuantidadeRegistros;
begin
  lblQuantidadeRegistros.Caption := IntToStr(FqryPesquisa.RecordCount) + ' Registros ';
end;

procedure TfrmPesquisa.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
  AjustarColunas(dbgPesquisa);
end;

procedure TfrmPesquisa.CriarObjetos;
begin
  FqryPesquisa := TFDQuery.Create(nil);
  FqryPesquisa.Connection := DM.Conexao;

  FdsrPesquisa := TDataSource.Create(nil);
  FdsrPesquisa.DataSet := FqryPesquisa;

  dbgPesquisa.DataSource := FdsrPesquisa;
end;

procedure TfrmPesquisa.dbgPesquisaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ZebrarGrid(dbgPesquisa, FqryPesquisa, Rect, Column, State);
end;

procedure TfrmPesquisa.DestruirObjetos;
begin
  FdsrPesquisa.Free;
  FqryPesquisa.Free;
end;

procedure TfrmPesquisa.FormActivate(Sender: TObject);
begin
  AbrirQueryPesquisa;
  PreencherCampo;
  PreencherTipoFiltro;
end;

procedure TfrmPesquisa.FormCreate(Sender: TObject);
begin
  CriarObjetos;
end;

procedure TfrmPesquisa.FormDestroy(Sender: TObject);
begin
  DestruirObjetos;
end;

function TfrmPesquisa.Pesquisar: Variant;
const
  INSTRUCAO_SQL = '%s Where %s';
begin
  ValidarDados;

  //temos que resolver para que o firebird desconsidere collate
  var lFiltroSql := EmptyStr;
  case cboTipoFiltro.ItemIndex of
    0: lFiltroSql := cboCampoFiltro.Text + ' = ' + QuotedStr(edtValorFiltro.Text);
    1: lFiltroSql := cboCampoFiltro.Text + ' <> ' + QuotedStr(edtValorFiltro.Text);
    2: lFiltroSql := cboCampoFiltro.Text + ' like ' + QuotedStr(edtValorFiltro.Text + '%');
    3: lFiltroSql := cboCampoFiltro.Text + ' like ' + QuotedStr('%' + edtValorFiltro.Text);
    4: lFiltroSql := cboCampoFiltro.Text + ' like ' + QuotedStr('%' + edtValorFiltro.Text + '%');
  end;

  try
    FqryPesquisa.Close;
    FqryPesquisa.SQL.Text := Format(INSTRUCAO_SQL, [FSelectSQL, lFiltroSql]);
    FqryPesquisa.Open;
  except
    on E: Exception do
      Erro('Erro ao pesquisar dados. ' + E.Message);
  end;

  AtualizarQuantidadeRegistros;
end;

procedure TfrmPesquisa.PreencherCampo;
begin
  cboCampoFiltro.Items.Clear;
  FqryPesquisa.First;
  for var I := 0 to Pred(FqryPesquisa.Fields.Count) do
    cboCampoFiltro.Items.Add(FqryPesquisa.Fields[I].FieldName);
end;

procedure TfrmPesquisa.PreencherTipoFiltro;
begin
  cboTipoFiltro.Items.Clear;
  cboTipoFiltro.Items.Add('Igual');
  cboTipoFiltro.Items.Add('Diferente');
  cboTipoFiltro.Items.Add('Iniciado por');
  cboTipoFiltro.Items.Add('Finalizado por');
  cboTipoFiltro.Items.Add('Que contenha');
end;

procedure TfrmPesquisa.ValidarDados;
begin
  if cboTipoFiltro.ItemIndex = -1 then
  begin
    Alerta('Selecione o tipo de filtro');
    cboTipoFiltro.SetFocus;
    Abort;
  end;

  if cboCampoFiltro.ItemIndex = -1 then
  begin
    Alerta('Selecione o campo para filtro');
    cboCampoFiltro.SetFocus;
    Abort;
  end;

  if (Trim(edtValorFiltro.Text) = EmptyStr) then
  begin
    Alerta('Informe o valor do filtro');
    edtValorFiltro.SetFocus;
    Abort;
  end;
end;

end.
