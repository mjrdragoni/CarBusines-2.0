unit UnitClientSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  Tfrmclientsearch = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    pesqstring: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDTable1: TFDTable;
    DataSource2: TDataSource;
    FDTable1id: TFDAutoIncField;
    FDTable1cpf_cnpj: TStringField;
    FDTable1tp: TStringField;
    FDTable1name_conpany_name: TStringField;
    FDTable1fantasy_name: TStringField;
    FDTable1ie_rg: TStringField;
    FDTable1addr: TStringField;
    FDTable1complement: TStringField;
    FDTable1city: TStringField;
    FDTable1district: TStringField;
    FDTable1states: TStringField;
    FDTable1zip_code: TStringField;
    FDTable1phone: TStringField;
    FDTable1cell: TStringField;
    FDTable1cell2: TStringField;
    FDTable1fax: TStringField;
    FDTable1email: TStringField;
    FDTable1date_add: TSQLTimeStampField;
    FDTable1date_alt: TSQLTimeStampField;
    FDTable1status: TStringField;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmclientsearch: Tfrmclientsearch;

implementation

{$R *.dfm}

uses UnitPattern, UnitDM;

procedure Tfrmclientsearch.BitBtn1Click(Sender: TObject);
begin
  close;
end;



procedure Tfrmclientsearch.BitBtn2Click(Sender: TObject);
begin
if edit1.Text = '' then
edit1.setfocus
else
begin
strSQL := 'Select * from clients '+
' where name_conpany_name like '+'''%'+edit1.text+'%'+''''+'';

  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(strSql);
  FDQuery1.Open();
end;
end;

procedure Tfrmclientsearch.FormActivate(Sender: TObject);
begin
  pesqString.Caption:= assignment;
  Edit1.text:= '';
  Edit1.SetFocus;
  pesqstring.Caption:= windowName;
end;

end.
