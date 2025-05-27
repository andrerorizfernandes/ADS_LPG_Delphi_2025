object DM: TDM
  Height = 480
  Width = 640
  object Conexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Andre Roriz\Downloads\ADS_LPG_Delphi_2025\SisL' +
        'oja\Banco dados\LOJA.FDB'
      'User_Name=SYSDBA'
      'Password=18071988'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object phyFirebird: TFDPhysFBDriverLink
    VendorLib = 
      'C:\Users\Andre Roriz\Downloads\ADS_LPG_Delphi_2025\SisLoja\Banco' +
      ' dados\fbclient.dll'
    Left = 120
    Top = 24
  end
  object qryCarro: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      
        '  c.CODCARRO, c.DESCRICAO, c.PLACA, c.COR, c.POTENCIA, c.CODFORN' +
        'ECEDOR, '
      '  f.NOME Fornecedor, f.CNPJ CnpjFornecedor'
      'FROM CARRO c'
      'INNER JOIN FORNECEDOR f ON f.CODFORNECEDOR = c.CODFORNECEDOR')
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
    object qryCarroCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Origin = 'CODFORNECEDOR'
      Required = True
    end
    object qryCarroFORNECEDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORNECEDOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryCarroCNPJFORNECEDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJFORNECEDOR'
      Origin = 'CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
  end
  object dsrCarro: TDataSource
    DataSet = qryCarro
    Left = 56
    Top = 128
  end
  object qryFornecedor: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'SELECT a.CODFORNECEDOR, a.NOME, a.CNPJ, a.DDD, a.TELEFONE, a.EMA' +
        'IL, a.ENDERECO'
      'FROM FORNECEDOR a')
    Left = 144
    Top = 104
    object qryFornecedorCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
      Origin = 'CODFORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryFornecedorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 60
    end
    object qryFornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      Size = 14
    end
    object qryFornecedorDDD: TStringField
      FieldName = 'DDD'
      Origin = 'DDD'
      Required = True
      Size = 2
    end
    object qryFornecedorTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Required = True
      Size = 9
    end
    object qryFornecedorEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 60
    end
    object qryFornecedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 100
    end
  end
  object dsrFornecedor: TDataSource
    DataSet = qryFornecedor
    Left = 152
    Top = 120
  end
  object qryPeca: TFDQuery
    FilterOptions = [foCaseInsensitive, foNoPartialCompare]
    Connection = Conexao
    SQL.Strings = (
      'select '
      '  p.CODPECA, p.DESCRICAO, p.IDENTIFICADOR, '
      '  p.ORIGEM,'
      '  case p.ORIGEM'
      '    when '#39'N'#39' then '#39'Nacional'#39
      '    when '#39'I'#39' then '#39'Internacional'#39
      '  end OrigemDescricao,'
      '  p.ATIVO, p.CODFABRICANTE,'
      '  f.NOME fabricante, c.NOME || '#39'-'#39' || c.UF cidadefabricante'
      'from peca p'
      'inner join FABRICANTE f on f.CODFABRICANTE=p.CODFABRICANTE'
      'inner join cidade c on c.CODCIDADE=f.CODCIDADE'
      'where p.ATIVO = :ATIVO'
      'order by DESCRICAO')
    Left = 240
    Top = 104
    ParamData = <
      item
        Name = 'ATIVO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryPecaCODPECA: TIntegerField
      FieldName = 'CODPECA'
      Origin = 'CODPECA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPecaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object qryPecaIDENTIFICADOR: TStringField
      FieldName = 'IDENTIFICADOR'
      Origin = 'IDENTIFICADOR'
      Required = True
      Size = 8
    end
    object qryPecaORIGEM: TStringField
      FieldName = 'ORIGEM'
      Origin = 'ORIGEM'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryPecaORIGEMDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ORIGEMDESCRICAO'
      Origin = 'ORIGEMDESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 13
    end
    object qryPecaATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryPecaCODFABRICANTE: TIntegerField
      FieldName = 'CODFABRICANTE'
      Origin = 'CODFABRICANTE'
      Required = True
    end
    object qryPecaFABRICANTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FABRICANTE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryPecaCIDADEFABRICANTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADEFABRICANTE'
      Origin = 'CIDADEFABRICANTE'
      ProviderFlags = []
      ReadOnly = True
      Size = 83
    end
  end
  object dsrPeca: TDataSource
    DataSet = qryPeca
    Left = 248
    Top = 120
  end
  object qryFabrincate: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select '
      '  f.codfabricante, f.nome, f.codcidade, c.nome cidade, c.uf '
      'from fabricante f'
      'inner join cidade c on f.codcidade=c.codcidade')
    Left = 344
    Top = 112
    object qryFabrincateCODFABRICANTE: TIntegerField
      FieldName = 'CODFABRICANTE'
      Origin = 'CODFABRICANTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFabrincateNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object qryFabrincateCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
      Origin = 'CODCIDADE'
      Required = True
    end
    object qryFabrincateCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryFabrincateUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
  end
  object dsrFabricante: TDataSource
    DataSet = qryFabrincate
    Left = 352
    Top = 128
  end
end
