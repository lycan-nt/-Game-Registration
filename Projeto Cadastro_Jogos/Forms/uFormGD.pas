unit uFormGD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormGD = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Adcionais: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGD: TFormGD;

implementation

{$R *.dfm}

end.
