unit UnitRelRents;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPatternRel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxExportXLSX, frxExportDOCX, frxClass, frxExportPDF, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls, frxGradient;

type
  TFrmRelRents = class(TFrmPatternRel)
    Label1: TLabel;
    Edit1: TEdit;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    frxGradientObject1: TfrxGradientObject;
    procedure btnprintClick(Sender: TObject);
    procedure btncancelrelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelRents: TFrmRelRents;

implementation

{$R *.dfm}

uses UnitDM, UnitRents;

procedure TFrmRelRents.btncancelrelClick(Sender: TObject);
begin
  inherited;
Edit1.Clear;
  FDQuery1.Close;
  FDQuery2.Close;
  Close;
end;

procedure TFrmRelRents.btnprintClick(Sender: TObject);
begin
 inherited;
  FDQuery1.Close;
  FDQuery2.Close;

  with FDQuery1.SQL do
  begin
    Clear;
    Add('SELECT rentals.id, rentals.id_client, rentals.id_official, ' +
     'rentals.startdate, rentals.enddate, rentals.date_add, rentals.amount_rent, '+
     'clients.id AS Expr1, clients.name_conpany_name, officials.id AS Expr2, ' +
     'officials.name ' +
     'FROM rentals INNER JOIN ' +
     'clients ON rentals.id_client = clients.id INNER JOIN ' +
     'officials ON rentals.id_official = officials.id ');

        if Edit1.Text <> '' then
        try
          StrToInt(Edit1.Text);
          Add('WHERE rentals.id = ' + Edit1.Text);
        except
          on EConvertError do ;
        end;
    end;
    FDQuery1.Open();
    FDQuery2.Open();
    frxReport1.ShowReport();
end;

end.
