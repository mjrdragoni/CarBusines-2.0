unit UnitSearchString;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TpesqString = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Valorcampo: TEdit;
    DBGrid1: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pesqString: TpesqString;

implementation

{$R *.dfm}

uses UnitPattern;

procedure TpesqString.BitBtn1Click(Sender: TObject);
begin
  close;
end;


procedure TpesqString.FormActivate(Sender: TObject);
begin
  pesqString.Caption:= assignment;
  valorcampo.Clear;
  valorcampo.SetFocus;
  Label1.Caption:= windowName;
end;

end.
