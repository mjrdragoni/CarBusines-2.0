unit UnitModels;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPattern, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Mask, Data.DB, FireDAC.Comp.DataSet,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TFrmModels = class(TFrmPattern)
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    FDQueryBrands: TFDQuery;
    DSBrands: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmModels: TFrmModels;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFrmModels.FormActivate(Sender: TObject);
begin
  inherited;
FDQueryBrands.Open();
end;

procedure TFrmModels.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
FDQueryBrands.close();
end;

end.
