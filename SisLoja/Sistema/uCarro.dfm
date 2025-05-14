object frmCarro: TfrmCarro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Carro'
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
  object pnlCarro: TPanel
    Left = 0
    Top = 0
    Width = 730
    Height = 107
    Align = alClient
    TabOrder = 0
    ExplicitTop = -5
    object lblDescicao: TLabel
      Left = 8
      Top = 6
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    object lblCor: TLabel
      Left = 511
      Top = 6
      Width = 19
      Height = 15
      Caption = 'Cor'
    end
    object lblPlaca: TLabel
      Left = 416
      Top = 6
      Width = 28
      Height = 15
      Caption = 'Placa'
    end
    object lblPotencia: TLabel
      Left = 662
      Top = 6
      Width = 46
      Height = 15
      Caption = 'Pot'#234'ncia'
    end
    object lblFornecedor: TLabel
      Left = 8
      Top = 55
      Width = 60
      Height = 15
      Caption = 'Fornecedor'
    end
    object dbeDescricao: TDBEdit
      Left = 8
      Top = 23
      Width = 402
      Height = 23
      DataField = 'DESCRICAO'
      DataSource = DM.dsrCarro
      TabOrder = 0
    end
    object dbeCor: TDBEdit
      Left = 511
      Top = 23
      Width = 146
      Height = 23
      DataField = 'COR'
      DataSource = DM.dsrCarro
      TabOrder = 2
    end
    object dbePlaca: TDBEdit
      Left = 416
      Top = 23
      Width = 89
      Height = 23
      DataField = 'PLACA'
      DataSource = DM.dsrCarro
      TabOrder = 1
    end
    object dbePotencia: TDBEdit
      Left = 662
      Top = 23
      Width = 59
      Height = 23
      DataField = 'POTENCIA'
      DataSource = DM.dsrCarro
      TabOrder = 3
    end
    object dblFornecedor: TDBLookupComboBox
      Left = 8
      Top = 72
      Width = 713
      Height = 23
      DataField = 'CODFORNECEDOR'
      DataSource = DM.dsrCarro
      KeyField = 'CODFORNECEDOR'
      ListField = 'NOME'
      ListSource = DM.dsrFornecedor
      TabOrder = 4
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 107
    Width = 730
    Height = 34
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 56
    ExplicitWidth = 729
    object btnCancelar: TBitBtn
      Left = 628
      Top = 1
      Width = 101
      Height = 32
      Align = alRight
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      ExplicitLeft = 627
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
      ExplicitLeft = 526
    end
  end
end
