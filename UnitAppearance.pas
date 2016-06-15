unit UnitAppearance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Themes, Vcl.Styles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmAppearance = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    FDQryUsers: TFDQuery;
    FDTable1: TFDTable;
    FDTable1appearance: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure LoadStyles;
  public
    { Public declarations }
  end;

var
  FrmAppearance: TFrmAppearance;

implementation

{$R *.dfm}

uses UnitLogin, UnitDM;

{ TForm1 }

procedure TFrmAppearance.BitBtn1Click(Sender: TObject);

begin
close;
FDQryUsers.Close;
FDTable1.Close;
end;

procedure TFrmAppearance.ComboBox1Change(Sender: TObject);
var strCurrentSQL: string;
begin
TStyleManager.TrySetStyle(ComboBox1.Items[ComboBox1.ItemIndex]);
strCurrentSQL:='SELECT * FROM users WHERE id = ' + #39 + inttostr(iduser) + #39;

      FDQryUsers.Close;
      FDQryUsers.SQL.Clear;
      FDQryUsers.SQL.Add(strCurrentSQL);
      FDQryUsers.Open();

FDQryUsers.Edit;
FDQryUsers.FieldByName('appearance').value:=  ComboBox1.Items[ComboBox1.ItemIndex];
FDQryUsers.Post;
FDQryUsers.Close;
end;

procedure TFrmAppearance.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FDTable1.Close;
FDQryUsers.Close;
end;

procedure TFrmAppearance.FormShow(Sender: TObject);
begin
LoadStyles;
end;

procedure TFrmAppearance.LoadStyles;
var styles: string;
begin
  ComboBox1.Items.BeginUpdate;
  try
    ComboBox1.Items.Clear;

    for styles in TStyleManager.StyleNames do
      ComboBox1.Items.Add(styles);

      ComboBox1.Sorted := true;
      ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(TStyleManager.ActiveStyle.Name);
  finally
    ComboBox1.Items.EndUpdate;

  end;
end;

end.
