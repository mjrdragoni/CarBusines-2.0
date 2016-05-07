unit UnitMaintenance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPattern, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask;

type
  TFrmMaintenance = class(TFrmPattern)
    Pnlmanut: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    FDQueryWorkshops: TFDQuery;
    FDQueryCars: TFDQuery;
    DSCars: TDataSource;
    DSWorkshops: TDataSource;
    FDTableid: TFDAutoIncField;
    FDTableid_workshop: TIntegerField;
    FDTableid_car: TIntegerField;
    FDTablestartdate: TSQLTimeStampField;
    FDTableenddate: TSQLTimeStampField;
    FDTableamount: TBCDField;
    FDTableDescripiton: TStringField;
    FDTabledate_add: TSQLTimeStampField;
    FDTabledate_alt: TSQLTimeStampField;
    FDTablestatus: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMaintenance: TFrmMaintenance;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFrmMaintenance.FormActivate(Sender: TObject);
begin
  inherited;
FDQueryWorkshops.Open();
FDQueryCars.Open();
end;

procedure TFrmMaintenance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
FDQueryWorkshops.close();
FDQueryCars.close();
end;

end.
