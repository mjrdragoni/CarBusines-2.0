unit UnitPattern;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Menus;

type
    Trun = (navigation, SQLsentences, displaysPanels, disablesButtons, enablesbuttons, displaysButtons);
    TFrmPattern = class(TForm)
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    btnsearch: TToolButton;
    btnorder: TToolButton;
    btnfirst: TToolButton;
    btnprevious: TToolButton;
    btnnext: TToolButton;
    btnlast: TToolButton;
    btnadd: TToolButton;
    btnchange: TToolButton;
    btndel: TToolButton;
    btnsave: TToolButton;
    btncancel: TToolButton;
    separator1: TToolButton;
    Separator4: TToolButton;
    separator3: TToolButton;
    separator2: TToolButton;
    ToolButton16: TToolButton;
    ImageList2: TImageList;
    ImageList3: TImageList;
    btnprint: TToolButton;
    statusBar1: TstatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    fieldValue: TEdit;
    enablesCheck: TDBCheckBox;
    btnok: TBitBtn;
    Labelstatus: TLabel;
    PanelRecord: TPanel;
    FDTable: TFDTable;
    DSPattern: TDataSource;
    ToolButton1: TToolButton;
    btnclose: TToolButton;
    PopupMenu1: TPopupMenu;
    Cdigo1: TMenuItem;
    odososregistrosdessatabela1: TMenuItem;
    N1: TMenuItem;
    Registrosincludosnoperodo1: TMenuItem;
    Registrosalteradosnoperodo1: TMenuItem;
    N2: TMenuItem;
    Registrosbloqueadosparaouso1: TMenuItem;
    ImageList4: TImageList;
    procedure btnfirstClick(Sender: TObject);
    procedure btnpreviousClick(Sender: TObject);
    procedure btnnextClick(Sender: TObject);
    procedure btnlastClick(Sender: TObject);
    procedure btnaddClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
    procedure btndelClick(Sender: TObject);
    procedure btnchangeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncloseClick(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure odososregistrosdessatabela1Click(Sender: TObject);
    procedure Registrosincludosnoperodo1Click(Sender: TObject);
    procedure Cdigo1Click(Sender: TObject);
    procedure Registrosalteradosnoperodo1Click(Sender: TObject);
    procedure Registrosbloqueadosparaouso1Click(Sender: TObject);
    procedure btnsearchClick(Sender: TObject);
  private
    Frun: Trun;
    Procedure Setrun(const Value: Trun);
    { Private declarations }
  public
    Property run: Trun read Frun write Setrun;
    { Public declarations }
  end;

var
  FrmPattern: TFrmPattern;

  //Armazena a sentença SQL atual
  strCurrentSQL: String;
  //Define o tipo do campo ID
  IDType: integer;
  //Armazena a senteça SQL
  strSQL: String;
  //Define o nome da tabela em uso
  tableName: String;
  //Define operação de inclusão
  Operation_include: Integer;
  //Define as ações de inclusão, alteração e exlcusão
  editionMode: String;
  //Define o titulo da Janelas Filhas
  windowName: String;
  //Armazena datas no formato String
  valdata1, valdata2, val1, val2: String;
  //Armazena o nome de uma tarefa em Andamento
  assignment: String;
  //Contole do botão pesquisar da Janela PesqData

  assignmentlick: integer;
  //Montagem da post de informação
  post: String;


implementation

{$R *.dfm}

uses  UnitLogin, UnitMainMenu, UnitSearchDate, UnitSearchString;

procedure TFrmPattern.btnaddClick(Sender: TObject);
begin
  operation_include:= 1;

  if FDTable.Active = False then
  begin
    FDTable.Open();
  end;

  FDTable.Insert;

  //Habilita a exibição de Objetos
  fieldValue.Enabled:= False;
  btnOk.Enabled:= False;
  enablesCheck.Enabled:= False;
  labelstatus.Visible:= False;
  PanelRecord.Enabled:= True;

  //Inclusão de registro
  FDTable.FieldByName('status').AsString:= 'Y';
  FDTable.FieldByName('date_add').AsDateTime:= Date;

  //Botões e barra de status
  run:= disablesbuttons;
  statusBar1.Panels[2].Text:= 'Inclusão de novo registro';

  run:= displaysButtons;
  operation_include:= 0;
end;

procedure TFrmPattern.btncancelClick(Sender: TObject);
begin
    FDTable.Cancel;

  post:= 'A inclusão ou alteração deste ' +
             'registro foi abortada.';
  Application.MessageBox(PChar(post),
            'Atenção',MB_OK+MB_ICONERROR);

  run:= enablesbuttons;

  //Habilita a exibição de objetos
  FieldValue.Text:= '';
  FieldValue.Enabled:= True;
  btnOk.Visible:= True;
  enablescheck.Enabled:= False;
  PanelRecord.Enabled:= False;

  if FDTable.FieldByName('STATUS').AsString = 'N' then
    labelStatus.Visible:= True
    else
    labelStatus.Visible:= False;
end;

procedure TFrmPattern.btnchangeClick(Sender: TObject);
begin
  FDTable.Edit;

  //Habilita a exibição de Objetos
  fieldValue.Enabled:= False;
  btnOk.Enabled:= False;
  enablesCheck.Enabled:= True;
  PanelRecord.Enabled:= True;

  //Alteração de registro
  FDTable.FieldByName('date_alt').AsDateTime:= Date;

  //Botões e barra de status
  run:= disablesButtons;
  StatusBar1.Panels[2].Text:= 'Alterçaõ de registro';

  run:= displaysPanels;
end;

procedure TFrmPattern.btncloseClick(Sender: TObject);
begin
  FDTable.Close;
  Close;
end;

procedure TFrmPattern.btndelClick(Sender: TObject);
var confExcl: integer;
begin
  Beep;
  confExcl:= Application.MessageBox(
    'Confirma a exclusão desse registro?',
    'Atenção',
    MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

    if confExcl = IDYES then
    begin
      FDTable.Delete;

      post:= 'O registro foi excluido com sucesso.';
      Application.MessageBox(PChar(post),
                'Informação',
                MB_OK+MB_ICONINFORMATION);
    end;

    if confExcl = IDNO then
    begin
      post:= 'A exclusão desse registro foi abortada.';
      Application.MessageBox(PChar(post),
                'Informação',
                MB_OK+MB_ICONINFORMATION);
    end;

    run:= enablesButtons;
    run:= displaysPanels;
end;

procedure TFrmPattern.btnfirstClick(Sender: TObject);
begin
  FDTable.first;
  run:= navigation;
  run:= displaysPanels;
end;

procedure TFrmPattern.btnlastClick(Sender: TObject);
begin
  FDTable.Last;
  run:= navigation;
  run:= displaysPanels;
end;

procedure TFrmPattern.btnnextClick(Sender: TObject);
begin
  FDTable.next;
  run:= navigation;
  run:= displaysPanels;
end;

procedure TFrmPattern.btnokClick(Sender: TObject);
begin
   StatusBar1.Panels[2].Text:=  'Seleção de registro pelo Código';

    FDTable.Filter:= 'id = ' + #39 + fieldvalue.text    + #39;
    FDTable.Filtered:= True;

    run:= displaysPanels;
    run:= navigation;
    run:= enablesbuttons;
end;

procedure TFrmPattern.btnpreviousClick(Sender: TObject);
begin
  FDTable.prior;
  run:= navigation;
  run:= displaysPanels;

end;

procedure TFrmPattern.btnsaveClick(Sender: TObject);
begin
  FDTable.Post;

  post:= 'O registro foi incluido ou alterado ' +
             'com sucesso.';
  Application.MessageBox(PChar(post),
            'Informação',MB_OK+MB_ICONINFORMATION);

  run:= enablesButtons;

  //Habilita a exibição de objetos
  fieldValue.Text:= '';
  fieldValue.Enabled:= True;
  btnOk.Visible:= True;
  enablesCheck.Enabled:= False;
  PanelRecord.Enabled:= False;

  if FDTable.FieldByName('STATUS').AsString = 'N' then
    labelStatus.Visible:= True
    else
    labelStatus.Visible:= False;
end;

procedure TFrmPattern.btnsearchClick(Sender: TObject);
begin
pesqString.ShowModal;
end;

procedure TFrmPattern.Cdigo1Click(Sender: TObject);
begin
  fieldValue.Clear;
  fieldValue.SetFocus;
end;

procedure TFrmPattern.FormActivate(Sender: TObject);
begin


FrmMainMenu.FDQueryUsers.open;
Run:= displaysButtons;
FrmMainMenu.FDQueryUsers.close;
FDTable.Open();
run:=enablesbuttons;
panelRecord.Enabled:= false;

end;

procedure TFrmPattern.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FDTable.Close();
FrmMainMenu.FDQueryUsers.close;
end;

procedure TFrmPattern.odososregistrosdessatabela1Click(Sender: TObject);
begin
  FDTable.Filter:= '';
  FDTable.Filtered:= True;

  run:= displaysPanels;
  run:= navigation;
  run:= enablesbuttons;
end;

procedure TFrmPattern.Registrosalteradosnoperodo1Click(Sender: TObject);
begin
 assignment:= 'Pesquisa de registros alterados '+
    'no período';

  pesqData.ShowModal;


  if assignmentlick = 1 then
  begin
    StatusBar1.Panels[2].Text:=
    'Registros incluidos entre: ' + valdata1 + ' e ' + valdata2;

    //FDTabela.Filtered:= False;
    FDTable.Filter:= 'date_alt >= ' + #39 +
    FormatDateTime('DD/MM/YYY', strtodate(valdata1)) + #39 + ' AND date_alt <= ' + #39 +
    FormatDateTime('DD/MM/YYY', strtodate(valdata2))+ #39;

    FDTable.Filtered:= True;

    run:= displaysPanels;
    run:= navigation;
    run:= enablesbuttons;
  end;
end;

procedure TFrmPattern.Registrosbloqueadosparaouso1Click(Sender: TObject);
begin
 StatusBar1.Panels[2].Text:=
    'Seleção de registros bloqueados';

    FDTable.Filter:= 'status = ' + #39 + 'N'
    + #39;
    FDTable.Filtered:= True;

    run:= displaysPanels;
    run:= navigation;
    run:= enablesbuttons;
end;

procedure TFrmPattern.Registrosincludosnoperodo1Click(Sender: TObject);
begin
  assignment:= 'Pesquisa de registros incluídos '+
    'no período';

  pesqData.ShowModal;


  if assignmentlick = 1 then
  begin
    StatusBar1.Panels[2].Text:=
    'Registros incluidos entre: ' + valdata1 + ' e ' + valdata2;

    //FDTabela.Filtered:= False;
    FDTable.Filter:= 'date_add >= ' + #39 +
    FormatDateTime('DD/MM/YYY', strtodate(valdata1)) + #39 + ' AND date_add <= ' + #39 +
    FormatDateTime('DD/MM/YYY', strtodate(valdata2))+ #39;

    FDTable.Filtered:= True;

    run:= displaysPanels;
    run:= navigation;
    run:= enablesbuttons;
  end;
end;

procedure TFrmPattern.Setrun(const Value: Trun);

begin
  Frun:= value;

  case value of
    navigation:
      begin

        if FDTable.Eof = true then
          begin
              btnnext.Enabled:= false;
              btnlast.Enabled:= false;
          end

            else
               begin
                btnnext.Enabled:=true;
                btnlast.enabled:=true;
               end ;

            if FDTable.Bof then
              begin
                btnfirst.Enabled:=false;
                btnprevious.enabled:=false;
              end

              else
                 begin
                  btnfirst.Enabled:=true;
                  btnprevious.enabled:=true;
                 end;

      end;

      SQLsentences:
    begin
      FDTable.Close;
      FDTable.Open();

      if (FDTable.RecordCount = 0) and (operation_include = 0) then
      begin
        post:= 'Não foi encontrado nenhum registro que '
                 +#13 + 'satisfaça a sua pesquisa.';
        Application.MessageBox(PChar(post),
          'Informação',MB_OK+MB_ICONINFORMATION);
      end;
    end;
    //Exibe os textos nos paineis da barra de status
    displaysPanels:
    begin
      statusBar1.Panels[0].Text:= 'INC: ' +
          FDTable.FieldByName('date_add').AsString;
      statusBar1.Panels[1].Text:= 'ALT: ' +
          FDTable.FieldByName('date_alt').AsString;
      statusBar1.Panels[3].Text:=
          FDTable.FieldByName('id').AsString;

    if (FDTable.RecordCount = 0) and (operation_include = 0) then
    begin
      statusBar1.Panels[0].Text:= '';
      statusBar1.Panels[1].Text:= '';
      statusBar1.Panels[2].Text:= '';
      statusBar1.Panels[3].Text:= '';
    end;

    if FDTable.FieldByName('status').AsString = 'N' then
      labelstatus.Visible:= True
      else
      labelstatus.Visible:= False;

    end;
    //Desabilita botões ao incluir ou alterar um registro
    disablesbuttons:
    begin
      btnsearch.Enabled:= False;
      btnorder.Enabled:= False;
      btnfirst.Enabled:= False;
      btnprevious.Enabled:= False;
      btnnext.Enabled:= False;
      btnlast.Enabled:= False;
      btnadd.Enabled:= False;
      btnchange.Enabled:= False;
      btndel.Enabled:= False;
      btnsave.Enabled:= True;
      btncancel.Enabled:= True;
      btnclose.Enabled:= False;
    end;
    //Habilita botões ao Salvar ou Cancelar uma inclusão ou alteração
    enablesbuttons:
    begin
      if FDTable.RecordCount > 0 then
      begin
        btnsearch.Enabled:= True;
        btnorder.Enabled:= True;
        btnfirst.Enabled:= true;
        btnprevious.Enabled:= true;
        btnnext.Enabled:= true;
        btnlast.Enabled:= true;
      end
      else
      begin
        btnsearch.Enabled:= False;
        btnorder.Enabled:= False;
      end;
      btnfirst.Enabled:= True;
      btnprevious.Enabled:= True;
      btnnext.Enabled:= True;
      btnlast.Enabled:= True;
      btnadd.Enabled:= True;
      if FDTable.RecordCount = 0 then
      begin
        btnchange.Enabled:= False;
        btndel.Enabled:= False;
        btnfirst.Enabled:= False;
        btnprevious.Enabled:= False;
        btnnext.Enabled:= False;
        btnlast.Enabled:= False;
      end
      else
      begin
        btnchange.Enabled:= True;
        btndel.Enabled:= True;
      end;
      btnsave.Enabled:= False;
      btncancel.Enabled:= False;
      btnclose.Enabled:= True;
    end;
    //View buttons editing as User Profile
    displaysButtons:

    begin

     strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FrmMainMenu.FDQueryUsers.Close;
      FrmMainMenu.FDQueryUsers.SQL.Clear;
      FrmMainMenu.FDQueryUsers.SQL.Add(strCurrentSQL);
      FrmMainMenu.FDQueryUsers.Open();

          editionMode:=(FrmMainMenu.FDQueryUsers.FieldByName('add_data').AsString) +
            (FrmMainMenu.FDQueryUsers.FieldByName('change_data').AsString) +
            (FrmMainMenu.FDQueryUsers.FieldByName('delete_data').AsString);

       FrmMainMenu.FDQueryUsers.Close;

       if editionMode = 'NNN' then
      begin
        btnadd.Visible:= False;
        btnchange.Visible:= False;
        btndel.Visible:= False;
        btnsave.Visible:= False;
        btncancel.Visible:= False;
        separator3.Visible:= False;
        separator4.Visible:= False;
      end;

      if editionMode = 'NNY' then
      begin
        btnadd.Visible:= False;
        btnchange.Visible:= False;
        btndel.Visible:= True;
        btnsave.Visible:= False;
        btncancel.Visible:= False;
        separator3.Visible:= True;
        separator4.Visible:= False;
      end;

      if editionMode = 'NYN' then
      begin
        btnadd.Visible:= False;
        btnchange.Visible:= True;
        btndel.Visible:= False;
        btnsave.Visible:= True;
        btncancel.Visible:= True;
        btnchange.Enabled:=true;
        separator3.Visible:= True;
        separator4.Visible:= True;
      end;

      if editionMode = 'NYY' then
      begin

        btndel.Enabled:=true;
        btnadd.Visible:= False;
        btnchange.Visible:= True;
        btndel.Visible:= True;
        btnsave.Visible:= True;
        btncancel.Visible:= True;
        separator3.Visible:= True;
        separator4.Visible:= True;
      end;

      if editionMode = 'YNN' then
      begin
        btnadd.Visible:= True;
        btnchange.Visible:= False;
        btndel.Visible:= False;
        btnsave.Visible:= True;
        btncancel.Visible:= True;
        separator3.Visible:= True;
        separator4.Visible:= True;
      end;

      if editionMode = 'YNY' then
      begin

        btnadd.Visible:= True;
        btnchange.Visible:= false;
        btndel.Visible:= true;
        btnsave.Visible:= True;
        btncancel.Visible:= True;
        separator3.Visible:= True;
        separator4.Visible:= True;
      end;

      if editionMode = 'YYN' then
      begin

        btnadd.Visible:= True;
        btnchange.Visible:= true;
        btndel.Visible:= false;
        btnsave.Visible:= True;
        btncancel.Visible:= True;
        separator3.Visible:= True;
        separator4.Visible:= True;
      end;

      if editionMode = 'YYY' then
      begin

        btnadd.Visible:= True;
        btnchange.Visible:= True;
        btndel.Visible:= True;
        btnsave.Visible:= True;
        btncancel.Visible:= True;
        separator3.Visible:= True;
        separator4.Visible:= True;
      end;

    end;

  end;
end;

end.
