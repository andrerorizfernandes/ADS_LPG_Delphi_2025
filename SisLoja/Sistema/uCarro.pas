unit uCarro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCarro = class(TForm)
    pnlCarro: TPanel;
    pnlBotoes: TPanel;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    lblDescicao: TLabel;
    dbeDescricao: TDBEdit;
    dbeCor: TDBEdit;
    lblCor: TLabel;
    dbePlaca: TDBEdit;
    lblPlaca: TLabel;
    dbePotencia: TDBEdit;
    lblPotencia: TLabel;
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

procedure TfrmCarro.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
  Close;
end;

procedure TfrmCarro.btnGravarClick(Sender: TObject);
begin
  Gravar;
  Close;
end;

procedure TfrmCarro.Cancelar;
begin
  DM.qryCarro.Cancel;
end;

procedure TfrmCarro.FormActivate(Sender: TObject);
begin
  PrepararAmbiente;
end;

procedure TfrmCarro.Gravar;
begin
  DM.qryCarro.Post;
  DM.qryCarro.Refresh;
end;

procedure TfrmCarro.PrepararAmbiente;
begin
  if FEditando then
    begin
      Caption := 'Carro [Editando]';
      DM.qryCarro.Edit;
    end
  else
    begin
      Caption := 'Carro [Inserindo]';
      DM.qryCarro.Append;
    end;
end;

end.
