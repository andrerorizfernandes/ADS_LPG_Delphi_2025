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
  private
    FqryPesquisa: TFDQuery;
    FdsrPesquisa: TDataSource;
    FSQL,
    FNomeCampoRetorno: string;

    function Pesquisar: Variant;
    { Private declarations }
  public
    property Sql: string write FSQL;
    property NomeCampoRetorno: string write FNomeCampoRetorno;

    procedure CriarObjetos;
    procedure DestruirObjetos;
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmPesquisa.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmPesquisa.CriarObjetos;
begin
  FqryPesquisa := TFDQuery.Create(nil);
  FqryPesquisa.Connection := DM.Conexao;

  FdsrPesquisa := TDataSource.Create(nil);
  FdsrPesquisa.DataSet := FqryPesquisa;

  dbgPesquisa.DataSource := FdsrPesquisa;
end;

procedure TfrmPesquisa.DestruirObjetos;
begin
  FdsrPesquisa.Free;
  FqryPesquisa.Free;
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
begin
  FqryPesquisa.Close;
  FqryPesquisa.SQL.Text := FSQL;
  FqryPesquisa.Open;

  lblQuantidadeRegistros.Caption := IntToStr(FqryPesquisa.RecordCount) + ' Registros ';
end;
end.
