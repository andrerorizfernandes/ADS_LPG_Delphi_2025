object frmListarCarro: TfrmListarCarro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Carros'
  ClientHeight = 444
  ClientWidth = 970
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
    Width = 970
    Height = 410
    Align = alClient
    DataSource = DM.dsrCarro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = dbgCarroDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'CODCARRO'
        Title.Caption = 'C'#243'digo'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 264
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
      end
      item
        Expanded = False
        FieldName = 'FORNECEDOR'
        Title.Caption = 'Fornecedor'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJFORNECEDOR'
        Title.Caption = 'Cnpj'
        Width = 114
        Visible = True
      end>
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 410
    Width = 970
    Height = 34
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 758
    object btnExcluir: TBitBtn
      Left = 868
      Top = 1
      Width = 101
      Height = 32
      Align = alRight
      Caption = '&Excluir'
      TabOrder = 0
      OnClick = btnExcluirClick
      ExplicitLeft = 656
    end
    object btnInserir: TBitBtn
      Left = 666
      Top = 1
      Width = 101
      Height = 32
      Align = alRight
      Caption = '&Inserir'
      TabOrder = 1
      OnClick = btnInserirClick
      ExplicitLeft = 454
    end
    object btnEditar: TBitBtn
      Left = 767
      Top = 1
      Width = 101
      Height = 32
      Align = alRight
      Caption = '&Editar'
      TabOrder = 2
      OnClick = btnEditarClick
      ExplicitLeft = 555
    end
  end
end
