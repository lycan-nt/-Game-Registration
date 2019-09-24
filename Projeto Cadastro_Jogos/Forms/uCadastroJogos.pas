unit uCadastroJogos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.DBCtrls,
  AdvToolBar, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, AdvGlowButton, Vcl.ExtDlgs,
  Vcl.Imaging.pngimage, Vcl.Menus, System.ImageList, Vcl.ImgList, uDmLoockup,
  uFormGD, Vcl.Grids, Vcl.DBGrids;

type
  TFormCadastroJogos = class(TFormCadastroPai)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    OpenPictureDialog1: TOpenPictureDialog;
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    Adcionar1: TMenuItem;
    Remover1: TMenuItem;
    DBLookupComboBox2: TDBLookupComboBox;
    Label5: TLabel;
    Button1: TButton;
    DBLookupComboBox3: TDBLookupComboBox;
    Label6: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    Label7: TLabel;
    Button2: TButton;
    GroupBox1: TGroupBox;
    ImageList1: TImageList;
    Image2: TImage;
    Label8: TLabel;
    Descrição: TMemo;
    BtnSalvarD: TButton;
    BtnLimparD: TButton;
    FDQueryCadastrojogo_nome: TStringField;
    FDQueryCadastroImagen: TBlobField;
    FDQueryCadastrodata_lancamento: TDateField;
    FDQueryCadastrofk_desenvolvedor: TIntegerField;
    FDQueryCadastroid_jogo: TFDAutoIncField;
    FDQueryCadastrocaminho: TStringField;
    FDQueryCadastrofk_id_genero: TIntegerField;
    FDQueryCadastrofk_id_genero1: TIntegerField;
    FDQueryCadastrofk_id_genero2: TIntegerField;
    FDQueryCadastrodescricao: TStringField;
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure Adcionar1Click(Sender: TObject);
    procedure Remover1Click(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure BtnSalvarDClick(Sender: TObject);
    procedure DescriçãoClick(Sender: TObject);
    procedure BtnLimparDClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroJogos: TFormCadastroJogos;

implementation

{$R *.dfm}

procedure TFormCadastroJogos.Adcionar1Click(Sender: TObject);

Var
   Caminho: String;

begin
  inherited;

     {Ao carregar a imagen pela primeira vez adiciona o caminho da imagem ao banco}

     if OpenPictureDialog1.Execute then
       begin

            Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
            Caminho := OpenPictureDialog1.FileName;

            FDQueryCadastro.Edit;
            FDQueryCadastrocaminho.Value := Caminho;
            FDQueryCadastro.Post;

       end;

end;

procedure TFormCadastroJogos.AdvGlowButton1Click(Sender: TObject);
begin

     //Ao adicionar um novo desabilita os componente salvar e limpar da descrição
     BtnSalvarD.Visible := False;
     BtnLimparD.Visible := False;

     //Tras a descrição com o texto a seguir
     descrição.Text := 'Descrição';

     //Componente de data inicia com a data do dia quando clicado em novo
     DateTimePicker1.DateTime := now;

     //Ao clicar em novo abre o campo de imagem com a imagem sem foto
     OpenPictureDialog1.FileName := 'C:\Projeto Cadastro_Jogos\Imagens\Cadastro\sem-foto.jpg';
     Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);



     //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
     if FDQueryCadastrofk_id_genero1.Value > 0 then
       begin

            DBLookupComboBox3.Visible := True;
            Button2.Visible := True;

       end

       else
           begin

                DBLookupComboBox3.Visible := False;
                Button2.Visible := False;

           end;


      //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
      if FDQueryCadastrofk_id_genero2.Value > 0 then
       begin

            DBLookupComboBox4.Visible := True;


       end

       else
           begin

                DBLookupComboBox4.Visible := False;

           end;

                DBLookupComboBox3.Visible := False;
                Button2.Visible := False;

                DBLookupComboBox4.Visible := False;

  inherited;


end;

