unit uFormLocalizarPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, AdvToolBar,
  Vcl.Imaging.pngimage;

type
  TFormLocalizarPai = class(TForm)
    AdvToolBarPager1: TAdvToolBarPager;
    AdvToolBarPager11: TAdvPage;
    DBGrid1: TDBGrid;
    FDQueryLocalizar: TFDQuery;
    DsLocalizar: TDataSource;
    EdtLocalizaCodigo: TEdit;
    Label1: TLabel;
    EdtLocalizaNome: TEdit;
    Label2: TLabel;
    ImageList1: TImageList;
    Image1: TImage;
    procedure EdtLocalizaCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLocalizarPai: TFormLocalizarPai;

implementation

{$R *.dfm}

procedure TFormLocalizarPai.EdtLocalizaCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin

     //Faz uma valida��o para que o campo c�gido s� aceite numeros
     if not (Key in ['0'..'9', #13, #08] ) then  //#13 = ENTER , #08 = BACKSPACE
       begin

            ShowMessage('Aten��o! Digite apenas numeros.');
            Key := #0;

       end;

end;

procedure TFormLocalizarPai.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

     //Libera o formulario da memoria apos ser fechado
     Action := caFree;

end;

end.
