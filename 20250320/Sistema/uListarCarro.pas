unit uListarCarro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, uDM, uFuncoes,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmListarCarro = class(TForm)
    dbgCarro: TDBGrid;
    pnlBotoes: TPanel;
    btnExcluir: TBitBtn;
    btnInserir: TBitBtn;
    btnEditar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgCarroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmListarCarro.dbgCarroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ZebrarGrid(dbgCarro, DM.qryCarro, Rect, Column, State);
end;

procedure TfrmListarCarro.FormActivate(Sender: TObject);
begin
  PassarParametro(DM.qryCarro, []);
  AjustarColunas(dbgCarro);
end;

procedure TfrmListarCarro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PassarParametro(DM.qryCarro, [], False);
end;

end.