procedure TFormCadastroJogos.BtnAnteriorClick(Sender: TObject);
begin
  inherited;

     //Verifica se o jogo possui descrição e tras caso contrario vem apenas com
     //o nome descrição

     FDQueryCadastro.Open();
     FDQueryCadastro.FetchAll;

     if FDQueryCadastrodescricao.Text <> '' then
       begin

                 descrição.Text := FDQueryCadastrodescricao.Text;

       end
       else
           begin

                descrição.Text := 'Descrição';

           end;


     if FDQueryCadastrodata_lancamento.Value > 0 then
       begin

            DateTimePicker1.Date := FDQueryCadastrodata_lancamento.Value;

       end;

     if FDQueryCadastrocaminho.Value <> '' then
       begin

            OpenPictureDialog1.FileName := FDQueryCadastrocaminho.Value;
            Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

       end
       else
           if FDQueryCadastrocaminho.Value = '' then
             begin

                  OpenPictureDialog1.FileName := 'C:\Projeto Cadastro_Jogos\Imagens\Cadastro\sem-foto.jpg';
                  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

             end;

     //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
     if FDQueryCadastrofk_id_genero1.Value > 0  then
       begin

            DBLookupComboBox3.Visible := True;
            Button2.Visible := True;

       end

       else
           begin

                DBLookupComboBox3.Visible := False;
                Button2.Visible := False;

           end;


      //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
      if FDQueryCadastrofk_id_genero2.Value > 0 then
       begin

            DBLookupComboBox4.Visible := True;


       end

       else
           begin

                DBLookupComboBox4.Visible := False;

           end;

end;

procedure TFormCadastroJogos.BtnCancelarClick(Sender: TObject);
begin
  inherited;

          if FDQueryCadastrocaminho.Value <> '' then
       begin

            OpenPictureDialog1.FileName := FDQueryCadastrocaminho.Value;
            Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

       end
       else
           if FDQueryCadastrocaminho.Value = '' then
             begin

                  OpenPictureDialog1.FileName := 'C:\Projeto Cadastro_Jogos\Imagens\Cadastro\sem-foto.jpg';
                  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

             end;

     //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
     if FDQueryCadastrofk_id_genero1.Value > 0 then
       begin

            DBLookupComboBox3.Visible := True;
            Button2.Visible := True;

       end

       else
           begin

                DBLookupComboBox3.Visible := False;
                Button2.Visible := False;

           end;


      //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
      if FDQueryCadastrofk_id_genero2.Value > 0 then
       begin

            DBLookupComboBox4.Visible := True;


       end

       else
           begin

                DBLookupComboBox4.Visible := False;

           end;

end;

procedure TFormCadastroJogos.BtnLimparDClick(Sender: TObject);
begin
  inherited;

     //Ao clicar no botão limpa o memo
     descrição.Clear;


     //Limpa o campo correspondente no BD
     FDQueryCadastro.Edit;
     FDQueryCadastrodescricao.Clear;
     FDQueryCadastro.Post;

end;

procedure TFormCadastroJogos.BtnPrimeiroClick(Sender: TObject);
begin
  inherited;

     //Verifica se o jogo possui descrição e tras caso contrario vem apenas com
     //o nome descrição

     FDQueryCadastro.Open();
     FDQueryCadastro.FetchAll;

     if FDQueryCadastrodescricao.Text <> '' then
       begin

                 descrição.Text := FDQueryCadastrodescricao.Text;

       end
       else
           begin

                descrição.Text := 'Descrição';

           end;


     if FDQueryCadastrodata_lancamento.Value > 0 then
       begin

            DateTimePicker1.Date := FDQueryCadastrodata_lancamento.Value;

       end;


     if FDQueryCadastrocaminho.Value <> '' then
       begin

            OpenPictureDialog1.FileName := FDQueryCadastrocaminho.Value;
            Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

       end
          else
              if FDQueryCadastrocaminho.Value = ''  then
                begin

                     openPictureDialog1.FileName := 'C:\Projeto Cadastro_Jogos\Imagens\Cadastro\sem-foto.jpg';
                     image1.Picture.LoadFromFile(OpenPictureDialog1.Filename);

                end;

     //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
     if FDQueryCadastrofk_id_genero1.Value > 0 then
       begin

            DBLookupComboBox3.Visible := True;
            Button2.Visible := True;

       end

       else
           begin

                DBLookupComboBox3.Visible := False;
                Button2.Visible := False;

           end;


      //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
      if FDQueryCadastrofk_id_genero2.Value > 0 then
       begin

            DBLookupComboBox4.Visible := True;


       end

       else
           begin

                DBLookupComboBox4.Visible := False;

           end;

