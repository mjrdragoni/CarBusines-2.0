unit UnitExpotaImportaWeb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmExpottImport = class(TForm)
    Button1: TButton;
    FDTableWebBrand: TFDTable;
    Memo1: TMemo;
    FDTableBrand: TFDTable;
    FDTableBrandid: TFDAutoIncField;
    FDTableBrandname: TStringField;
    FDTableBranddate_add: TSQLTimeStampField;
    FDTableBranddate_alt: TSQLTimeStampField;
    FDTableBrandstatus: TStringField;
    FDTableModels: TFDTable;
    FDTableWebModels: TFDTable;
    FDTableCars: TFDTable;
    FDTableWebCars: TFDTable;
    Button2: TButton;
    Button3: TButton;
    FDTableModelsid: TFDAutoIncField;
    FDTableModelsid_brand: TIntegerField;
    FDTableModelsname: TStringField;
    FDTableModelsdate_add: TSQLTimeStampField;
    FDTableModelsdate_alt: TSQLTimeStampField;
    FDTableModelsstatus: TStringField;
    Button4: TButton;
    FDTableClients: TFDTable;
    FDTableWebClients: TFDTable;
    FDTableClientsid: TFDAutoIncField;
    FDTableClientscpf_cnpj: TStringField;
    FDTableClientstp: TStringField;
    FDTableClientsname_conpany_name: TStringField;
    FDTableClientsfantasy_name: TStringField;
    FDTableClientsie_rg: TStringField;
    FDTableClientsaddr: TStringField;
    FDTableClientscomplement: TStringField;
    FDTableClientscity: TStringField;
    FDTableClientsdistrict: TStringField;
    FDTableClientsstates: TStringField;
    FDTableClientszip_code: TStringField;
    FDTableClientsphone: TStringField;
    FDTableClientscell: TStringField;
    FDTableClientscell2: TStringField;
    FDTableClientsfax: TStringField;
    FDTableClientsemail: TStringField;
    FDTableClientsdate_add: TSQLTimeStampField;
    FDTableClientsdate_alt: TSQLTimeStampField;
    FDTableClientsstatus: TStringField;
    FDQueryClients: TFDQuery;
    FDTableWebBrandid: TIntegerField;
    FDTableWebBrandname: TStringField;
    FDTableWebBranddate_add: TDateTimeField;
    FDTableWebBranddate_alt: TDateTimeField;
    FDTableWebBrandstatus: TStringField;
    FDTableWebModelsid: TIntegerField;
    FDTableWebModelsid_brand: TIntegerField;
    FDTableWebModelsname: TStringField;
    FDTableWebModelsdate_add: TDateTimeField;
    FDTableWebModelsdate_alt: TDateTimeField;
    FDTableWebModelsstatus: TStringField;
    FDTableWebClientsid: TFDAutoIncField;
    FDTableWebClientscpf_cnpj: TStringField;
    FDTableWebClientstp: TStringField;
    FDTableWebClientsname_conpany_name: TStringField;
    FDTableWebClientsfantasy_name: TStringField;
    FDTableWebClientsie_rg: TStringField;
    FDTableWebClientsaddr: TStringField;
    FDTableWebClientscomplement: TStringField;
    FDTableWebClientscity: TStringField;
    FDTableWebClientsdistrict: TStringField;
    FDTableWebClientsstates: TStringField;
    FDTableWebClientszip_code: TStringField;
    FDTableWebClientsphone: TStringField;
    FDTableWebClientscell: TStringField;
    FDTableWebClientscell2: TStringField;
    FDTableWebClientsfax: TStringField;
    FDTableWebClientsemail: TStringField;
    FDTableWebClientsdate_add: TDateTimeField;
    FDTableWebClientsdate_alt: TDateTimeField;
    FDTableWebClientsstatus: TStringField;
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
    FDTableCarsimage1: TStringField;
    FDTableCarsimage2: TStringField;
    FDTableCarsimage3: TStringField;
    FDTableCarsimage4: TStringField;
    FDTableCarsimage5: TStringField;
    FDTableWebCarsid: TIntegerField;
    FDTableWebCarsid_brand: TIntegerField;
    FDTableWebCarsid_model: TIntegerField;
    FDTableWebCarsid_provider: TIntegerField;
    FDTableWebCarscar_name: TStringField;
    FDTableWebCarschassis: TStringField;
    FDTableWebCarsair_conditioning: TStringField;
    FDTableWebCarspower_steering: TStringField;
    FDTableWebCarspower_windows: TStringField;
    FDTableWebCarsautomatic_exchange: TStringField;
    FDTableWebCarsairbags: TStringField;
    FDTableWebCarsyear: TStringField;
    FDTableWebCarscolor: TStringField;
    FDTableWebCarspurchase_price: TBCDField;
    FDTableWebCarsacquired: TStringField;
    FDTableWebCarssales_price: TLargeintField;
    FDTableWebCarsrental_price: TLargeintField;
    FDTableWebCarsavailability: TStringField;
    FDTableWebCarsdescription: TStringField;
    FDTableWebCarsdate_add: TDateTimeField;
    FDTableWebCarsdate_alt: TDateTimeField;
    FDTableWebCarsstatus: TStringField;
    FDTableWebCarsimage1: TStringField;
    FDTableWebCarsimage2: TStringField;
    FDTableWebCarsimage3: TStringField;
    FDTableWebCarsimage4: TStringField;
    FDTableWebCarsimage5: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExpottImport: TFrmExpottImport;

