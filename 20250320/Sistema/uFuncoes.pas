unit uFuncoes;

interface

uses
  FireDAC.Comp.Client;

procedure PassarParametro(const pQuery: TFDQuery; const pValores: array of variant; const pAbrirQuery: Boolean = True);

implementation

procedure PassarParametro(const pQuery: TFDQuery; const pValores: array of variant; const pAbrirQuery: Boolean = True);
begin
  pQuery.Close;
  for var I := 0 to Pred(Length(pValores)) do
    pQuery.Params[I].Value:= pValores[I];

  if pAbrirQuery then
    pQuery.Open;
end;
end.