end;

procedure TFormCadastroJogos.BtnProximoClick(Sender: TObject);
begin
  inherited;

     //Verifica se o jogo possui descrição e tras caso contrario vem apenas com
     //o nome descrição

     FDQueryCadastro.Open();
     FDQueryCadastro.FetchAll;

     if FDQueryCadastrodescricao.Text <> '' then
       begin

                 descrição.Text := FDQueryCadastrodescricao.Text;

       end
       else
           begin

                descrição.Text := 'Descrição';

           end;



     if FDQueryCadastrodata_lancamento.Value > 0 then
       begin

            DateTimePicker1.Date := FDQueryCadastrodata_lancamento.Value;

       end;


     if FDQueryCadastrocaminho.Value <> '' then
       begin

            OpenPictureDialog1.FileName := FDQueryCadastrocaminho.Value;
            Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

       end
       else
           if FDQueryCadastrocaminho.Value = '' then
             begin

                  OpenPictureDialog1.FileName := 'C:\Projeto Cadastro_Jogos\Imagens\Cadastro\sem-foto.jpg';
                  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

             end;

     //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
     if FDQueryCadastrofk_id_genero1.Value > 0 then
       begin

            DBLookupComboBox3.Visible := True;
            Button2.Visible := True;

       end

       else
           begin

                DBLookupComboBox3.Visible := False;
                Button2.Visible := False;

           end;


      //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
      if FDQueryCadastrofk_id_genero2.Value > 0 then
       begin

            DBLookupComboBox4.Visible := True;


       end

       else
           begin

                DBLookupComboBox4.Visible := False;

           end;

end;

procedure TFormCadastroJogos.BtnSalvarClick(Sender: TObject);
begin


  inherited;


     //Ao clicar em salvar adiciona a dara e salva a descrição
     FDQueryCadastro.Edit;
     FDQueryCadastrodescricao.Text := descrição.Text;
     FDQueryCadastrodata_Lancamento.Value := DateTimePicker1.Date;
     FDQueryCadastro.Post;
     FDQueryCadastro.Refresh;

     //Habilita os componentes salvar e limpar da descrição
     BtnSalvarD.Visible := True;
     BtnLimparD.Visible := True;

end;

procedure TFormCadastroJogos.BtnSalvarDClick(Sender: TObject);
begin
  inherited;

     //Adiciona a descrição do memo no campo correspondente no BD
     FDQueryCadastro.Edit;
     FDQueryCadastrodescricao.Text := descrição.Text;
     FDQueryCadastro.Post;

     ShowMessage('Descrição salva com sucesso!')

end;

procedure TFormCadastroJogos.BtnUltimoClick(Sender: TObject);
begin
  inherited;


     //Verifica se o jogo possui descrição e tras caso contrario vem apenas com
     //o nome descrição

     FDQueryCadastro.Open();
     FDQueryCadastro.FetchAll;

     if FDQueryCadastrodescricao.Text <> '' then
       begin

                 descrição.Text := FDQueryCadastrodescricao.Text;

       end
       else
           begin

                descrição.Text := 'Descrição';

           end;

       //Verifica se no cadastro tem data de lançamento e traz a data no timerpicker
       if FDQueryCadastrodata_lancamento.Value > 0 then
       begin

            DateTimePicker1.Date := FDQueryCadastrodata_lancamento.Value;

       end;


       //Verifica se tem imagem no cadastro e traz par o componente image
       if FDQueryCadastrocaminho.Value <> '' then
         begin

            OpenPictureDialog1.FileName := FDQueryCadastrocaminho.Value;
            Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

         end
         else
              if FDQueryCadastrocaminho.Value = ''  then
                begin

                     openPictureDialog1.FileName := 'C:\Projeto Cadastro_Jogos\Imagens\Cadastro\sem-foto.jpg';
                     image1.Picture.LoadFromFile(OpenPictureDialog1.Filename);

                end;

     //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
     if FDQueryCadastrofk_id_genero1.Value > 0 then
       begin

            DBLookupComboBox3.Visible := True;
            Button2.Visible := True;

       end

       else
           begin

                DBLookupComboBox3.Visible := False;
                Button2.Visible := False;

           end;


      //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
      if FDQueryCadastrofk_id_genero2.Value > 0 then
       begin

            DBLookupComboBox4.Visible := True;


       end

       else
           begin

                DBLookupComboBox4.Visible := False;

           end;

