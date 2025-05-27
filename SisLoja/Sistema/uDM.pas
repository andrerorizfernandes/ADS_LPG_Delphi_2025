unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    phyFirebird: TFDPhysFBDriverLink;
    qryCarro: TFDQuery;
    dsrCarro: TDataSource;
    qryCarroCODCARRO: TIntegerField;
    qryCarroDESCRICAO: TStringField;
    qryCarroPLACA: TStringField;
    qryCarroCOR: TStringField;
    qryCarroPOTENCIA: TIntegerField;
    qryFornecedor: TFDQuery;
    dsrFornecedor: TDataSource;
    qryFornecedorCODFORNECEDOR: TIntegerField;
    qryFornecedorNOME: TStringField;
    qryFornecedorCNPJ: TStringField;
    qryFornecedorDDD: TStringField;
    qryFornecedorTELEFONE: TStringField;
    qryFornecedorEMAIL: TStringField;
    qryFornecedorENDERECO: TStringField;
    qryPeca: TFDQuery;
    dsrPeca: TDataSource;
    qryCarroFORNECEDOR: TStringField;
    qryCarroCNPJFORNECEDOR: TStringField;
    qryCarroCODFORNECEDOR: TIntegerField;
    qryPecaCODPECA: TIntegerField;
    qryPecaDESCRICAO: TStringField;
    qryPecaIDENTIFICADOR: TStringField;
    qryPecaORIGEM: TStringField;
    qryPecaATIVO: TStringField;
    qryPecaCODFABRICANTE: TIntegerField;
    qryPecaFABRICANTE: TStringField;
    qryPecaCIDADEFABRICANTE: TStringField;
    qryPecaORIGEMDESCRICAO: TStringField;
    qryFabrincate: TFDQuery;
    dsrFabricante: TDataSource;
    qryFabrincateCODFABRICANTE: TIntegerField;
    qryFabrincateNOME: TStringField;
    qryFabrincateCODCIDADE: TIntegerField;
    qryFabrincateCIDADE: TStringField;
    qryFabrincateUF: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
