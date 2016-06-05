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
    ToolButton16: TToolButton;
    btnfirst: TToolButton;
    btnprevious: TToolButton;
    btnnext: TToolButton;
    btnlast: TToolButton;
    btndel: TToolButton;
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
    FDTableWebid: TFDAutoIncField;
    FDTableWebid_client: TIntegerField;
    FDTableWebstart_date: TStringField;
    FDTableWebend_date: TStringField;
    FDTableWebstart_hour: TStringField;
    FDTableWebend_hour: TStringField;
    FDTableWebid_car: TIntegerField;
    FDTableWebstatus: TStringField;
    FDTableWebadd_date: TDateTimeField;
    DBEdit10: TDBEdit;
    FDQuery1: TFDQuery;
    FDTableid: TFDAutoIncField;
    FDTableid_client: TIntegerField;
    FDTablestart_date: TStringField;
    FDTableend_data: TStringField;
    FDTablestar_hour: TStringField;
    FDTableend_hour: TStringField;
    FDTableid_car: TIntegerField;
    FDTablestatus: TStringField;
    FDTableadd_date: TSQLTimeStampField;
    Panel1: TPanel;
    LabelStatus: TLabel;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure btnfirstClick(Sender: TObject);
    procedure btnpreviousClick(Sender: TObject);
    procedure btnnextClick(Sender: TObject);
    procedure btnlastClick(Sender: TObject);
    procedure btndelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncloseClick(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);

  private
    Frun: Trun;
    Procedure Setrun(const Value: Trun);
    { Private declarations }
  public
    Property run: Trun read Frun write Setrun;
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
      FDTableweb.Delete;

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

  FDQueryWebReserve.Open();
 FDQueryWebReserve.First;
end;

procedure TFrmWebReserve.btnlastClick(Sender: TObject);
begin
FDQueryWebReserve.Open();
FDQueryWebReserve.Last;

end;

procedure TFrmWebReserve.btnnextClick(Sender: TObject);
begin
FDQueryWebReserve.Open();
  FDQueryWebReserve.Next;

end;

procedure TFrmWebReserve.btnpreviousClick(Sender: TObject);
begin
FDQueryWebReserve.Open();
  FDQueryWebReserve.prior;


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

FDTable.insert();
FDTableid_client.Value:= strtoint(FDQuery1.Fields[0].value);
FDTableadd_date.AsDateTime:= date;

    col:= 2;
    while col < FDTableweb.Fields.Count do
    begin
    FDTable.Fields[col].Value:=  FDTableweb.Fields[col].Value;
    inc(col);
    end;

    FDTable.Post;
    FDTableWeb.Edit;
    FDTableWeb.Delete;

  post:= 'O registro foi incluido ou alterado ' +
             'com sucesso.';
  Application.MessageBox(PChar(post),
            'Informação',MB_OK+MB_ICONINFORMATION);

end;

procedure TFrmWebReserve.FormActivate(Sender: TObject);
begin
 FDQueryWebReserve.Open();
 FDTable.Open();
 FrmMainMenu.FDQueryUsers.open;
 FrmMainMenu.FDQueryUsers.close;
 run:= enablesbuttons;
end;

procedure TFrmWebReserve.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FDTable.Close;
FDQueryWebReserve.Close;
end;

procedure TFrmWebReserve.Setrun(const Value: Trun);

begin
  Frun:= value;

  case value of
    enablesbuttons:
    begin
      if FDTableWeb.RecordCount > 0 then
      begin

        btnfirst.Enabled:= true;
        btnprevious.Enabled:= true;
        btnnext.Enabled:= true;
        btnlast.Enabled:= true;
      end
      else
      begin

      end;
      btnfirst.Enabled:= True;
      btnprevious.Enabled:= True;
      btnnext.Enabled:= True;
      btnlast.Enabled:= True;

      if FDTableWeb.RecordCount = 0 then
      begin

        btndel.Enabled:= False;
        btnfirst.Enabled:= False;
        btnprevious.Enabled:= False;
        btnnext.Enabled:= False;
        btnlast.Enabled:= False;
      end
      else
      begin

        btndel.Enabled:= True;
      end;
      btnsave.Enabled:= False;

      btnclose.Enabled:= True;
    end;

     navigation:
      begin

        if FDTableWeb.Eof = true then
          begin
              btnnext.Enabled:= false;
              btnlast.Enabled:= false;
          end

            else
               begin
                btnnext.Enabled:=true;
                btnlast.enabled:=true;
               end ;

            if FDTableWeb.Bof  = true then
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
  end;
end;
end.
