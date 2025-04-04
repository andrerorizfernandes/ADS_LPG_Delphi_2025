unit uFuncoes;

interface

uses
  FireDAC.Comp.Client, Winapi.Windows, Vcl.DBGrids, Vcl.Grids, Data.DB,
  Vcl.Graphics, Vcl.Forms;

procedure PassarParametro(const pQuery: TFDQuery; const pValores: array of variant; const pAbrirQuery: Boolean = True);
procedure ZebrarGrid(Sender, DataSet: TObject; Rect: TRect; Column: TColumn; State: TGridDrawState);
procedure AjustarColunas(const pGrid: TDBGrid);
procedure Alerta(const pMensagem: string);
procedure Informacao(const pMensagem: string);
procedure Erro(const pMensagem: string);
function Pergunta(const pPergunta: string): Boolean;

implementation

const
  NOME_SISTEMA = 'Loja';

procedure PassarParametro(const pQuery: TFDQuery; const pValores: array of variant; const pAbrirQuery: Boolean = True);
begin
  pQuery.Close;
  for var I := 0 to Pred(Length(pValores)) do
    pQuery.Params[I].Value:= pValores[I];

  if pAbrirQuery then
    pQuery.Open;
end;

procedure ZebrarGrid(Sender, DataSet: TObject; Rect: TRect; Column: TColumn;State: TGridDrawState);
begin
  if not (DataSet as TDataSet).Active  then Exit;
  if     (DataSet as TDataSet).IsEmpty then Exit;

  if not Odd((DataSet as TDataSet).RecNo) then
    if not (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.Color := cl3DLight;
      (Sender as TDBGrid).Canvas.FillRect(Rect);
      (Sender as TDBGrid).DefaultDrawDataCell(rect,column.Field,State);
    end
    else
    begin
      (Sender as TDBGrid).Canvas.Brush.Color := $00CFB78F;
      (Sender as TDBGrid).Canvas.FillRect(Rect);
      (Sender as TDBGrid).DefaultDrawDataCell(rect,column.Field,State);
    end
    else
    if (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.Color := $00CFB78F;
      (Sender as TDBGrid).Canvas.FillRect(Rect);
      (Sender as TDBGrid).DefaultDrawDataCell(rect,column.Field,State);
    end;
end;

procedure AjustarColunas(const pGrid: TDBGrid);
begin
  try
    var lDataSet := pGrid.DataSource.DataSet;

    if (lDataSet.Active = False) then
      Exit;

    if (lDataSet.State <> dsBrowse) then
      Exit;

    var lPosicao:= lDataSet.RecNo;

    if lDataSet.RecordCount = 0 then
      begin
        for var I := 0 to pGrid.Columns.Count - 1 do
          pGrid.Columns[I].Width:= 100;
      end
    else
      begin
        var lTamanhos: array of Integer;
        SetLength(lTamanhos, pGrid.Columns.Count);
        for var I := 0 to pGrid.Columns.Count - 1 do
          if pGrid.Columns[I].Visible then
            lTamanhos[I]:= pGrid.Canvas.TextWidth(pGrid.Columns[I].Title.Caption)
          else
            lTamanhos[I]:= 0;

        try
           lDataSet.DisableControls;
           lDataSet.First;
           while not lDataSet.Eof do
           begin
             for var I := 0 to pGrid.Columns.Count - 1 do
             begin
               if pGrid.Columns[I].Visible then
                 begin
                   var lTamanho := pGrid.Canvas.TextWidth(pGrid.Columns[I].Field.AsString);
                   if lTamanho > lTamanhos[I] then
                     lTamanhos[I] := lTamanho;
                 end
                 else
                   lTamanhos[I]:= 0;
             end;
             lDataSet.Next;
           end;

           for var I := 0 to pGrid.Columns.Count - 1 do
             if pGrid.Columns[I].Visible then
             begin
               try
                  pGrid.Columns[I].Width:= (lTamanhos[I] + 10);
               except
               end;
             end;

           lDataSet.First;
        finally
           lDataSet.RecNo:= lPosicao;
           SetLength(lTamanhos, 0);
           lTamanhos:= nil;
           lDataSet.EnableControls;
        end;
      end;
  except
    Alerta('Falha ao ajustar colunas');
  end;
end;

procedure Alerta(const pMensagem: string);
begin
  Application.MessageBox(PChar(pMensagem), PWideChar(NOME_SISTEMA), MB_ICONWARNING);
end;

Procedure Informacao(const pMensagem: string);
begin
  Application.MessageBox(PChar(pMensagem), PWideChar(NOME_SISTEMA), MB_ICONINFORMATION);
end;

procedure Erro(const pMensagem: string);
begin
  Application.MessageBox(Pchar(pMensagem), PWideChar(NOME_SISTEMA), MB_OK + MB_ICONERROR);
end;

function Pergunta(const pPergunta: string): Boolean;
begin
  Result:= False;

  if (Application.MessageBox(PChar(pPergunta), PWideChar(NOME_SISTEMA), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES) then
    Result:= True;
end;
end.
