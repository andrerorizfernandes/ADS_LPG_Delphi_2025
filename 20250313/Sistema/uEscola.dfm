object frmEscola: TfrmEscola
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sistema de escola'
  ClientHeight = 441
  ClientWidth = 763
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
  object dbgAluno: TDBGrid
    Left = 0
    Top = 0
    Width = 763
    Height = 441
    Align = alClient
    DataSource = dsrAluno
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
        FieldName = 'CODALUNO'
        Title.Caption = 'Cod.'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 370
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDADE'
        Title.Caption = 'Idade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEXO'
        Title.Caption = 'Sexo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Title.Caption = 'Cpf'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Title.Caption = 'Email'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DDD'
        Title.Caption = 'Ddd'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Title.Caption = 'Telefone'
        Width = 105
        Visible = True
      end>
  end
  object Conexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\andre\Downloads\ADS_LPG_Delphi_2025\20250313\B' +
        'ancoDados\ALUNOS.FDB'
      'User_Name=sysdba'
      'Password=18071988'
      'DriverID=FB')
    LoginPrompt = False
    Left = 104
    Top = 80
  end
  object phyDriverLink: TFDPhysFBDriverLink
    VendorLib = 
      'C:\Users\andre\Downloads\ADS_LPG_Delphi_2025\20250313\BancoDados' +
      '\fbclient.dll'
    Left = 104
    Top = 8
  end
  object qryAluno: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      
        '  a.CODALUNO, a.NOME, a.IDADE, a.SEXO, a.CPF, a.EMAIL, a.DDD, a.' +
        'TELEFONE'
      'FROM ALUNO a')
    Left = 104
    Top = 152
    object qryAlunoCODALUNO: TIntegerField
      FieldName = 'CODALUNO'
      Origin = 'CODALUNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryAlunoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 60
    end
    object qryAlunoIDADE: TIntegerField
      FieldName = 'IDADE'
      Origin = 'IDADE'
      Required = True
    end
    object qryAlunoSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Required = True
      Size = 1
    end
    object qryAlunoCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      Size = 11
    end
    object qryAlunoEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 60
    end
    object qryAlunoDDD: TStringField
      FieldName = 'DDD'
      Origin = 'DDD'
      Size = 2
    end
    object qryAlunoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 9
    end
  end
  object dsrAluno: TDataSource
    DataSet = qryAluno
    Left = 104
    Top = 224
  end
end
