unit UnitReserves;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPattern, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Menus, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin;

type
  TFrmReserves = class(TFrmPattern)
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    FDQueryClients: TFDQuery;
    DSClients: TDataSource;
    FDQueryVehicles: TFDQuery;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit14: TDBEdit;
    DSVehicles: TDataSource;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    PnlItens: TPanel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    airconditioning: TCheckBox;
    airbags: TCheckBox;
    automaticexchange: TCheckBox;
    powerwindows: TCheckBox;
    powersteering: TCheckBox;
    Label8: TLabel;
    DBEdit27: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    DateTimePicker3: TDateTimePicker;
    FDTableid: TFDAutoIncField;
    FDTableid_client: TIntegerField;
    FDTablestart_date: TStringField;
    FDTableend_date: TStringField;
    FDTablestart_hour: TStringField;
    FDTableend_hour: TStringField;
    FDTableid_car: TIntegerField;
    FDTablestatus: TStringField;
    FDTabledate_add: TSQLTimeStampField;
    FDTabledate_alt: TSQLTimeStampField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit27Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReserves: TFrmReserves;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFrmReserves.BitBtn1Click(Sender: TObject);
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
    #39 +'ALUGUEL'+#39+')' ;

    FDQueryVehicles.Close;
    FDQueryVehicles.SQL.Clear;
    FDQueryVehicles.SQL.Add(strCurrentSQL);
    FDQueryVehicles.Open;
    end;

procedure TFrmReserves.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
FDTable.FieldByName('start_date').AsDateTime:= DateTimePicker1.DateTime;
end;

procedure TFrmReserves.DateTimePicker2Change(Sender: TObject);
begin
  inherited;
FDTable.FieldByName('end_date').AsDateTime:= DateTimePicker2.DateTime;
end;

procedure TFrmReserves.DateTimePicker3Change(Sender: TObject);
begin
  inherited;
FDTable.FieldByName('start_hour').AsDateTime:= DateTimePicker3.DateTime;
FDTable.FieldByName('end_hour').AsDateTime:= DateTimePicker3.DateTime;
end;

procedure TFrmReserves.DBEdit27Click(Sender: TObject);
begin
  inherited;

FDQueryVehicles.Close;
FDQueryVehicles.open;

end;

procedure TFrmReserves.FormActivate(Sender: TObject);
begin
  inherited;
FDQueryClients.Open();
FDQueryVehicles.Open();
DBEdit4.Clear;
DBEdit8.Clear;
DBEdit9.Clear;
datetimepicker1.date:= now;
datetimepicker2.date:= now;
datetimepicker3.date:= now;
end;

procedure TFrmReserves.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
FDQueryClients.Close;
FDQueryVehicles.Close;
end;




end.
