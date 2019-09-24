unit uFormLocalizarGenero;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormLocalizarPai, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.ImageList, Vcl.ImgList,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, AdvToolBar,
  uFormCadastroGenero;

type
  TFormLocalizarGenero = class(TFormLocalizarPai)
    FDQueryLocalizarnome: TStringField;
    FDQueryLocalizarid_genero: TFDAutoIncField;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure EdtLocalizaNomeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLocalizaCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }

    procedure Filtrar;

  public
    { Public declarations }
  end;

var
  FormLocalizarGenero: TFormLocalizarGenero;

implementation

{$R *.dfm}

procedure TFormLocalizarGenero.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

     FormCadastroGenero := TFormCadastroGenero.Create(Self);

     try

        FormCadastroGenero.FDQueryCadastro.Locate('id_genero', FDQueryLocalizarid_genero.Value, []);

        FormCadastroGenero.Show;

     finally

     end;

end;

procedure TFormLocalizarGenero.EdtLocalizaCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

     Filtrar;

end;

procedure TFormLocalizarGenero.EdtLocalizaNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

     Filtrar;

end;

procedure TFormLocalizarGenero.Filtrar;
begin

     {Fecha limpa e iniciar o select na query}
     FDQueryLocalizar.Close;
     FDQueryLocalizar.SQL.Clear;
     FDQueryLocalizar.SQL.Add('Select * from genero');
     FDQueryLocalizar.SQL.Add('where 1=1');

     //Se o o edit for diferente de vazio inicia a consulta procurando no banco
     //o conteudo que for igual ao do edit
     if EdtLocalizaCodigo.Text <> '' then
       begin

            FDQueryLocalizar.SQL.Add('And id_genero =' + QuotedStr(EdtLocalizaCodigo.Text));

       end;

     //Se o conteudo do edit for diferente de vazio inicia a consulta no banco do
     //que for parecido com o conteudo digitado
     if EdtLocalizaNome.Text <> '' then
       begin

            FDQueryLocalizar.SQL.Add('And upper(Trim(nome)) like' + QuotedStr(UpperCase(Trim('%' + EdtLocalizaNome.Text + '%'))));

       end;

     //Abre e carrega todos os arquivos da query
     FDQueryLocalizar.Open();
     FDQueryLocalizar.FetchAll;



end;

procedure TFormLocalizarGenero.FormCreate(Sender: TObject);
begin
  inherited;

     //Abre e Localiza todos os dados da query
     FDQueryLocalizar.Open();
     FDQueryLocalizar.FetchAll;

end;

procedure TFormLocalizarGenero.Image1Click(Sender: TObject);
begin
  inherited;

     Filtrar;

end;

end.
