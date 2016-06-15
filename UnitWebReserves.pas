unit UnitWebReserves;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ToolWin;

type
 Trun = (navigation,  enablesbuttons);
  TFrmWebReserve = class(TForm)
    ToolBar1: TToolBar;
    btnsave: TToolButton;
    btnclose: TToolButton;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    FDTableWeb: TFDTable;
    FDQueryWebReserve: TFDQuery;
    DSWebReserve: TDataSource;
    PanelRecord: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    FDTable: TFDTable;
    DBEdit10: TDBEdit;
    FDQuery1: TFDQuery;
    Panel1: TPanel;
    FDTableWebid: TFDAutoIncField;
    FDTableWebid_client: TIntegerField;
    FDTableWebstart_date: TStringField;
    FDTableWebend_date: TStringField;
    FDTableWebstart_hour: TStringField;
    FDTableWebend_hour: TStringField;
    FDTableWebid_car: TIntegerField;
    FDTableWebstatus: TStringField;
    FDTableWebdate_add: TDateTimeField;
    FDTableWebdate_alt: TDateTimeField;
    Label1: TLabel;
    btnok: TBitBtn;
    Edit1: TEdit;
    ToolButton2: TToolButton;
    FDTableid: TIntegerField;
    FDTableid_client: TIntegerField;
    FDTablestart_date: TStringField;
    FDTableend_date: TStringField;
    FDTablestart_hour: TStringField;
    FDTableend_hour: TStringField;
    FDTableid_car: TIntegerField;
    FDTablestatus: TStringField;
    FDTabledate_add: TSQLTimeStampField;
    FDTabledate_alt: TSQLTimeStampField;
    labelrc: TLabel;
    FDQuery2: TFDQuery;
    procedure btnfirstClick(Sender: TObject);
    procedure btnnextClick(Sender: TObject);
    procedure btnlastClick(Sender: TObject);
    procedure btndelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncloseClick(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
    procedure btnokClick(Sender: TObject);


  private
    Frun: Trun;

    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmWebReserve: TFrmWebReserve;

    //Armazena a sentença SQL atual
  strCurrentSQL: String;


  post: String;

implementation

{$R *.dfm}

uses UnitDM, UnitMainMenu;

procedure TFrmWebReserve.btncloseClick(Sender: TObject);
begin
close;
end;

procedure TFrmWebReserve.btndelClick(Sender: TObject);
var confExcl: integer;
begin
  Beep;
  confExcl:= Application.MessageBox(
    'Confirma a exclusão desse registro?',
    'Atenção',
    MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

    if confExcl = IDYES then
    begin
      FDTableWeb.Open();
      FDTableweb.Delete;
      DBEdit1.Clear;
      DBEdit2.Clear;
      DBEdit3.Clear;
      DBEdit4.Clear;
      DBEdit5.Clear;
      DBEdit6.Clear;
      DBEdit7.Clear;
      DBEdit8.Clear;
      dBEdit9.Clear;
      DBEdit10.Clear;
      FDQueryWebReserve.Refresh;


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


end;

procedure TFrmWebReserve.btnfirstClick(Sender: TObject);
begin

  FDTableWeb.Open();
  FDQueryWebReserve.Refresh;
  FDQueryWebReserve.First;

end;

procedure TFrmWebReserve.btnlastClick(Sender: TObject);
begin
FDQueryWebReserve.Open();
FDQueryWebReserve.Refresh;
FDQueryWebReserve.Last;


end;

procedure TFrmWebReserve.btnnextClick(Sender: TObject);
begin
  FDQueryWebReserve.Open();
  FDQueryWebReserve.Refresh;
  FDQueryWebReserve.Next;

end;

procedure TFrmWebReserve.btnokClick(Sender: TObject);

begin
    labelrc.Visible:= false;
    btnsave.Enabled:= true;

strCurrentSQL:= 'SELECT reservation.*, clients.name_conpany_name, clients.cpf_cnpj, ' +
'clients.phone, clients.email, cars.id, cars.car_name,cars.rental_price ' +
'FROM reservation INNER JOIN cars ON reservation.id_car = cars.id INNER JOIN ' +
'clients ON reservation.id_client = clients.id WHERE reservation.id = '+#39+ edit1.Text +#39;

    FDQueryWebReserve.Close;
    FDQueryWebReserve.SQL.Clear;
    FDQueryWebReserve.SQL.Add(strCurrentSQL);
    FDQueryWebReserve.Open;

    if FDQueryWebReserve.FieldByName('status').Value = 'C' then
    begin
    labelrc.Visible:= true;
    btnsave.Enabled:= false;
    end;

end;



procedure TFrmWebReserve.btnsaveClick(Sender: TObject);
var col:integer;
begin
FDTableWeb.Open();
FDTable.Open();
strCurrentSQL:= 'SELECT id FROM clients WHERE cpf_cnpj = ' +#39+DBedit4.Text +#39 ;

    FDQuery1.Close;
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add(strCurrentSQL);
    FDQuery1.Open;

FDQueryWebReserve.Edit;
FDQueryWebReserve.FieldByName('status').value:= 'C';
FDQueryWebReserve.Post;

FDTable.insert();
FDTableid.Value:= strtoint(edit1.text);
FDTableid_client.Value:= strtoint(FDQuery1.Fields[0].value);


    col:= 2;
    while col < FDTableweb.Fields.Count do
    begin
    FDTable.Fields[col].Value:=  FDTableweb.Fields[col].Value;
    inc(col);
    end;
     FDTable.Post;





DBEdit1.Clear;
DBEdit2.Clear;
DBEdit3.Clear;
DBEdit4.Clear;
DBEdit5.Clear;
DBEdit6.Clear;
DBEdit7.Clear;
DBEdit8.Clear;
DBEdit9.Clear;
DBEdit10.Clear;

  post:= 'A resrva foi confirmada ' +
             'com sucesso.';
  Application.MessageBox(PChar(post),
            'Informação',MB_OK+MB_ICONINFORMATION);

end;



procedure TFrmWebReserve.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FDTable.Close;
FDQueryWebReserve.Close;
end;

end.
