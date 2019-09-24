unit uFormLocalizarDesenvolvedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormLocalizarPai, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.ImageList, Vcl.ImgList,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, AdvToolBar,
  uFormCadastroDesenvolvedores;

type
  TFormLocalizarDesenvolvedores = class(TFormLocalizarPai)
    FDQueryLocalizarnome: TStringField;
    FDQueryLocalizarid_desenvolvedor: TFDAutoIncField;

    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure EdtLocalizaNomeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLocalizaCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }

         Procedure Filtrar;

  public
    { Public declarations }
  end;

var
  FormLocalizarDesenvolvedores: TFormLocalizarDesenvolvedores;

implementation

{$R *.dfm}

procedure TFormLocalizarDesenvolvedores.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

     FormCadastroDesenvolvedores := TFormCadastroDesenvolvedores.Create(Self);

     try

        FormCadastroDesenvolvedores.FDQueryCadastro.Locate('id_desenvolvedor', FDQueryLocalizarid_desenvolvedor.Value, []);

        FormCadastroDesenvolvedores.Show;

     finally

     end;

end;

procedure TFormLocalizarDesenvolvedores.EdtLocalizaCodigoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;

     Filtrar;

end;

procedure TFormLocalizarDesenvolvedores.EdtLocalizaNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

     Filtrar;

end;

procedure TFormLocalizarDesenvolvedores.Filtrar;
begin

     {Fecha a query, limpa e em sequida faz um select}
     FDQueryLocalizar.Close;
     FDQueryLocalizar.SQL.Clear;
     FDQueryLocalizar.SQL.Add('select * from desenvolvedor');
     FDQueryLocalizar.SQL.Add('where 1=1');

     //Se o edit for diferente de vazio faz um select que busca o id digitado
     if EdtLocalizaCodigo.Text <> '' then
       begin

            FDQueryLocalizar.SQL.Add('And id_desenvolvedor =' + QuotedStr(EdtLocalizaCodigo.Text));

       end;

     //Se o edt for diferente de vazio faz um select buscando por um conteudo
     //paracido com o digitado
     if EdtLocalizaNome.Text <> '' then
       begin

            FDQueryLocalizar.SQL.Add('And Upper(Trim(nome)) like ' + QuotedSTR(UpperCase(Trim('%'+ EdtLocalizaNome.Text +'%'))));

       end;

     //Abre e em seguida carrega todos os dados da query
     FDQueryLocalizar.Open();
     FDQueryLocalizar.FetchAll;


end;

procedure TFormLocalizarDesenvolvedores.FormShow(Sender: TObject);
begin
  inherited;

     FDQueryLocalizar.Open();
     FDQueryLocalizar.FetchAll;

end;

procedure TFormLocalizarDesenvolvedores.Image1Click(Sender: TObject);
begin
  inherited;

     Filtrar;

end;

end.


