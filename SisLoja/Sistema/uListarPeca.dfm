object frmListarPeca: TfrmListarPeca
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pe'#231'as'
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
  object dbgPeca: TDBGrid
    Left = 0
    Top = 41
    Width = 758
    Height = 369
    Align = alClient
    DataSource = DM.dsrPeca
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
    OnDrawColumnCell = dbgPecaDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'CODPECA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FABRICANTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDENTIFICADOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIGEM'
        Visible = True
      end>
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
    end
    object btnEditar: TBitBtn
      Left = 555
      Top = 1
      Width = 101
      Height = 32
      Align = alRight
      Caption = '&Editar'
      TabOrder = 2
    end
  end
  object gbxFiltro: TGroupBox
    Left = 0
    Top = 0
    Width = 758
    Height = 41
    Align = alTop
    Caption = ' Informe a descri'#231#227'o da pe'#231'a '
    TabOrder = 2
    object edtFilttroDescricao: TEdit
      Left = 2
      Top = 17
      Width = 754
      Height = 22
      Align = alClient
      TabOrder = 0
      OnChange = edtFilttroDescricaoChange
      ExplicitLeft = 96
      ExplicitTop = 16
      ExplicitWidth = 121
      ExplicitHeight = 23
    end
  end
end
