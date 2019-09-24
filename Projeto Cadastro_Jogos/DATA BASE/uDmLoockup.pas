unit uDmLoockup;

interface

uses
  System.SysUtils, System.Classes, uDM, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDmLoockup = class(TDataModule)
    FDQueryGenero: TFDQuery;
    DsGenero: TDataSource;
    FDQueryDesenvolvedor: TFDQuery;
    DsDesenvolvedor: TDataSource;
    FDQueryJogo_genero: TFDQuery;
    DsJogo_Genero: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmLoockup: TDmLoockup;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
