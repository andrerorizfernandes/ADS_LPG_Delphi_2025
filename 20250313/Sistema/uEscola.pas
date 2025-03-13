unit uEscola;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.FBDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, FireDAC.Phys.FB;

type
  TfrmEscola = class(TForm)
    dbgAluno: TDBGrid;
    Conexao: TFDConnection;
    phyDriverLink: TFDPhysFBDriverLink;
    qryAluno: TFDQuery;
    dsrAluno: TDataSource;
    qryAlunoCODALUNO: TIntegerField;
    qryAlunoNOME: TStringField;
    qryAlunoIDADE: TIntegerField;
    qryAlunoSEXO: TStringField;
    qryAlunoCPF: TStringField;
    qryAlunoEMAIL: TStringField;
    qryAlunoDDD: TStringField;
    qryAlunoTELEFONE: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure AbrirConexao(const pAbrir: Boolean);
    procedure AbrirQuery(const pQuery: TFDQuery; pAbrir: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscola: TfrmEscola;

implementation

{$R *.dfm}

procedure TfrmEscola.AbrirQuery(const pQuery: TFDQuery; pAbrir: Boolean);
begin
  if pAbrir then
    pQuery.Open
  else
    pQuery.Close;
end;

procedure TfrmEscola.FormActivate(Sender: TObject);
begin
  AbrirConexao(True);
  AbrirQuery(qryAluno, True);
end;

procedure TfrmEscola.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AbrirQuery(qryAluno, False);
  AbrirConexao(False);
end;

procedure TfrmEscola.AbrirConexao(const pAbrir: Boolean);
begin
  if pAbrir then
    Conexao.Open
  else
    Conexao.Close;
end;
end.
