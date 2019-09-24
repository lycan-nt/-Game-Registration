object FormConf: TFormConf
  Left = 0
  Top = 0
  Caption = 'Configura'#231#245'es'
  ClientHeight = 236
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 475
    Height = 236
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 88
    ExplicitTop = 96
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 166
      Height = 18
      Caption = 'Alterar imagen de fundo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object BtnAlterar: TButton
      Left = 180
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 0
      OnClick = BtnAlterarClick
    end
  end
  object OPFundo: TOpenPictureDialog
    Left = 408
    Top = 8
  end
end
