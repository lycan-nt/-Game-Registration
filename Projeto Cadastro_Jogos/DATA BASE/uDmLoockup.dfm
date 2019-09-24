object DmLoockup: TDmLoockup
  OldCreateOrder = False
  Height = 324
  Width = 547
  object FDQueryGenero: TFDQuery
    Connection = DmDados.FDConnection1
    SQL.Strings = (
      'select * from genero')
    Left = 32
    Top = 16
  end
  object DsGenero: TDataSource
    DataSet = FDQueryGenero
    Left = 120
    Top = 16
  end
  object FDQueryDesenvolvedor: TFDQuery
    Connection = DmDados.FDConnection1
    SQL.Strings = (
      'select * from desenvolvedor')
    Left = 48
    Top = 96
  end
  object DsDesenvolvedor: TDataSource
    DataSet = FDQueryDesenvolvedor
    Left = 152
    Top = 96
  end
  object FDQueryJogo_genero: TFDQuery
    Connection = DmDados.FDConnection1
    SQL.Strings = (
      'select * from jogo_genero')
    Left = 272
    Top = 16
  end
  object DsJogo_Genero: TDataSource
    DataSet = FDQueryJogo_genero
    Left = 376
    Top = 16
  end
end
