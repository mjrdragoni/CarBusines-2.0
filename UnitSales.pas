unit UnitSales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPattern, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TFrmSales = class(TFrmPattern)
    Label2: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit7: TDBEdit;
    GroupBox1: TGroupBox;
    PnlItens: TPanel;
    Label10: TLabel;
    Label13: TLabel;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label7: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    BtnAdcionar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnConfirma: TBitBtn;
    BtnExcluir: TBitBtn;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    airconditioning: TCheckBox;
    airbags: TCheckBox;
    automaticexchange: TCheckBox;
    powerwindows: TCheckBox;
    powersteering: TCheckBox;
    FDQueryClients: TFDQuery;
    DSClients: TDataSource;
    FDQueryBrands: TFDQuery;
    DSBrands: TDataSource;
    FDQueryModel: TFDQuery;
    DSModel: TDataSource;
    FDQueryVehicles: TFDQuery;
    DSVehicles: TDataSource;
    FDQueryOfficial: TFDQuery;
    DSOfficial: TDataSource;
    FDTableid: TFDAutoIncField;
    FDTableid_client: TIntegerField;
    FDTableid_official: TIntegerField;
    FDTablevalue_sale: TBCDField;
    FDTableamount_sale: TBCDField;
    FDTabledate_add: TSQLTimeStampField;
    FDTabledate_alt: TSQLTimeStampField;
    FDTablestatus: TStringField;
    DSSalesItens: TDataSource;
    FDQueryModels: TFDQuery;
    FDQueryVehiclesII: TFDQuery;
    FDTableCars: TFDTable;
    FDTableSalesItens: TFDTable;
    a: TFDAutoIncField;
    FDTableSalesItensid_sale: TIntegerField;
    FDTableSalesItensid_car: TIntegerField;
    FDTableSalesItensid_brand: TIntegerField;
    FDTableSalesItensid_model: TIntegerField;
    FDTableSalesItensamounts_item: TBCDField;
    FDTableSalesItensMarca: TStringField;
    FDTableSalesItensModelo: TStringField;
    FDTableCarsid: TFDAutoIncField;
    FDTableCarsid_brand: TIntegerField;
    FDTableCarsid_model: TIntegerField;
    FDTableCarsid_provider: TIntegerField;
    FDTableCarscar_name: TStringField;
    FDTableCarschassis: TStringField;
    FDTableCarsair_conditioning: TStringField;
    FDTableCarspower_steering: TStringField;
    FDTableCarspower_windows: TStringField;
    FDTableCarsautomatic_exchange: TStringField;
    FDTableCarsairbags: TStringField;
    FDTableCarsyear: TStringField;
    FDTableCarscolor: TStringField;
    FDTableCarspurchase_price: TBCDField;
    FDTableCarsacquired: TStringField;
    FDTableCarssales_price: TBCDField;
    FDTableCarsrental_price: TBCDField;
    FDTableCarsavailability: TStringField;
    FDTableCarsdescription: TStringField;
    FDTableCarsdate_add: TSQLTimeStampField;
    FDTableCarsdate_alt: TSQLTimeStampField;
    FDTableCarsstatus: TStringField;
    FDTableSalesItensNomedoVeículo: TStringField;
    procedure DBLookupComboBox3MouseEnter(Sender: TObject);
    procedure FDTableSalesItensid_carValidate(Sender: TField);
    procedure BtnAdcionarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure btnaddClick(Sender: TObject);
    procedure FDTableSalesItensAfterDelete(DataSet: TDataSet);
    procedure FDTableSalesItensAfterPost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDTableSalesItensNewRecord(DataSet: TDataSet);
    procedure ToolButton2Click(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSales: TFrmSales;
  statuscar: string;

implementation

{$R *.dfm}

uses UnitDM, UnitRelSale;

procedure TFrmSales.BtnAdcionarClick(Sender: TObject);
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

  FDTableSalesItens.Insert;

end;

procedure TFrmSales.btnaddClick(Sender: TObject);
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

procedure TFrmSales.BtnCancelarClick(Sender: TObject);
begin
  inherited;
 BtnAdcionar.Enabled:= true;
  BtnExcluir.Enabled:= true;
  BtnConfirma.Enabled:= false;
  BtnCancelar.Enabled:= false;

  PnlItens.Enabled:= false;


  FDTablesalesItens.Cancel;
end;

procedure TFrmSales.BtnConfirmaClick(Sender: TObject);
begin
  if DBEdit8.Text = '' then
  begin
    ShowMessage('O campo [Nome do Veiculo]' +
                ' não foi preenchido');
    DBEdit8.SetFocus;
    Abort;
  end;

if DBEdit9.Text = '' then
  begin
    ShowMessage('O campo [Valor do Veículo]' +
                ' não foi preenchido');
    DBEdit9.SetFocus;
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

  FDTablesalesItens.Post;

end;


procedure TFrmSales.BtnExcluirClick(Sender: TObject);
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


    FDTablesalesItens.Delete;

end;





procedure TFrmSales.btnprintClick(Sender: TObject);
begin
  inherited;
  FrmRelSale.ShowModal;
end;

procedure TFrmSales.DBLookupComboBox3MouseEnter(Sender: TObject);
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



    strCurrentSQL:= 'SELECT sales_price, id, id_model, car_name FROM cars WHERE (air_conditioning = ' +
    #39+ air_conditioning +#39 + 'and power_steering = ' + #39+ power_steering +
    #39  + 'and power_windows = ' + #39+ power_windows + #39 +
   'and automatic_exchange = ' +  #39+ automatic_exchange+ #39 + 'and airbags = ' +
    #39 +air_bags+ #39+ 'and status = '+  #39 +'Y'+#39+ 'and availability = ' +
    #39 +'VENDA'+#39+')' ;

    FDQueryVehicles.Close;
    FDQueryVehicles.SQL.Clear;
    FDQueryVehicles.SQL.Add(strCurrentSQL);
    FDQueryVehicles.Open;
    end;

procedure TFrmSales.FDTableSalesItensAfterDelete(DataSet: TDataSet);
var
  Bmk: TBookmark;
  ValTot: Real;
begin
  inherited;
  with FDTableSalesItens do
  begin
    Bmk:= GetBookmark;
    DisableControls;
    try
      ValTot:= 0;
      First;
      while not eof do
      begin
        ValTot:= ValTot +  FDTableSalesItensamounts_item.AsFloat;
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
    FDTableamount_sale.AsFloat:=
      ValTot;
  end;
end;

procedure TFrmSales.FDTableSalesItensAfterPost(DataSet: TDataSet);
var
  Bmk: TBookmark;
  ValTot: Real;
begin
  inherited;
  with FDTableSalesItens do
  begin
    Bmk:= GetBookmark;
    DisableControls;
    try
      ValTot:= 0;
      First;
      while not eof do
      begin
        ValTot:= ValTot + FDTableSalesItensamounts_item.AsFloat;
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
    FDTableamount_sale.AsFloat:= ValTot;
  end;
  strCurrentSQL:= 'UPDATE cars SET status = '+  #39 +'N'+#39+
  'WHERE id= ' +#39+DBedit8.Text +#39;

    FDTableCars.ExecSQL(strCurrentSQL);

end;



procedure TFrmSales.FDTableSalesItensid_carValidate(Sender: TField);
begin
   inherited;
if not FDQueryVehicles.Locate('id', FDTableSalesItensid_car.AsString,[]) then
begin
  MessageDlg('Veiculo não encontrado',
  mtError,[mbOK],0);
  Abort;
end
else
begin

  FDTableSalesItensamounts_item.AsFloat:= FDQueryVehicles.FieldByName('sales_price').AsFloat;

end;

end;

procedure TFrmSales.FDTableSalesItensNewRecord(DataSet: TDataSet);
begin
  inherited;
FDTableSalesItensid_sale.AsInteger:= FDTableid.AsInteger;
end;

procedure TFrmSales.FormActivate(Sender: TObject);
begin
  FDTable.TableName:= 'sales';
  IDtype:= 0;

  inherited;

FDTablesalesItens.Open;
FDQueryModel.Open;
FDQueryModels.Open;
FDQueryBrands.Open;
FDQueryClients.Open;
FDQueryOfficial.Open;
FDQueryVehicles.Open;
FDQueryVehiclesII.Open;

end;

procedure TFrmSales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

FDTablesalesItens.close();
FDQueryModel.close();
FDQueryModels.close();
FDQueryBrands.close();
FDQueryClients.close();
FDQueryOfficial.close();
FDQueryVehicles.close();
FDQueryVehiclesII.close();
end;

procedure TFrmSales.ToolButton2Click(Sender: TObject);
begin
  inherited;
FrmRelSale.showmodal;
end;

end.
