unit UnitProvidersSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPatternSearchString, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  Tfrmpatternseachstring1 = class(Tfrmpatternseachstring)
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
  frmpatternseachstring1: Tfrmpatternseachstring1;

implementation

{$R *.dfm}

procedure Tfrmpatternseachstring1.BitBtn2Click(Sender: TObject);
begin
  inherited;
 fdquery1.Close;
fdquery1.SQL.Clear;
fdquery1.SQL.Add('select * from clients');

if edit1.Text<> '' then
begin


fdQuery1.Open;
strSQL := 'Select * from clients '+
' where name_conpany_name like '+'''%'+edit1.text+'%'+''''+'';

  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(strSql);
  FDQuery1.Open();
end;
end;

end.
