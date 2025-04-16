unit uFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmFornecedor = class(TForm)
    pnlFornecedor: TPanel;
    pnlBotoes: TPanel;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FEditando: Boolean;
    procedure PrepararAmbiente;
    procedure Gravar;
    procedure Cancelar;
    { Private declarations }
  public
    property Editando: Boolean write FEditando;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM, uFuncoes;

procedure TfrmFornecedor.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmFornecedor.btnGravarClick(Sender: TObject);
begin
  Gravar;
  Close;
end;

procedure TfrmFornecedor.Cancelar;
begin
  DM.qryFornecedor.Cancel;
end;

procedure TfrmFornecedor.FormActivate(Sender: TObject);
begin
  PrepararAmbiente;
end;

procedure TfrmFornecedor.Gravar;
begin
  DM.qryFornecedor.Post;
  DM.qryFornecedor.Refresh;
end;

procedure TfrmFornecedor.PrepararAmbiente;
begin
  if FEditando then
    begin
      Caption := 'Fornecedor [Editando]';
      DM.qryFornecedor.Edit;
    end
  else
    begin
      Caption := 'Fornecedor [Inserindo]';
      DM.qryFornecedor.Append;
    end;
end;

end.
