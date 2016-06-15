unit UnitRelMaint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPatternRel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxExportXLSX, frxExportDOCX, frxClass, frxExportPDF, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmRelMaint = class(TFrmPatternRel)
    Edit1: TEdit;
    Label1: TLabel;
    FDQuery2: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    procedure btnprintClick(Sender: TObject);
    procedure btncancelrelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelMaint: TFrmRelMaint;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFrmRelMaint.btncancelrelClick(Sender: TObject);
begin
  inherited;
  Edit1.Clear;
  FDQuery1.Close;
  Close;
end;

procedure TFrmRelMaint.btnprintClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;

  with FDQuery1.SQL do
  begin
    Clear;
    Add('SELECT maintenances.id, maintenances.id_workshop, maintenances.id_car, '+
    'maintenances.startdate, maintenances.enddate, maintenances.amount, maintenances.date_add, '+
    'maintenances.descripiton, cars.id AS Expr1,cars.car_name, cars.year, workshops.id AS Expr2, '+
    'workshops.conpany_name, workshops.fantasy_name '+
    'FROM maintenances INNER JOIN workshops ON maintenances.id_workshop = workshops.id INNER JOIN '+
    'cars ON maintenances.id_car = cars.id');

        if Edit1.Text <> '' then
        try
          StrToInt(Edit1.Text);
          Add('WHERE maintenances.id = ' + Edit1.Text);
        except
          on EConvertError do ;
        end;
    end;
    FDQuery1.Open();
    frxReport1.ShowReport();
end;

end.
