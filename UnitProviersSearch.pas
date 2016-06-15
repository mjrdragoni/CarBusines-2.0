unit UnitProviersSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPatternSearchString, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  Tfrmprovidersearch = class(Tfrmpatternseachstring)
    FDTable1id: TFDAutoIncField;
    FDTable1name_conpany_name: TStringField;
    FDTable1phone: TStringField;
    FDTable1cell: TStringField;
    FDTable1email: TStringField;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprovidersearch: Tfrmprovidersearch;

implementation

{$R *.dfm}

uses UnitDM;

procedure Tfrmprovidersearch.BitBtn2Click(Sender: TObject);
 var strsql: string;
begin
if edit1.Text = '' then
edit1.setfocus
else
begin
strSQL := 'Select * from providers '+
' where name_conpany_name like '+'''%'+edit1.text+'%'+''''+'' ;

  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(strSql);
  FDQuery1.Open();
end;

end;

end.
