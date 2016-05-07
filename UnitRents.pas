unit UnitRents;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPattern, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, Vcl.DBCtrls, Vcl.Mask, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids;

type
  TFrmRents = class(TFrmPattern)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    GroupBox1: TGroupBox;
    PnlItens: TPanel;
    GroupBox2: TGroupBox;
    FDQueryBrands: TFDQuery;
    DSBrands: TDataSource;
    FDQueryModel: TFDQuery;
    DSModel: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    Label3: TLabel;
    Label7: TLabel;
    FDQueryClients: TFDQuery;
    DSClients: TDataSource;
    GroupBox3: TGroupBox;
    amount_rent: TDBEdit;
    FDTableRentalItens: TFDTable;
    DSRentalItens: TDataSource;
    FDQueryOfficial: TFDQuery;
    DSOfficial: TDataSource;
    FDQueryVehicles: TFDQuery;
    DSVehicles: TDataSource;
    airconditioning: TCheckBox;
    airbags: TCheckBox;
    automaticexchange: TCheckBox;
    powerwindows: TCheckBox;
    powersteering: TCheckBox;
    FDTableid: TFDAutoIncField;
    FDTableid_client: TIntegerField;
    FDTableid_official: TIntegerField;
    FDTablestartdate: TSQLTimeStampField;
    FDTableenddate: TSQLTimeStampField;
    FDTablescheduled_time: TSQLTimeStampField;
    FDTablescheduled_day: TSQLTimeStampField;
    FDTableamount_rent: TBCDField;
    FDTabledate_add: TSQLTimeStampField;
    FDTabledate_alt: TSQLTimeStampField;
    FDTablestatus: TStringField;
    DBLookupComboBox4: TDBLookupComboBox;
    Label13: TLabel;
    Label12: TLabel;
    editdays: TDBEdit;
    Label11: TLabel;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    BtnAdcionar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnConfirma: TBitBtn;
    BtnCancelar: TBitBtn;
    btnDevolution: TButton;
    FDTableRentalItensrent_itens_id: TFDAutoIncField;
    FDTableRentalItensid_rent: TIntegerField;
    FDTableRentalItensid_car: TIntegerField;
    FDTableRentalItensid_brand: TIntegerField;
    FDTableRentalItensid_model: TIntegerField;
    FDTableRentalItensvalue_daily: TBCDField;
    FDTableRentalItensrental_days: TIntegerField;
    FDTableRentalItensamount_item: TBCDField;
    FDTableCars: TFDTable;
    DBGrid1: TDBGrid;
    FDTableRentalItensMarca: TStringField;
    FDQueryModels: TFDQuery;
    FDQueryVehiclesII: TFDQuery;
    FDTableRentalItensModelo: TStringField;
    FDTableRentalItensNomedoVeículo: TStringField;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    procedure editdaysExit(Sender: TObject);
    procedure BtnAdcionarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure btnaddClick(Sender: TObject);
    procedure FDTableid_clientValidate(Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDTableRentalItensAfterPost(DataSet: TDataSet);
    procedure FDTableRentalItensNewRecord(DataSet: TDataSet);
    procedure FDTableRentalItensAfterDelete(DataSet: TDataSet);
    procedure btnDevolutionClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure FDTableRentalItensid_carValidate(Sender: TField);
    procedure DBLookupComboBox3MouseEnter(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRents: TFrmRents;
  statuscar: string;

implementation

{$R *.dfm}

uses UnitDM;



procedure TFrmRents.BtnAdcionarClick(Sender: TObject);
begin
  inherited;
 BtnAdcionar.Enabled:= False;
  BtnExcluir.Enabled:= False;
  BtnConfirma.Enabled:= True;
  BtnCancelar.Enabled:= True;
  FDQueryVehicles.sql.Clear();
  FDQueryVehicles.Close;

  PnlItens.Enabled:= True;

  DBEdit8.SetFocus;

  FDTableRentalItens.Insert;
end;

procedure TFrmRents.btnaddClick(Sender: TObject);
begin
  inherited;
  FDTable.Post;
  FDTable.Edit;
  run:= displaysPanels;

  BtnAdcionar.Enabled:= True;
  BtnExcluir.Enabled:= False;
  BtnConfirma.Enabled:= False;
  BtnCancelar.Enabled:= False;

  PnlItens.Enabled:= False;
end;

procedure TFrmRents.BtnCancelarClick(Sender: TObject);
begin
  inherited;
 BtnAdcionar.Enabled:= true;
  BtnExcluir.Enabled:= true;
  BtnConfirma.Enabled:= false;
  BtnCancelar.Enabled:= false;

  PnlItens.Enabled:= false;


  FDTableRentalItens.Cancel;
end;

procedure TFrmRents.btncancelClick(Sender: TObject);
begin
  inherited;
FDTableRentalItens.Cancel;
end;

procedure TFrmRents.BtnConfirmaClick(Sender: TObject);
begin
  inherited;

if DBEdit8.Text = '' then
  begin
    ShowMessage('O campo [Nome do Veiculo]' +
                ' não foi preenchido');
    DBEdit8.SetFocus;
    Abort;
  end;

if DBEdit9.Text = '' then
  begin
    ShowMessage('O campo [Valor da Diária]' +
                ' não foi preenchido');
    DBEdit9.SetFocus;
    Abort;
  end;

if editdays.Text = '' then
  begin
    ShowMessage('O campo [Dias]' +
                ' não foi preenchido');
    editdays.SetFocus;
    Abort;
  end;

if DBLookupComboBox4.Text = '' then
  begin
    ShowMessage('O campo [Funcionario]' +
                ' não foi preenchido');
    DBLookupComboBox4.SetFocus;
    Abort;
  end;

  BtnAdcionar.Enabled:= True;
  BtnExcluir.Enabled:= True;
  BtnConfirma.Enabled:= False;
  BtnCancelar.Enabled:= False;

  PnlItens.Enabled:= False;

  FDTableRentalItens.Post;

end;

procedure TFrmRents.btnDevolutionClick(Sender: TObject);


begin
  inherited;
  with FDTableRentalItens do
  begin


    First;

      while not eof do
      begin
         strCurrentSQL:= 'UPDATE cars SET status = '+  #39 +'Y'+#39+
          'WHERE id= ' +#39+FDTableRentalItensid_car.AsString+#39;


         FDTableCars.ExecSQL(strCurrentSQL);

        Next;
        strCurrentSQL:='';
      end;
     

    end;



    post:= 'A Devolução dos Veículos foi Informada com Sucesso.';
  Application.MessageBox(PChar(post),
            'Informação',MB_OK+MB_ICONINFORMATION);

  run:= enablesButtons;

  //Habilita a exibição de objetos
  fieldValue.Text:= '';
  fieldValue.Enabled:= True;
  btnOk.Visible:= True;
  enablesCheck.Enabled:= False;
  PanelRecord.Enabled:= False;
  FDTable.edit;
  FDTable.FieldByName('status').AsString:='N';

  if FDTable.FieldByName('status').AsString = 'N' then
    labelStatus.Visible:= True
    else
    labelStatus.Visible:= False;
    FDTable.Post;
end;


procedure TFrmRents.BtnExcluirClick(Sender: TObject);
begin
  inherited;
 BtnAdcionar.Enabled:= true;
  BtnExcluir.Enabled:= true;
  BtnConfirma.Enabled:= false;
  BtnCancelar.Enabled:= false;

  PnlItens.Enabled:= false;

  statuscar:=DBgrid1.Columns[1].Field.AsString;

  strCurrentSQL:= 'UPDATE cars SET status = '+  #39 +'Y'+#39+
  'WHERE id= ' +#39+statuscar+#39;

    FDTableCars.ExecSQL(strCurrentSQL);


    FDTableRentalItens.Delete;
end;







procedure TFrmRents.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
FDTable.FieldByName('startdate').AsDateTime:= DateTimePicker1.DateTime;
end;

procedure TFrmRents.DateTimePicker2Change(Sender: TObject);
begin
  inherited;
FDTable.FieldByName('enddate').AsDateTime:= DateTimePicker2.DateTime;
end;

procedure TFrmRents.DBLookupComboBox3MouseEnter(Sender: TObject);
var  air_conditioning, power_steering, power_windows,automatic_exchange,
air_bags: char;

begin
  inherited;
  if airconditioning.Checked= true then
            air_conditioning:='Y'
            else    air_conditioning:='N'  ;
  if powersteering.Checked= true then
            power_steering:='Y'
            else    power_steering:='N';
  if powerwindows.Checked= true then
            power_windows:='Y'
            else    power_windows:='N';
  if automaticexchange.Checked= true then
            automatic_exchange:='Y'
            else    automatic_exchange:='N';
  if airbags.Checked= true then
            air_bags:='Y'
            else    air_bags:='N';



    strCurrentSQL:= 'SELECT rental_price, id, id_model, car_name FROM cars WHERE (air_conditioning = ' +
    #39+ air_conditioning +#39 + 'and power_steering = ' + #39+ power_steering +
    #39  + 'and power_windows = ' + #39+ power_windows + #39 +
   'and automatic_exchange = ' +  #39+ automatic_exchange+ #39 + 'and airbags = ' +
    #39 +air_bags+ #39+ 'and status = '+  #39 +'Y'+#39+ 'and availability = ' +
    #39 +'ALUGUEL'+#39+')' ;

    FDQueryVehicles.Close;
    FDQueryVehicles.SQL.Clear;
    FDQueryVehicles.SQL.Add(strCurrentSQL);
    FDQueryVehicles.Open;

end;

procedure TFrmRents.editdaysExit(Sender: TObject);

begin
  inherited;

  amount_rent.text:= floattostr(FDQueryVehicles.FieldByName('rental_price').AsFloat * strtofloat(editdays.text));

end;


procedure TFrmRents.FDTableid_clientValidate(Sender: TField);
begin
  inherited;
begin
  inherited;
  if not FDQueryClients.Locate('id',
FDTableid_client.AsString,[]) then
  begin
    MessageDlg('Cliente não encontrado',
     mtError,[mbOK],0);
    DBLookupComboBox1.SetFocus;
    Abort;
  end;
end;
end;







procedure TFrmRents.FDTableRentalItensAfterDelete(DataSet: TDataSet);
var
  Bmk: TBookmark;
  ValTot: Real;
begin
  inherited;
  with FDTableRentalItens do
  begin
    Bmk:= GetBookmark;
    DisableControls;
    try
      ValTot:= 0;
      First;
      while not eof do
      begin
        ValTot:= ValTot +  FDTableRentalItensamount_item.AsFloat;
        Next;
      end;
    finally
    EnableControls;
    if Bmk <> nil then
      begin
      GotoBookmark(bmk);
      FreeBookmark(bmk);
      end;
    end;
    if not (FDTable.State in
        [dsInsert,dsEdit]) then
    FDTable.Edit;
    FDTableamount_rent.AsFloat:=
      ValTot;
  end;
end;


procedure TFrmRents.FDTableRentalItensAfterPost(DataSet: TDataSet);
var
  Bmk: TBookmark;
  ValTot: Real;
begin
  inherited;
  with FDTableRentalItens do
  begin
    Bmk:= GetBookmark;
    DisableControls;
    try
      ValTot:= 0;
      First;
      while not eof do
      begin
        ValTot:= ValTot + FDTableRentalItensamount_item.AsFloat;
        Next;
      end;
    finally
    EnableControls;
    if Bmk <> nil then
      begin
      GotoBookmark(bmk);
      FreeBookmark(bmk);
      end;
    end;
    if not (FDTable.State in
        [dsInsert,dsEdit]) then
    FDTable.Edit;
    FDTableamount_rent.AsFloat:= ValTot;
  end;
  strCurrentSQL:= 'UPDATE cars SET status = '+  #39 +'N'+#39+
  'WHERE id= ' +#39+DBedit8.Text +#39;

    FDTableCars.ExecSQL(strCurrentSQL);

end;



procedure TFrmRents.FDTableRentalItensid_carValidate(Sender: TField);
begin
 inherited;
if not FDQueryVehicles.Locate('id',
FDTableRentalItensid_car.AsString,
[]) then
begin
  MessageDlg('Veiculo não encontrado',
  mtError,[mbOK],0);
  Abort;
end
else
begin
  FDTableRentalItensrental_days.AsInteger:= 1;
  FDTableRentalItensvalue_daily.AsFloat:=
    FDQueryVehicles.FieldByName
    ('rental_price').AsFloat;
  editdays.SetFocus;
end;

end;

procedure TFrmRents.FDTableRentalItensNewRecord(DataSet: TDataSet);
begin
  inherited;
 FDTableRentalItensid_rent.AsInteger:= FDTableid.AsInteger;
end;


procedure TFrmRents.FormActivate(Sender: TObject);
begin
 FDTable.TableName:= 'rentals';
  IDtype:= 0;

  inherited;

FDTablerentalItens.Open;
FDQueryModels.Open;
FDQueryModel.Open;
FDQueryBrands.Open;
FDQueryClients.Open;
FDQueryOfficial.Open;
FDQueryVehicles.Open;
FDQueryVehiclesII.Open;

end;

procedure TFrmRents.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

FDTableRentalItens.close();
FDQueryModel.close();
FDQueryModels.close();
FDQueryBrands.close();
FDQueryClients.close();
FDQueryOfficial.close();
FDQueryVehicles.close();
FDQueryVehiclesII.close();
end;

end.
