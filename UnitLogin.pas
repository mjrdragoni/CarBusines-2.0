unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    passValue: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StatusBar1: TStatusBar;
    QueryLogin: TFDQuery;
    nameValue: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure nameValueEnter(Sender: TObject);
    procedure passValueEnter(Sender: TObject);
    procedure nameValueExit(Sender: TObject);
    procedure passValueExit(Sender: TObject);
    procedure UsuarioChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure passValueKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public

      { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;
  users: string;
  iduser: integer;

implementation

{$R *.dfm}

uses UnitMainMenu;

procedure TFrmLogin.BitBtn1Click(Sender: TObject);
var
  StrSqlLog, mensagem: String;
begin

  StatusBar1.Panels[0].Text:=
    'Autenticando usuário...';
  refresh;
  BitBtn1.Enabled:= False;
  nameValue.Enabled:= False;
  passValue.Enabled:= False;
  sleep(3000);

  strSqlLog:= 'SELECT * from users WHERE login = '+#39+
  nameValue.Text+
  #39 + ' and pass = ' +
  #39 + passValue.Text + #39;

  QueryLogin.Close;
  QueryLogin.SQL.Clear;
  QueryLogin.SQL.Add(strSqlLog);
  QueryLogin.Open();

  if QueryLogin.
  RecordCount = 1 then
  begin
   iduser:= QueryLogin.FieldByName('id').AsInteger;
      if (QueryLogin.FieldByName('status').AsString = 'Y') then
         begin
          Users:= nameValue.Text;
          QueryLogin.Close;
          FreeAndNil(FrmLogin); //Libera o form de Login da memória
          Application.CreateForm(TFrmMainMenu, FrmMainMenu); //Cria a janela main
          Application.Run //Roda a aplicação
          end

            else  mensagem:= 'Este usuário está bloqueado '+
                     #13 + #13 +
                    'Consulte o administrador do sistema.';

                    Application.MessageBox(PChar
                    (mensagem),
                    'Login não autorizado',
                    MB_OK+MB_IconError);





  end


  else if QueryLogin.RecordCount = 0 then
  begin
    mensagem:= 'Nome ou senha do usuário '+
    'inválidos.' + #13 + #13 +
    'Se você esqueceu sua '+
    'senha, consulte ' + #13 +
    'o administrador do sistema.';

    Application.MessageBox(PChar
    (mensagem),
    'Login não autorizado',
    MB_OK+MB_IconError);

    BitBtn1.Enabled:= True;
    nameValue.Enabled:= True;
    passValue.Enabled:= True;
    nameValue.Clear;
    passValue.Clear;
    nameValue.SetFocus;
    StatusBar1.Panels[0].Text:=
    'Login não autorizado... '+
    'Tente novamente!';
  end;


end;

procedure TFrmLogin.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;


procedure TFrmLogin.FormShow(Sender: TObject);
begin
  UsuarioChange(sender);
end;

procedure TFrmLogin.UsuarioChange(Sender: TObject);
begin
  BitBtn1.Enabled:=
  (Length(nameValue.Text) > 0) and
   (Length(passValue.Text) > 0);
end;

procedure TFrmLogin.nameValueEnter(Sender: TObject);
begin
  TEdit(sender).Color:= $00C1FFFF;
  StatusBar1.Panels[0].Text:=
   'Informe o Usuário...';
end;

procedure TFrmLogin.nameValueExit(Sender: TObject);
begin
  TEdit(sender).Color:= clWindow;
end;

procedure TFrmLogin.passValueEnter(Sender: TObject);
begin
  TEdit(sender).Color:= $00C1FFFF;
  StatusBar1.Panels[0].Text:=
   'Informe a Senha...';
end;

procedure TFrmLogin.passValueExit(Sender: TObject);
begin
  TEdit(sender).Color:= clWindow;
end;

procedure TFrmLogin.passValueKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  BitBtn1.Click;
end;

end.
