inherited FormCadastroJogo: TFormCadastroJogo
  Caption = 'FormCadastroJogo'
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 13
  inherited FDQueryCadastro: TFDQuery
    SQL.Strings = (
      'select * from jogo')
    Left = 624
    Top = 160
    object FDQueryCadastroid_jogo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_jogo'
      Origin = 'id_jogo'
    end
    object FDQueryCadastronome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      FixedChar = True
      Size = 50
    end
    object FDQueryCadastroImagen: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'Imagen'
      Origin = 'Imagen'
    end
    object FDQueryCadastrodata_lancamento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data_lancamento'
      Origin = 'data_lancamento'
    end
    object FDQueryCadastrofk_desenvolvedor: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'fk_desenvolvedor'
      Origin = 'fk_desenvolvedor'
    end
  end
  inherited DsCadastro: TDataSource
    Left = 624
    Top = 216
  end
end
