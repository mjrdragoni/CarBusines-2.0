unit UnitCars;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPattern, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, System.ImageList, Vcl.ImgList, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TFrmCars = class(TFrmPattern)
    Label5: TLabel;
    Label6: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBLookupComboBox3: TDBLookupComboBox;
    FDQueryBrands: TFDQuery;
    FDQueryProvider: TFDQuery;
    DSBrands: TDataSource;
    DSProvider: TDataSource;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    radio_new: TRadioButton;
    radio_old: TRadioButton;
    DBRadioGroup2: TDBRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DBLookupComboBox2: TDBLookupComboBox;
    labelSalesRent: TLabel;
    sales_rent: TDBEdit;
    DBCheckBox5: TDBCheckBox;
    FDQueryModel: TFDQuery;
    DSModel: TDataSource;
    DBMemo1: TDBMemo;
    Label9: TLabel;
    FDTableid: TFDAutoIncField;
    FDTableid_brand: TIntegerField;
    FDTableid_model: TIntegerField;
    FDTableid_provider: TIntegerField;
    FDTablecar_name: TStringField;
    FDTablechassis: TStringField;
    FDTableair_conditioning: TStringField;
    FDTablepower_steering: TStringField;
    FDTablepower_windows: TStringField;
    FDTableautomatic_exchange: TStringField;
    FDTableyear: TStringField;
    FDTablecolor: TStringField;
    FDTablepurchase_price: TBCDField;
    FDTableacquired: TStringField;
    FDTablesales_price: TBCDField;
    FDTablerental_price: TBCDField;
    FDTableavailability: TStringField;
    FDTableairbags: TStringField;
    FDTabledate_add: TSQLTimeStampField;
    FDTabledate_alt: TSQLTimeStampField;
    FDTablestatus: TStringField;
    FDTabledescription: TStringField;
    procedure radio_newClick(Sender: TObject);
    procedure radio_oldClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure btnaddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCars: TFrmCars;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFrmCars.btnaddClick(Sender: TObject);
begin
  inherited;
radio_new.Checked:=false;
radio_old.Checked:=false;
RadioButton1.Checked:=false;
RadioButton2.Checked:=false;
FDTable.FieldByName('air_conditioning').AsString:= 'N';
FDTable.FieldByName('power_steering').AsString := 'N';
FDTable.FieldByName('power_windows').AsString:= 'N';
FDTable.FieldByName('automatic_exchange').AsString := 'N';
FDTable.FieldByName('airbags').AsString:= 'N';

end;

procedure TFrmCars.FormActivate(Sender: TObject);
begin
  inherited;
FDQueryModel.Open();
FDQueryProvider.Open();
FDQueryBrands.Open();

end;

procedure TFrmCars.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
FDQueryModel.close();
FDQueryProvider.close();
FDQueryBrands.Close();
end;

procedure TFrmCars.RadioButton1Click(Sender: TObject);
begin
  inherited;
FDTable.FieldByName('availability').AsString:='VENDA';
labelSalesRent.Caption:= 'Val. Venda';
sales_rent.DataField:= 'sales_price';

end;

procedure TFrmCars.RadioButton2Click(Sender: TObject);
begin
  inherited;
FDTable.FieldByName('availability').AsString:='ALUGUEL';
labelSalesRent.Caption:= 'Val. Aluguel';
sales_rent.DataField:= 'rental_price';
end;

procedure TFrmCars.radio_newClick(Sender: TObject);
begin
  inherited;
FDTable.FieldByName('acquired').AsString := 'NOVO';

end;

procedure TFrmCars.radio_oldClick(Sender: TObject);
begin
  inherited;
FDTable.FieldByName('acquired').AsString := 'USADO';
end;

end.
