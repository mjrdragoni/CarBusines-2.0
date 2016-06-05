unit UnitPatternRel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, frxExportXLSX,
  frxExportDOCX, frxClass, frxExportPDF, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmPatternRel = class(TForm)
    Panel1: TPanel;
    ImageList1: TImageList;
    ImageList3: TImageList;
    ImageList2: TImageList;
    StatusBar1: TStatusBar;
    FDQuery1: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDOCXExport1: TfrxDOCXExport;
    frxXLSXExport1: TfrxXLSXExport;
    ToolBar1: TToolBar;
    btnprint: TToolButton;
    btncancelrel: TToolButton;
    ToolButton2: TToolButton;
    procedure btncancelrelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPatternRel: TFrmPatternRel;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFrmPatternRel.btncancelrelClick(Sender: TObject);
begin
close;
end;

end.
