object frmListarFornecedor: TfrmListarFornecedor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fornecedores'
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
  object dbgFornecedor: TDBGrid
    Left = 0
    Top = 0
    Width = 758
    Height = 410
    Align = alClient
    DataSource = DM.dsrFornecedor
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
    OnDrawColumnCell = dbgFornecedorDrawColumnCell
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 410
    Width = 758
    Height = 34
    Align = alBottom
    TabOrder = 1
    object btnExcluir: TBitBtn
      Left = 656
      Top = 1
      Width = 101
      Height = 32
      Align = alRight
      Caption = '&Excluir'
      TabOrder = 0
      OnClick = btnExcluirClick
    end
    object btnInserir: TBitBtn
      Left = 454
      Top = 1
      Width = 101
      Height = 32
      Align = alRight
      Caption = '&Inserir'
      TabOrder = 1
      OnClick = btnInserirClick
    end
    object btnEditar: TBitBtn
      Left = 555
      Top = 1
      Width = 101
      Height = 32
      Align = alRight
      Caption = '&Editar'
      TabOrder = 2
      OnClick = btnEditarClick
    end
  end
end
