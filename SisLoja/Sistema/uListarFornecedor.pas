unit uListarFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, uDM, uFuncoes,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmListarFornecedor = class(TForm)
    dbgFornecedor: TDBGrid;
    pnlBotoes: TPanel;
    btnExcluir: TBitBtn;
    btnInserir: TBitBtn;
    btnEditar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure dbgFornecedorDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure ValidaExclusaoFornecedor;
    procedure ExcluirFornecedor;
    procedure AbrirTelaFornecedor(const pEditando: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uFornecedor;

procedure TfrmListarFornecedor.AbrirTelaFornecedor(const pEditando: Boolean);
begin
  var lTelaFornecedor := TfrmFornecedor.Create(nil);
  try
    lTelaFornecedor.Editando := pEditando;
    lTelaFornecedor.ShowModal;
  finally
    lTelaFornecedor.Free;
  end;
end;

procedure TfrmListarFornecedor.btnEditarClick(Sender: TObject);
begin
  AbrirTelaFornecedor(True);
end;

procedure TfrmListarFornecedor.btnExcluirClick(Sender: TObject);
begin
  ValidaExclusaoFornecedor;
  ExcluirFornecedor;
end;

procedure TfrmListarFornecedor.btnInserirClick(Sender: TObject);
begin
  AbrirTelaFornecedor(False);
end;

procedure TfrmListarFornecedor.dbgFornecedorDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ZebrarGrid(Sender, DM.qryFornecedor, Rect, Column, State);
end;

procedure TfrmListarFornecedor.ExcluirFornecedor;
begin
  DM.qryFornecedor.Delete;
end;

procedure TfrmListarFornecedor.FormActivate(Sender: TObject);
begin
  PassarParametro(DM.qryFornecedor, []);
  AjustarColunas(dbgFornecedor);
end;

procedure TfrmListarFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PassarParametro(DM.qryFornecedor, [], False);
end;

procedure TfrmListarFornecedor.ValidaExclusaoFornecedor;
begin
  if DM.qryFornecedor.IsEmpty then
  begin
    Alerta('Não existem registros há serem excluídos');
    Abort;
  end;

  if (not Pergunta('Deseja realmente exluir esse fornecedor?')) then
    Abort;
end;

end.
