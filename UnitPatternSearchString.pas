unit UnitPatternSearchString;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  Tfrmpatternseachstring = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    pesqstring: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    FDTable1: TFDTable;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpatternseachstring: Tfrmpatternseachstring;

implementation

{$R *.dfm}

uses UnitPattern, UnitDM;

procedure Tfrmpatternseachstring.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmpatternseachstring.BitBtn2Click(Sender: TObject);
var strsql: string;
begin

end;

procedure Tfrmpatternseachstring.FormActivate(Sender: TObject);
begin

  Edit1.text:= '';
  Edit1.SetFocus;

end;

end.