implementation

{$R *.dfm}

uses UnitDM, UnitMainMenu;

procedure TFrmExpottImport.Button1Click(Sender: TObject);
var col, i: integer;
begin
  FDTableBrand.Open();
  FDTableBrand.First;
  i:= 1;

  FDTableWebBrand.Open();

  while not FDTableWebBrand.Eof do
  begin
    FDTableWebBrand.Delete;
  end;


    while not FDTableBrand.Eof do
  begin
    FDTableWebBrand.Insert;
    col:= 1;
    while col < FDTableBrand.Fields.Count do
    begin
      FDTableWebBrandid.Value:= FDTableBrandid.Value;
      FDTableWebBrand.Fields[col].Value:=  FDTableBrand.Fields[col].Value;
    inc(col);
    end;
    Memo1.Lines.Add('Exportando Marcas... registro ' +
      IntToStr(i));
    inc(I);
    FDTableWebBrand.Post;
    FDTableBrand.Next;
  end;

end;
procedure TFrmExpottImport.Button2Click(Sender: TObject);
var col, i: integer;
begin
  FDTableModels.Open();
  FDTableModels.First;
  i:= 1;

  FDTableWebModels.Open();

  while not FDTableWebModels.Eof do
  begin
    FDTableWebModels.Delete;
  end;


    while not FDTableModels.Eof do
  begin
    FDTableWebModels.Insert;
    col:= 1;
    while col < FDTableModels.Fields.Count do
    begin
      FDTableWebModelsid.Value:= FDTableModelsid.Value;
      FDTableWebModels. Fields[col].Value:=  FDTableModels.Fields[col].Value;
    inc(col);
    end;
    Memo1.Lines.Add('Exportando Modelos... registro ' +
      IntToStr(i));
    inc(I);
    FDTableWebModels.Post;
    FDTableModels.Next;
  end;

end;

procedure TFrmExpottImport.Button3Click(Sender: TObject);
var col, i: integer;
begin
  FDTableCars.Open();
  FDTableCars.First;
  i:= 1;

  FDTableWebcars.Open();

  while not FDTableWebcars.Eof do
  begin
    FDTableWebcars.Delete;
  end;


    while not FDTableCars.Eof do
  begin
    FDTableWebcars.Insert;
    col:= 1;
    while col < FDTableCars.Fields.Count do
    begin
      FDTableWebcarsid.Value:= FDTableCarsid.Value;
      FDTableWebcars. Fields[col].Value:=  FDTablecars.Fields[col].Value;
    inc(col);
    end;
    Memo1.Lines.Add('Exportando Veículos... registro ' +
      IntToStr(i));
    inc(I);
    FDTableWebcars.Post;
    FDTableCars.Next;
  end;

end;

procedure TFrmExpottImport.Button4Click(Sender: TObject);
var col, i, j,k: integer;
    sql: string;
begin
  FDTableWebClients.Open();
  FDTableWebClients.First;
  FDTableClients.Open();
  FDTableClients.First ;
  i:= 1;


 while not FDTablewebClients.eof do
   begin

   sql:= 'SELECT * FROM clients WHERE cpf_cnpj = '+#39+
     FDTableWebClientscpf_cnpj.Value +  #39;

    FDQueryCLients.Close;
    FDQueryCLients.SQL.Clear;
    FDQueryCLients.SQL.Add(sql);
    FDQueryCLients.Open();

        if FDQueryCLients. RecordCount = 0 then
         begin
            FDTableclients.Insert;
            col:= 1;
            while col < FDTablewebclients.Fields.Count do
            begin
              FDTableclients. Fields[col].Value:=  FDTableWebclients.Fields[col].Value;
            inc(col);
            end;
            Memo1.Lines.Add('Importando Clientes... registro ' + IntToStr(i));
            inc(i);
            FDTableclients.Post;
            FDTablewebClients.Next;
         end
         else
          begin
          Memo1.Lines.Add('Exportando Clientes... cliente já Cadastrado ' +  IntToStr(i));
          inc(I);
          FDTableWebClients.next;
          end;


   end;
end;


procedure TFrmExpottImport.FormActivate(Sender: TObject);
begin
FrmMainMenu.FDQueryUsers.open;
FrmMainMenu.FDQueryUsers.close;
end;

end.
