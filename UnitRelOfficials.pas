unit UnitRelOfficials;

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
  TFrmRelOfficials = class(TFrmPatternRel)
    datade: TLabeledEdit;
    dataate: TLabeledEdit;
    frxChartObject1: TfrxChartObject;
    procedure btnprintClick(Sender: TObject);
    procedure btncancelrelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelOfficials: TFrmRelOfficials;

implementation

{$R *.dfm}

procedure TFrmRelOfficials.btncancelrelClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  Close;
end;

procedure TFrmRelOfficials.btnprintClick(Sender: TObject);
Var StrLiga: String;
    Data: TDateTime;
begin
  inherited;
    StrLiga := 'where ';
    FDQuery1.Close;
    with FDQuery1.SQL do
    begin
      Clear;
      Add('SELECT positions.position, COUNT(officials.name) AS Qtde FROM	positions INNER JOIN '+
		      'officials ON positions.id = officials.position_id ');

      if datade.Text <> '  /  /    ' then
      try
        Data:= StrToDate(datade.Text);
        Add(StrLiga+ 'officials.date_add >= '''+
        FormatDateTime('DD/MM/YYYY', Data)+'''');
        StrLiga := 'and ';
      except
        on EConvertError do
        ;
      end;
      if dataate.Text <> '  /  /    ' then
      try
        Data:= StrToDate(dataate.Text);
        Add(StrLiga+ 'officials.date_add <= '''+
        FormatDateTime('DD/MM/YYYY', Data)+'''');
      except
        on EConvertError do
        ;
      end;
      Add('GROUP BY positions.position');
      Add('ORDER BY positions.position');
end;
    FDQuery1.Open;
    frxReport1.ShowReport();
end;


end.


