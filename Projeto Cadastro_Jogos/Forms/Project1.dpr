program Project1;

uses
  Vcl.Forms,
  uMenuPrincipal in 'uMenuPrincipal.pas' {FormGame},
  uDM in '..\DATA BASE\uDM.pas' {DmDados: TDataModule},
  uFormCadastroPai in 'uFormCadastroPai.pas' {FormCadastroPai},
  uCadastroJogos in 'uCadastroJogos.pas' {FormCadastroJogos},
  uFormCadastroGenero in 'uFormCadastroGenero.pas' {FormCadastroGenero},
  uFormCadastroDesenvolvedores in 'uFormCadastroDesenvolvedores.pas' {FormCadastroDesenvolvedores},
  uDmLoockup in '..\DATA BASE\uDmLoockup.pas' {DmLoockup: TDataModule},
  uFormGD in 'uFormGD.pas' {FormGD},
  uFormLocalizarPai in 'uFormLocalizarPai.pas' {FormLocalizarPai},
  uFormLocalizarJogo in 'uFormLocalizarJogo.pas' {FormLocalizarJogo},
  uFormLocalizarGenero in 'uFormLocalizarGenero.pas' {FormLocalizarGenero},
  uFormLocalizarDesenvolvedor in 'uFormLocalizarDesenvolvedor.pas' {FormLocalizarDesenvolvedores},
  uFormConf in 'uFormConf.pas' {FormConf};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormGame, FormGame);
  Application.CreateForm(TDmDados, DmDados);
  Application.CreateForm(TDmLoockup, DmLoockup);
  Application.Run;
end.
