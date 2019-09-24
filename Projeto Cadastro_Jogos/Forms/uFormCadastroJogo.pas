unit uFormCadastroJogo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, AdvShapeButton,
  Vcl.ExtCtrls, Vcl.DBCtrls, AdvToolBar;

type
  TFormCadastroJogo = class(TFormCadastroPai)
    FDQueryCadastroid_jogo: TIntegerField;
    FDQueryCadastronome: TStringField;
    FDQueryCadastroImagen: TBlobField;
    FDQueryCadastrodata_lancamento: TDateField;
    FDQueryCadastrofk_desenvolvedor: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroJogo: TFormCadastroJogo;

implementation

{$R *.dfm}

end.
