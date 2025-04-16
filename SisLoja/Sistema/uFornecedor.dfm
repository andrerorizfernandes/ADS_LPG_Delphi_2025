object frmFornecedor: TfrmFornecedor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fornecedor'
  ClientHeight = 337
  ClientWidth = 950
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 15
  object pnlFornecedor: TPanel
    Left = 0
    Top = 0
    Width = 950
    Height = 303
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 729
    ExplicitHeight = 56
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 35
      Height = 15
      Caption = 'NOME'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 27
      Height = 15
      Caption = 'CNPJ'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 8
      Top = 104
      Width = 24
      Height = 15
      Caption = 'DDD'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 8
      Top = 152
      Width = 55
      Height = 15
      Caption = 'TELEFONE'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 8
      Top = 200
      Width = 34
      Height = 15
      Caption = 'EMAIL'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 8
      Top = 248
      Width = 59
      Height = 15
      Caption = 'ENDERECO'
      FocusControl = DBEdit6
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 904
      Height = 23
      DataField = 'NOME'
      DataSource = DM.dsrFornecedor
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 72
      Width = 214
      Height = 23
      DataField = 'CNPJ'
      DataSource = DM.dsrFornecedor
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 120
      Width = 34
      Height = 23
      DataField = 'DDD'
      DataSource = DM.dsrFornecedor
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 168
      Width = 139
      Height = 23
      DataField = 'TELEFONE'
      DataSource = DM.dsrFornecedor
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 8
      Top = 216
      Width = 904
      Height = 23
      DataField = 'EMAIL'
      DataSource = DM.dsrFornecedor
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 264
      Width = 921
      Height = 23
      DataField = 'ENDERECO'
      DataSource = DM.dsrFornecedor
      TabOrder = 5
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 303
    Width = 950
    Height = 34
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 56
    ExplicitWidth = 729
    object btnCancelar: TBitBtn
      Left = 848
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
      Left = 747
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
