unit UnitUsers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPattern, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask, Vcl.Menus ;

type
  TFrmUsers = class(TFrmPattern)
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    Label5: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    FDTableid: TFDAutoIncField;
    FDTablelogin: TStringField;
    FDTablepass: TStringField;
    FDTableadd_data: TStringField;
    FDTablechange_data: TStringField;
    FDTabledelete_data: TStringField;
    FDTableusers: TStringField;
    FDTablesales: TStringField;
    FDTablemaint_vehicles: TStringField;
    FDTableworkshops: TStringField;
    FDTableclients: TStringField;
    FDTablecars: TStringField;
    FDTableproviders: TStringField;
    FDTablerentals: TStringField;
    FDTabledepartments: TStringField;
    FDTablepositions: TStringField;
    FDTableofficials: TStringField;
    FDTablemodels: TStringField;
    FDTablebrands: TStringField;
    FDTableexpimp: TStringField;
    FDTabledate_add: TSQLTimeStampField;
    FDTabledate_alt: TSQLTimeStampField;
    FDTablestatus: TStringField;
    FDTablereserves: TStringField;
    FDTablewebreserves: TStringField;
    FDTableappearance: TStringField;
    procedure btnaddClick(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsers: TFrmUsers;

implementation

{$R *.dfm}

uses UnitMainMenu, UnitDM, UnitRelUsers;

procedure TFrmUsers.btnaddClick(Sender: TObject);
begin
  inherited;
FDTable.FieldByName('add_data').AsString:= 'N';
FDTable.FieldByName('delete_data').AsString := 'N';
FDTable.FieldByName('change_data').AsString:= 'N';
FDTable.FieldByName('users').AsString := 'N';
FDTable.FieldByName('maint_vehicles').AsString := 'N';
FDTable.FieldByName('workshops').AsString := 'N';
FDTable.FieldByName('clients').AsString:= 'N';
FDTable.FieldByName('cars').AsString := 'N';
FDTable.FieldByName('providers').AsString := 'N';
FDTable.FieldByName('rentals').AsString := 'N';
FDTable.FieldByName('departments').AsString := 'N';
FDTable.FieldByName('positions').AsString := 'N';
FDTable.FieldByName('officials').AsString:= 'N';
FDTable.FieldByName('sales').AsString:= 'N';
FDTable.FieldByName('brands').AsString:= 'N';
FDTable.FieldByName('models').AsString:= 'N';
FDTable.FieldByName('expimp').AsString:= 'N';
FDTable.FieldByName('webreserves').AsString:= 'N';
FDTable.FieldByName('reserves').AsString:= 'N';
FDTable.FieldByName('appearance').AsString:= 'Carbon';


end;




procedure TFrmUsers.btnprintClick(Sender: TObject);
begin
  inherited;
FrmRelUsers.Showmodal;
end;

end.
