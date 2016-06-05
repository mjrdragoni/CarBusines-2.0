unit UnitSearchDate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TpesqData = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    pesqData1: TDateTimePicker;
    pesqData2: TDateTimePicker;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pesqData: TpesqData;

implementation

{$R *.dfm}

uses UnitPattern;

procedure TpesqData.BitBtn1Click(Sender: TObject);
begin
  assignmentlick:= 0;
  Close;
end;

procedure TpesqData.BitBtn2Click(Sender: TObject);
begin
  assignmentlick:= 1;
  valData1:= DateToStr(pesqData1.Date);
  valData2:= DateToStr(pesqData2.Date);

  val1:= copy(valData1,4,2) + '/' +
         copy(valData1,1,2) + '/' +
         copy(valData1,7,4);

  val2:= copy(valData2,4,2) + '/' +
         copy(valData2,1,2) + '/' +
         copy(valData2,7,4);
  close;
end;

procedure TpesqData.FormActivate(Sender: TObject);
begin
  pesqData.Caption:= assignment;
  Label1.Caption:= windowName;
  pesqData1.Date:= Date;
  pesqData2.Date:= Date;
  pesqData1.SetFocus;
end;

end.
