object frmCliente: TfrmCliente
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cliente'
  ClientHeight = 360
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 329
    Align = alTop
    TabOrder = 0
    object memResultado: TMemo
      Left = 1
      Top = 24
      Width = 622
      Height = 304
      Align = alBottom
      Enabled = False
      TabOrder = 2
    end
    object edtQuantidade: TEdit
      Left = 1
      Top = 1
      Width = 121
      Height = 23
      Align = alLeft
      MaxLength = 7
      NumbersOnly = True
      TabOrder = 0
      ExplicitLeft = 112
      ExplicitTop = 16
    end
    object cboEstrutura: TComboBox
      Left = 122
      Top = 1
      Width = 159
      Height = 23
      Align = alLeft
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'While'
      Items.Strings = (
        'While'
        'Repeat'
        'For')
    end
  end
  object btnTeste: TButton
    Left = 528
    Top = 329
    Width = 96
    Height = 31
    Align = alRight
    Caption = 'Teste'
    TabOrder = 1
    OnClick = btnTesteClick
  end
  object btnPovoar: TButton
    Left = 432
    Top = 329
    Width = 96
    Height = 31
    Align = alRight
    Caption = '&Povoar'
    TabOrder = 2
    OnClick = btnPovoarClick
  end
end
