unit uFormConf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.StdCtrls, Vcl.ExtCtrls;


type
  TFormConf = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtnAlterar: TButton;
    OPFundo: TOpenPictureDialog;
    procedure BtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConf: TFormConf;

implementation

{$R *.dfm}

uses uMenuPrincipal;

procedure TFormConf.BtnAlterarClick(Sender: TObject);

begin

     if OPFundo.Execute then
       begin

            FormGame.Image1.Picture.LoadFromFile(OPFundo.FileName);

       end;

end;

end.
