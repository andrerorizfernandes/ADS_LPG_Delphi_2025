unit uListarPeca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, uDM, uFuncoes,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmListarPeca = class(TForm)
    dbgPeca: TDBGrid;
    pnlBotoes: TPanel;
    btnExcluir: TBitBtn;
    btnInserir: TBitBtn;
    btnEditar: TBitBtn;
    gbxFiltro: TGroupBox;
    edtFilttroDescricao: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgPecaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtFilttroDescricaoChange(Sender: TObject);
  private
    procedure ValidaExclusaoPeca;
    procedure ExcluirPeca;
    procedure FiltrarPecaoPorDescricao;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uFornecedor;

procedure TfrmListarPeca.btnExcluirClick(Sender: TObject);
begin
  ValidaExclusaoPeca;
  ExcluirPeca;
  PassarParametro(DM.qryPeca, ['S'])
end;

procedure TfrmListarPeca.dbgPecaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ZebrarGrid(Sender, DM.qryPeca, Rect, Column, State);
end;

procedure TfrmListarPeca.edtFilttroDescricaoChange(Sender: TObject);
begin
  FiltrarPecaoPorDescricao;
end;

procedure TfrmListarPeca.ExcluirPeca;
begin
  DM.qryPeca.Edit;
  DM.qryPecaATIVO.AsString := 'N';
  DM.qryPeca.Post;
end;

procedure TfrmListarPeca.FiltrarPecaoPorDescricao;
begin
  DM.qryPeca.Filter := 'DESCRICAO like ' + QuotedStr(edtFilttroDescricao.Text + '%');
  DM.qryPeca.Filtered := (edtFilttroDescricao.Text <> EmptyStr);
end;

procedure TfrmListarPeca.FormActivate(Sender: TObject);
begin
  PassarParametro(DM.qryPeca, ['S']);
  AjustarColunas(dbgPeca);
end;

procedure TfrmListarPeca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PassarParametro(DM.qryPeca, [], False);
end;

procedure TfrmListarPeca.ValidaExclusaoPeca;
begin
  if DM.qryPeca.IsEmpty then
  begin
    Alerta('Não existem registros há serem excluídos');
    Abort;
  end;

  if (not Pergunta('Deseja realmente exluir essa peça?')) then
    Abort;
end;

end.
