unit UnitRelCars;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPatternRel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxExportXLSX, frxExportDOCX, frxClass, frxExportPDF, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls, frxChart;

type
  TFrmRelCars = class(TFrmPatternRel)
    frxChartObject1: TfrxChartObject;
    datade: TLabeledEdit;
    dataate: TLabeledEdit;
    procedure btncancelrelClick(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCars: TFrmRelCars;

implementation

{$R *.dfm}

procedure TFrmRelCars.btncancelrelClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  Close;
end;

procedure TFrmRelCars.btnprintClick(Sender: TObject);
Var StrLiga: String;
    Data: TDateTime;
begin
  inherited;
    StrLiga := 'where ';
    FDQuery1.Close;
    with FDQuery1.SQL do
    begin
      Clear;
      Add('SELECT brands.name, COUNT(cars.car_name) AS Qtde FROM '+
          'brands INNER JOIN cars ON brands.id = cars.id_brand ');

      if datade.Text <> '  /  /    ' then
      try
        Data:= StrToDate(datade.Text);
        Add(StrLiga+ 'cars.date_add >= '''+
        FormatDateTime('DD/MM/YYYY', Data)+'''');
        StrLiga := 'and ';
      except
        on EConvertError do
        ;
      end;
      if dataate.Text <> '  /  /    ' then
      try
        Data:= StrToDate(dataate.Text);
        Add(StrLiga+ 'cars.date_add <= '''+
        FormatDateTime('DD/MM/YYYY', Data)+'''');
      except
        on EConvertError do
        ;
      end;
      Add('GROUP BY brands.name');
      Add('ORDER BY brands.name');
end;
    FDQuery1.Open;
    frxReport1.ShowReport();
end;

end.
