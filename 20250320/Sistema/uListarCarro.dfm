object frmListarCarro: TfrmListarCarro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Carro'
  ClientHeight = 444
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 15
  object dbgCarro: TDBGrid
    Left = 0
    Top = 0
    Width = 758
    Height = 444
    Align = alClient
    DataSource = DM.dsrCarro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'CODCARRO'
        Title.Caption = 'C'#243'digo'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 341
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACA'
        Title.Caption = 'Placa'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COR'
        Title.Caption = 'Cor'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POTENCIA'
        Title.Caption = 'Pot'#234'ncia'
        Visible = True
      end>
  end
end
