object frmCliente: TfrmCliente
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cliente'
  ClientHeight = 360
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 15
  object memResultado: TMemo
    Left = 0
    Top = 68
    Width = 667
    Height = 261
    Align = alClient
    Enabled = False
    TabOrder = 0
    ExplicitHeight = 252
  end
  object gbxParametrosEntrada: TGroupBox
    Left = 0
    Top = 0
    Width = 667
    Height = 68
    Align = alTop
    Caption = ' Par'#226'metros de entrada '
    TabOrder = 1
    ExplicitWidth = 624
    object lblValor: TLabel
      Left = 173
      Top = 18
      Width = 26
      Height = 15
      Caption = 'Valor'
    end
    object lblEstrutura: TLabel
      Left = 8
      Top = 18
      Width = 47
      Height = 15
      Caption = 'Estrutura'
    end
    object edtQuantidade: TEdit
      Left = 173
      Top = 35
      Width = 121
      Height = 23
      Hint = 'Informe a quantidade'
      MaxLength = 7
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyPress = edtQuantidadeKeyPress
    end
    object cboEstrutura: TComboBox
      Left = 8
      Top = 35
      Width = 159
      Height = 23
      Hint = 'Selecione a estrutura'
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 329
    Width = 667
    Height = 31
    Align = alBottom
    TabOrder = 2
    object btnPovoar: TButton
      Left = 474
      Top = 1
      Width = 96
      Height = 29
      Align = alRight
      Caption = '&Povoar'
      TabOrder = 0
      OnClick = btnPovoarClick
      ExplicitLeft = 426
      ExplicitTop = 10
      ExplicitHeight = 31
    end
    object btnLimpar: TButton
      Left = 570
      Top = 1
      Width = 96
      Height = 29
      Align = alRight
      Caption = 'Limpar'
      TabOrder = 1
      OnClick = btnLimparClick
      ExplicitLeft = 528
      ExplicitTop = 10
      ExplicitHeight = 31
    end
  end
end
