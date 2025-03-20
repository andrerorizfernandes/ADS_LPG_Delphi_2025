unit uListarCarro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, uDM, uFuncoes;

type
  TfrmListarCarro = class(TForm)
    dbgCarro: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListarCarro: TfrmListarCarro;

implementation

{$R *.dfm}

procedure TfrmListarCarro.FormActivate(Sender: TObject);
begin
  PassarParametro(DM.qryCarro, []);
end;

procedure TfrmListarCarro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PassarParametro(DM.qryCarro, [], False);
end;

end.
