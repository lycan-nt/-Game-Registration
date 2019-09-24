unit uFormCadastroDesenvolvedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, AdvGlowButton, AdvToolBar,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFormCadastroDesenvolvedores = class(TFormCadastroPai)
    FDQueryCadastronome: TStringField;
    FDQueryCadastroid_desenvolvedor: TFDAutoIncField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroDesenvolvedores: TFormCadastroDesenvolvedores;

implementation

{$R *.dfm}

procedure TFormCadastroDesenvolvedores.FormCreate(Sender: TObject);
begin
  inherited;

     //Abre a tabela e carrega todos os arquivos da mesma
     FDQueryCadastro.Open();
     FDQueryCadastro.FetchAll;


end;

end.
