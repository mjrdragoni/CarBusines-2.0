unit UnitCarsSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.DBCtrls, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  Tfrmcarsearch = class(TForm)
    pesqstring: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    FDTable1: TFDTable;
    FDTable1id: TFDAutoIncField;
    FDTable1car_name: TStringField;
    FDTable1year: TStringField;
    FDTable1color: TStringField;
    FDTable1acquired: TStringField;
    FDTable1sales_price: TBCDField;
    FDTable1rental_price: TBCDField;
    DataSource2: TDataSource;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    Edit4: TEdit;
    Edit2: TEdit;
    DSBrands: TDataSource;
    FDQueryBrands: TFDQuery;
    FDQueryModel: TFDQuery;
    DSModel: TDataSource;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    GroupBox3: TGroupBox;
    airconditioning: TCheckBox;
    airbags: TCheckBox;
    automaticexchange: TCheckBox;
    powerwindows: TCheckBox;
    powersteering: TCheckBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcarsearch: Tfrmcarsearch;

implementation

{$R *.dfm}

procedure Tfrmcarsearch.BitBtn1Click(Sender: TObject);
begin
close;
FDQueryBrands.Close;
FDQueryModel.Close;
end;

procedure Tfrmcarsearch.BitBtn2Click(Sender: TObject);
var strsql: string;
    air_conditioning, power_steering, power_windows,automatic_exchange,
air_bags: string;
begin
  if airconditioning.Checked= true then
            air_conditioning:='Y'
            else air_conditioning := '';
  if powersteering.Checked= true then
            power_steering:='Y'
             else power_steering := '';
  if powerwindows.Checked= true then
            power_windows:='Y'
            else power_windows := '';
  if automaticexchange.Checked= true then
            automatic_exchange:='Y'
             else automatic_exchange := '';
  if airbags.Checked= true then
            air_bags:='Y'
             else air_bags := '';
strSQL := 'SELECT car_models.name, brands.name AS brand_name, cars.* ' +
'FROM  brands INNER JOIN  car_models ON brands.id = car_models.id_brand INNER JOIN' +
' cars ON car_models.id = cars.id_model ' +
'WHERE cars.status ='  +#39 +'Y'+#39+ 'and car_models.name like '+'''%'+DBLookupComboBox2.text+'%'+''''+''+
' and color like '+'''%'+edit2.text+'%'+''''+'' + ' and year like '+'''%'+edit4.text+'%'+''''+''
+ 'and car_models.name like '+'''%'+DBLookupComboBox2.text+'%'+''''+''+
'and brands.name like '+'''%'+DBLookupComboBox5.text+'%'+''''+'' +
'and air_conditioning like '+'''%'+air_conditioning+'%'+''''+''+ 'and power_steering like '+'''%'+power_steering+'%'+''''+'' +
'and power_windows like '+'''%'+power_windows+'%'+''''+''+
'and automatic_exchange like '+'''%'+automatic_exchange+'%'+''''+''+ 'and airbags like '+'''%'+air_bags+'%'+''''+'';


  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(strSql);
  FDQuery1.Open();
  end;

procedure Tfrmcarsearch.BitBtn3Click(Sender: TObject);
begin
 DBLookupComboBox5.KeyValue:='';
end;

procedure Tfrmcarsearch.BitBtn4Click(Sender: TObject);
begin
DBLookupComboBox2.KeyValue:='';
end;

procedure Tfrmcarsearch.FormActivate(Sender: TObject);
begin
FDQueryBrands.open;
FDQueryModel.open;
  Edit4.Clear;
  Edit2.Clear;
  airconditioning.Checked:= false;
  powersteering.Checked:= false;
  powerwindows.Checked:= false;
  automaticexchange.Checked:= false;
  airbags.Checked:= false;
  DBLookupComboBox2.KeyValue:='';
  DBLookupComboBox5.KeyValue:='';
end;

end.
