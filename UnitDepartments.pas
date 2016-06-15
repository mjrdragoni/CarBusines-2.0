unit UnitDepartments;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPattern, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus;

type
  TFrmDepartments = class(TFrmPattern)
    Pnldpto: TPanel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    procedure btnprintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDepartments: TFrmDepartments;

implementation

{$R *.dfm}

uses UnitDM, UnitRelDepartments;

procedure TFrmDepartments.btnprintClick(Sender: TObject);
begin
  inherited;
FrmRelDepartments.ShowModal;
end;

end.
