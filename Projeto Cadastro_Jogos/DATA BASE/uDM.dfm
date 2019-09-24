object DmDados: TDmDados
  OldCreateOrder = False
  Height = 404
  Width = 613
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=cadastro_jogos'
      'User_Name=root'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object Driver: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Projeto Cadastro_Jogos\lib\libmysql.dll'
    Left = 40
    Top = 80
  end
end
