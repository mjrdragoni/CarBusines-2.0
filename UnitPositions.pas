unit UnitPositions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPattern, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.DBCtrls, Vcl.Mask, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus;

type
  TFrmPositions = class(TFrmPattern)
    PanelPostion: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    FDQueryDepartments: TFDQuery;
    DSDpartments: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    FDTableid: TFDAutoIncField;
    FDTabledepartment_id: TIntegerField;
    FDTableposition: TStringField;
    FDTabledate_add: TSQLTimeStampField;
    FDTabledate_alt: TSQLTimeStampField;
    FDTablestatus: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnprintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPositions: TFrmPositions;

implementation

{$R *.dfm}

uses UnitDM, UnitRelPositions;

procedure TFrmPositions.btnprintClick(Sender: TObject);
begin
  inherited;
FrmRelPosition.showmodal;
end;

procedure TFrmPositions.FormActivate(Sender: TObject);
begin
  inherited;
FDQueryDepartments.Open();
end;

procedure TFrmPositions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
FDQueryDepartments.Close;
end;

end.
