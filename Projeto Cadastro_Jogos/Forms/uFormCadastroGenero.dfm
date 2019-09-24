inherited FormCadastroGenero: TFormCadastroGenero
  BorderIcons = []
  Caption = 'Cadastro de Genero'
  ClientHeight = 278
  ClientWidth = 732
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 748
  ExplicitHeight = 317
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 155
    Width = 62
    Height = 22
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 220
    Width = 51
    Height = 22
    Caption = 'Nome'
    FocusControl = DBEdit2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  inherited AdvToolBarPager1: TAdvToolBarPager
    Width = 732
    Caption.Caption = 'CADASTRO GENERO'
    ExplicitWidth = 732
    inherited AdvToolBarPager11: TAdvPage
      Width = 724
      ExplicitWidth = 724
    end
  end
  object DBEdit1: TDBEdit [3]
    Left = 8
    Top = 183
    Width = 62
    Height = 21
    DataField = 'id_genero'
    DataSource = DsCadastro
    TabOrder = 1
  end
  object DBEdit2: TDBEdit [4]
    Left = 8
    Top = 248
    Width = 200
    Height = 21
    DataField = 'nome'
    DataSource = DsCadastro
    TabOrder = 2
  end
  inherited FDQueryCadastro: TFDQuery
    SQL.Strings = (
      'select * from genero')
    Left = 312
    Top = 160
    object FDQueryCadastronome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      FixedChar = True
      Size = 50
    end
    object FDQueryCadastroid_genero: TFDAutoIncField
      FieldName = 'id_genero'
      Origin = 'id_genero'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  inherited DsCadastro: TDataSource
    Left = 392
    Top = 160
  end
end