end;

procedure TFormCadastroJogos.Button1Click(Sender: TObject);
begin
  inherited;

     //Evento para exibir mais um campo para genero
     Label6.Visible := True;
     DBLookupComboBox3.Visible := True;
     Button2.Visible := True;

end;

procedure TFormCadastroJogos.Button2Click(Sender: TObject);
begin
  inherited;

     Label7.Visible := True;
     DBLookupComboBox4.Visible := True;

end;

procedure TFormCadastroJogos.DescriçãoClick(Sender: TObject);
begin
  inherited;

     FDQueryCadastro.Edit;

end;

procedure TFormCadastroJogos.FormCreate(Sender: TObject);

begin


     //Verifica se o jogo possui descrição e tras caso contrario vem apenas com
     //o nome descrição

     FDQueryCadastro.Open();
     FDQueryCadastro.FetchAll;

     if FDQueryCadastrodescricao.Text <> '' then
       begin

                 descrição.Text := FDQueryCadastrodescricao.Text;

       end
       else
           begin

                descrição.Text := 'Descrição';

           end;

     FDQueryCadastro.Open;
     FDQueryCadastro.FetchAll;

     //Abre e carrega os dados da query genero para exibir o lockup no cadastro
     DmLoockup.FDQueryGenero.Open();
     DMLoockup.FDQueryGenero.FetchAll;

     DMLoockup.FDQueryGenero.Refresh;

     //Abre e carrega os dados da query desenvolvedor para exibir os dados no cadastro
     DmLoockup.FDQueryDesenvolvedor.Open();
     DmLoockup.FDQueryDesenvolvedor.FetchAll;

     DmLoockup.FDQueryDesenvolvedor.Refresh;

     //Abre e carrega todos os arquivos da query
     FDQueryCadastro.Open();
     FDQueryCadastro.FetchAll;

  inherited;


     if FDQueryCadastroCaminho.Value = '' then
       begin

            FDQueryCadastro.Edit;
            FDQueryCadastrocaminho.Value := 'C:\Projeto Cadastro_Jogos\Imagens\Cadastro\sem-foto.jpg';
            FDQueryCadastro.Post;

            OpenPictureDialog1.FileName := FDQueryCadastrocaminho.Value;
            Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

       end;


     //Carrega a imagen salva no banco de dados

      if FDQueryCadastrocaminho.Value <> '' then
       begin

            OpenPictureDialog1.FileName := FDQueryCadastrocaminho.Value;

            Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

       end;


       //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
     if FDQueryCadastrofk_id_genero1.Value > 0  then
       begin

            DBLookupComboBox3.Visible := True;
            Button2.Visible := True;

       end

       else
           begin

                DBLookupComboBox3.Visible := False;
                Button2.Visible := False;

           end;


      //Verifica se no banco de dados tem genero inserido se tiver tras o campo se não esconde
      if FDQueryCadastrofk_id_genero2.Value > 0 then
       begin

            DBLookupComboBox4.Visible := True;


       end

       else
           begin

                DBLookupComboBox4.Visible := False;

           end;


       FDQueryCadastro.Open;
       FDQueryCadastro.FetchAll;


end;

procedure TFormCadastroJogos.FormShow(Sender: TObject);
begin
  inherited;

     //Verifica se o jogo possui descrição e tras caso contrario vem apenas com
     //o nome descrição








end;

procedure TFormCadastroJogos.Image2Click(Sender: TObject);
begin
  inherited;

     FormGD := TFormGD.Create(Self);

     try

        FormGD.ShowModal;

     finally

        FreeAndNil(FormGD);

     end;


end;

procedure TFormCadastroJogos.Remover1Click(Sender: TObject);
begin
  inherited;

     FDQueryCadastro.Edit;
     FDQueryCadastrocaminho.Clear;

     OpenPictureDialog1.FileName := 'C:\Projeto Cadastro_Jogos\Imagens\Cadastro\sem-foto.jpg';
     Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

end;

end.
