unit UnitCars;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPattern, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, System.ImageList, Vcl.ImgList, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtDlgs, Vcl.Menus, IdFTPCommon, IdComponent,
  IdBaseComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP;

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
    FDTableairbags: TStringField;
    FDTableyear: TStringField;
    FDTablecolor: TStringField;
    FDTablepurchase_price: TBCDField;
    FDTableacquired: TStringField;
    FDTablesales_price: TBCDField;
    FDTablerental_price: TBCDField;
    FDTableavailability: TStringField;
    FDTabledescription: TStringField;
    FDTabledate_add: TSQLTimeStampField;
    FDTabledate_alt: TSQLTimeStampField;
    FDTablestatus: TStringField;
    FDTableimage1: TStringField;
    FDTableimage2: TStringField;
    FDTableimage3: TStringField;
    FDTableimage4: TStringField;
    FDTableimage5: TStringField;
    btnim1: TButton;
    SavePictureDialog1: TSavePictureDialog;
    FDTableImages: TFDTable;
    FDTableImagesid: TFDAutoIncField;
    FDTableImagesid_car: TIntegerField;
    FDTableImagesimage1: TBlobField;
    FDTableImagesimage2: TBlobField;
    FDTableImagesimage3: TBlobField;
    FDTableImagesimage4: TBlobField;
    FDTableImagesimage5: TBlobField;
    DSImages: TDataSource;
    btnim2: TButton;
    btnim4: TButton;
    btnim5: TButton;
    Label10: TLabel;
    im1: TLabel;
    im3: TLabel;
    im4: TLabel;
    im5: TLabel;
    im2: TLabel;
    FTP: TIdFTP;
    btnim3: TBitBtn;
    FDQueryCars: TFDQuery;
    procedure radio_newClick(Sender: TObject);
    procedure radio_oldClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure btnaddClick(Sender: TObject);
    procedure btnim1Click(Sender: TObject);
    procedure btnim2Click(Sender: TObject);

    procedure btnim4Click(Sender: TObject);
    procedure btnim5Click(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
    procedure bitim3Click(Sender: TObject);
    procedure btnfirstClick(Sender: TObject);
    procedure btnpreviousClick(Sender: TObject);
    procedure btnnextClick(Sender: TObject);
    procedure btnlastClick(Sender: TObject);
    procedure btnsearchClick(Sender: TObject);

  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCars: TFrmCars;

implementation

{$R *.dfm}

uses UnitDM, UnitRelCars, UnitCarsSearch;

procedure TFrmCars.bitim3Click(Sender: TObject);
begin
  inherited;
if SavePictureDialog1.Execute then

begin

FDTableimage3.Value:= '../views/system_cars_imagens/'+ExtractFileName(SavePictureDialog1.FileName);

FTP.Connect;


  try

  FTP.Put((SavePictureDialog1.FileName));

  except
    ShowMessage('Erro ao incluir foto!');
  end;
  FTP.Disconnect;

ShowMessage('Arquivo enviado com sucesso para o Site!');
im3.Visible:=true;
btnchange.Click;


end;
end;

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

procedure TFrmCars.btnfirstClick(Sender: TObject);
begin
  inherited;
if (FDTableimage1.AsString <> '') or (FDTableimage2.AsString <> '') or
(FDTableimage3.AsString <> '') or (FDTableimage4.AsString <> '') or
(FDTableimage5.AsString <> '') then
  begin
  label10.Visible:= true;
  btnim1.Visible:= true;
  btnim2.Visible:= true;
  btnim3.Visible:= true;
  btnim4.Visible:= true;
  btnim5.Visible:= true;
  end;
 if FDTableimage1.AsString <> '' then
  begin
  im1.Visible:= true;
  end;
if FDTableimage2.AsString <> '' then
  begin
  im2.Visible:= true;

  end;
if FDTableimage3.AsString <> '' then
  begin

  im3.Visible:= true;

  end;

if FDTableimage4.AsString <> '' then
  begin

  im4.Visible:= true;

  end;
if FDTableimage5.AsString <> '' then
  begin
  im5.Visible:= true;

  end;
end;

procedure TFrmCars.btnpreviousClick(Sender: TObject);
begin
  inherited;
if (FDTableimage1.AsString <> '') or (FDTableimage2.AsString <> '') or
(FDTableimage3.AsString <> '') or (FDTableimage4.AsString <> '') or
(FDTableimage5.AsString <> '') then
  begin
  label10.Visible:= true;
  btnim1.Visible:= true;
  btnim2.Visible:= true;
  btnim3.Visible:= true;
  btnim4.Visible:= true;
  btnim5.Visible:= true;
  end;
 if FDTableimage1.AsString <> '' then
  begin
  im1.Visible:= true;
  end;
if FDTableimage2.AsString <> '' then
  begin
  im2.Visible:= true;

  end;
if FDTableimage3.AsString <> '' then
  begin

  im3.Visible:= true;

  end;

if FDTableimage4.AsString <> '' then
  begin

  im4.Visible:= true;

  end;
if FDTableimage5.AsString <> '' then
  begin
  im5.Visible:= true;

  end;
end;

procedure TFrmCars.btnprintClick(Sender: TObject);
begin
 FrmRelCars.ShowModal;

end;

procedure TFrmCars.btnsearchClick(Sender: TObject);
begin
  inherited;
frmcarsearch.showmodal;
end;

procedure TFrmCars.btnim1Click(Sender: TObject);
begin
  inherited;
if SavePictureDialog1.Execute then

begin

FDTableimage1.Value:= '../views/system_cars_imagens/'+ExtractFileName(SavePictureDialog1.FileName);

FTP.Connect;


  try

  FTP.Put((SavePictureDialog1.FileName));

  except
    ShowMessage('Erro ao incluir foto!');
  end;
  FTP.Disconnect;

ShowMessage('Arquivo enviado com sucesso para o Site!');
im1.Visible:=true;
btnchange.Click;


end;
end;


procedure TFrmCars.btnim2Click(Sender: TObject);
begin
  inherited;
if SavePictureDialog1.Execute then

begin

FDTableimage2.Value:= '../views/system_cars_imagens/'+ExtractFileName(SavePictureDialog1.FileName);

FTP.Connect;


  try

  FTP.Put((SavePictureDialog1.FileName));

  except
    ShowMessage('Erro ao incluir foto!');
  end;
  FTP.Disconnect;

ShowMessage('Arquivo enviado com sucesso para o Site!');
im2.Visible:=true;
btnchange.Click;

end;
end;

procedure TFrmCars.btnim4Click(Sender: TObject);
begin
  inherited;
if SavePictureDialog1.Execute then

begin

FDTableimage4.Value:= '../views/system_cars_imagens/'+ExtractFileName(SavePictureDialog1.FileName);

FTP.Connect;


  try

  FTP.Put((SavePictureDialog1.FileName));

  except
    ShowMessage('Erro ao incluir foto!');
  end;
  FTP.Disconnect;

ShowMessage('Arquivo enviado com sucesso para o Site!');
im4.Visible:=true;
btnchange.Click;

end;
end;

procedure TFrmCars.btnim5Click(Sender: TObject);
begin
  inherited;
if SavePictureDialog1.Execute then

begin

FDTableimage5.Value:= '../views/system_cars_imagens/'+ExtractFileName(SavePictureDialog1.FileName);

FTP.Connect;

  try

  FTP.Put((SavePictureDialog1.FileName));

  except
    ShowMessage('Erro ao incluir foto!');
  end;
  FTP.Disconnect;

ShowMessage('Arquivo enviado com sucesso para o Site!');
im5.Visible:=true;
btnchange.Click;
end;
end;

procedure TFrmCars.btnlastClick(Sender: TObject);
begin
  inherited;
if (FDTableimage1.AsString <> '') or (FDTableimage2.AsString <> '') or
(FDTableimage3.AsString <> '') or (FDTableimage4.AsString <> '') or
(FDTableimage5.AsString <> '') then
  begin
  label10.Visible:= true;
  btnim1.Visible:= true;
  btnim2.Visible:= true;
  btnim3.Visible:= true;
  btnim4.Visible:= true;
  btnim5.Visible:= true;
  end;
 if FDTableimage1.AsString <> '' then
  begin
  im1.Visible:= true;
  end;
if FDTableimage2.AsString <> '' then
  begin
  im2.Visible:= true;

  end;
if FDTableimage3.AsString <> '' then
  begin

  im3.Visible:= true;

  end;

if FDTableimage4.AsString <> '' then
  begin

  im4.Visible:= true;

  end;
if FDTableimage5.AsString <> '' then
  begin
  im5.Visible:= true;

  end;
end;

procedure TFrmCars.btnnextClick(Sender: TObject);
begin
  inherited;
if (FDTableimage1.AsString <> '') or (FDTableimage2.AsString <> '') or
(FDTableimage3.AsString <> '') or (FDTableimage4.AsString <> '') or
(FDTableimage5.AsString <> '') then
  begin
  label10.Visible:= true;
  btnim1.Visible:= true;
  btnim2.Visible:= true;
  btnim3.Visible:= true;
  btnim4.Visible:= true;
  btnim5.Visible:= true;
  end;
 if FDTableimage1.AsString <> '' then
  begin
  im1.Visible:= true;
  end;
if FDTableimage2.AsString <> '' then
  begin
  im2.Visible:= true;

  end;
if FDTableimage3.AsString <> '' then
  begin

  im3.Visible:= true;

  end;

if FDTableimage4.AsString <> '' then
  begin

  im4.Visible:= true;

  end;
if FDTableimage5.AsString <> '' then
  begin
  im5.Visible:= true;

  end;
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
btnim1.Visible:= true;
btnim2.Visible:= true;
btnim3.Visible:= true;
btnim4.Visible:= true;
btnim5.Visible:= true;
label10.Visible:= true;

end;

procedure TFrmCars.RadioButton2Click(Sender: TObject);
begin
  inherited;
FDTable.FieldByName('availability').AsString:='ALUGUEL';
labelSalesRent.Caption:= 'Val. Aluguel';
sales_rent.DataField:= 'rental_price';
btnim1.Visible:= false;
btnim2.Visible:= false;
btnim3.Visible:= false;
btnim4.Visible:= false;
btnim5.Visible:= false;
label10.Visible:= false;
im1.Visible:= false;
im2.Visible:= false;
im3.Visible:= false;
im4.Visible:= false;
im5.Visible:= false;
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
