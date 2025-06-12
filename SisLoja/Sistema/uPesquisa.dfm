object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisa'
  ClientHeight = 450
  ClientWidth = 916
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object lblQuantidadeRegistros: TLabel
    Left = 0
    Top = 435
    Width = 916
    Height = 15
    Align = alBottom
    Alignment = taRightJustify
    Caption = '0 Registros '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 851
    ExplicitWidth = 65
  end
  object dbgPesquisa: TDBGrid
    Left = 0
    Top = 40
    Width = 916
    Height = 395
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = dbgPesquisaDrawColumnCell
  end
  object pnlPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 916
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object gbxValorFiltro: TGroupBox
      Left = 410
      Top = 0
      Width = 418
      Height = 40
      Align = alClient
      Caption = ' Informe o valor do filtro '
      TabOrder = 0
      object edtValorFiltro: TEdit
        Left = 2
        Top = 17
        Width = 414
        Height = 21
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 23
      end
    end
    object gbxCampoFiltro: TGroupBox
      Left = 0
      Top = 0
      Width = 225
      Height = 40
      Align = alLeft
      Caption = ' Selecione o campo '
      TabOrder = 1
      object cboCampoFiltro: TComboBox
        Left = 2
        Top = 17
        Width = 221
        Height = 23
        Align = alClient
        Style = csDropDownList
        TabOrder = 0
      end
    end
    object gbxTipoFiltro: TGroupBox
      Left = 225
      Top = 0
      Width = 185
      Height = 40
      Align = alLeft
      Caption = ' Selecione o tipo de filtro '
      TabOrder = 2
      object cboTipoFiltro: TComboBox
        Left = 2
        Top = 17
        Width = 181
        Height = 23
        Align = alClient
        Style = csDropDownList
        TabOrder = 0
      end
    end
    object btnPesquisar: TBitBtn
      Left = 828
      Top = 0
      Width = 88
      Height = 40
      Align = alRight
      Caption = '&Pesquisar'
      TabOrder = 3
      OnClick = btnPesquisarClick
    end
  end
end
