object frmPeca: TfrmPeca
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pe'#231'a'
  ClientHeight = 141
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 15
  object pnlPeca: TPanel
    Left = 0
    Top = 0
    Width = 730
    Height = 107
    Align = alClient
    TabOrder = 0
    object lblDescicao: TLabel
      Left = 8
      Top = 6
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    object lblIdentificador: TLabel
      Left = 416
      Top = 6
      Width = 67
      Height = 15
      Caption = 'Identificador'
    end
    object lblFabricante: TLabel
      Left = 8
      Top = 55
      Width = 55
      Height = 15
      Caption = 'Fabricante'
    end
    object dbeDescricao: TDBEdit
      Left = 8
      Top = 23
      Width = 402
      Height = 23
      DataField = 'DESCRICAO'
      DataSource = DM.dsrPeca
      TabOrder = 0
    end
    object dbeIdentificador: TDBEdit
      Left = 416
      Top = 23
      Width = 89
      Height = 23
      DataField = 'IDENTIFICADOR'
      DataSource = DM.dsrPeca
      TabOrder = 1
    end
    object dblFabricante: TDBLookupComboBox
      Left = 8
      Top = 72
      Width = 713
      Height = 23
      DataField = 'CODFABRICANTE'
      DataSource = DM.dsrPeca
      KeyField = 'CODFABRICANTE'
      ListField = 'NOME'
      ListSource = DM.dsrFabricante
      TabOrder = 3
    end
    object dbrOrigem: TDBRadioGroup
      Left = 511
      Top = 2
      Width = 210
      Height = 44
      Caption = ' Origem '
      Columns = 2
      DataField = 'ORIGEM'
      DataSource = DM.dsrPeca
      Items.Strings = (
        'Nacional'
        'Internacional')
      TabOrder = 2
      Values.Strings = (
        'N'
        'I')
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 107
    Width = 730
    Height = 34
    Align = alBottom
    TabOrder = 1
    object btnCancelar: TBitBtn
      Left = 628
      Top = 1
      Width = 101
      Height = 32
      Align = alRight
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Left = 527
      Top = 1
      Width = 101
      Height = 32
      Align = alRight
      Caption = '&Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object Button1: TButton
      Left = 152
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
