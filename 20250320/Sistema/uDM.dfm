object DM: TDM
  Height = 480
  Width = 640
  object Conexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Andre Roriz\Downloads\ADS_LPG_Delphi_2025\2025' +
        '0320\Banco dados\LOJA.FDB'
      'User_Name=SYSDBA'
      'Password=18071988'
      'DriverID=FB')
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object phyFirebird: TFDPhysFBDriverLink
    VendorLib = 
      'C:\Users\Andre Roriz\Downloads\ADS_LPG_Delphi_2025\20250320\Banc' +
      'o dados\fbclient.dll'
    Left = 120
    Top = 24
  end
  object qryCarro: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'SELECT c.CODCARRO, c.DESCRICAO, c.PLACA, c.COR, c.POTENCIA FROM ' +
        'CARRO c')
    Left = 40
    Top = 104
    object qryCarroCODCARRO: TIntegerField
      FieldName = 'CODCARRO'
      Origin = 'CODCARRO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCarroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object qryCarroPLACA: TStringField
      FieldName = 'PLACA'
      Origin = 'PLACA'
      Required = True
      Size = 8
    end
    object qryCarroCOR: TStringField
      FieldName = 'COR'
      Origin = 'COR'
      Required = True
    end
    object qryCarroPOTENCIA: TIntegerField
      FieldName = 'POTENCIA'
      Origin = 'POTENCIA'
      Required = True
    end
  end
  object dsrCarro: TDataSource
    DataSet = qryCarro
    Left = 56
    Top = 128
  end
end
