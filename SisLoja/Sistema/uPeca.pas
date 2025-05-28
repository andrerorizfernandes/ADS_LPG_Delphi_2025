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
    dblFabricante: TDBLookupComboBox;
    dbrOrigem: TDBRadioGroup;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TfrmPeca.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
  Close;
end;

procedure TfrmPeca.btnGravarClick(Sender: TObject);
begin
  Gravar;
  Close;
end;

procedure TfrmPeca.Button1Click(Sender: TObject);
begin
  Pesquisa('select * from peca', 'codpeca', 'Pesquisa de peça');
end;

procedure TfrmPeca.Cancelar;
begin
  DM.qryPeca.Cancel;
end;

procedure TfrmPeca.FormActivate(Sender: TObject);
begin
  PrepararAmbiente;
end;

procedure TfrmPeca.Gravar;
begin
  DM.qryPecaATIVO.AsString := 'S';
  DM.qryPeca.Post;
  DM.qryPeca.Refresh;
end;

procedure TfrmPeca.PrepararAmbiente;
begin
  if FEditando then
    begin
      Caption := 'Peça [Editando]';
      DM.qryPeca.Edit;
    end
  else
    begin
      Caption := 'Peça [Inserindo]';
      DM.qryPeca.Append;
    end;
end;
end.
