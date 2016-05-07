unit UnitOfficials;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPattern, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TFrmOfficials = class(TFrmPattern)
    Pnlcli: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    states: TDBComboBox;
    DBEdit7: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit16: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    FDQueryPositions: TFDQuery;
    DSPositions: TDataSource;
    FDTableid: TFDAutoIncField;
    FDTableposition_id: TIntegerField;
    FDTablecpf: TStringField;
    FDTablename: TStringField;
    FDTablerg: TStringField;
    FDTableaddr: TStringField;
    FDTablecomplement: TStringField;
    FDTablecity: TStringField;
    FDTabledistrict: TStringField;
    FDTablestates: TStringField;
    FDTablezip_code: TStringField;
    FDTablephone: TStringField;
    FDTablephone_messages: TStringField;
    FDTablecell: TStringField;
    FDTablecell2: TStringField;
    FDTablefax: TStringField;
    FDTableemail: TStringField;
    FDTabledate_add: TSQLTimeStampField;
    FDTabledate_alt: TSQLTimeStampField;
    FDTablestatus: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOfficials: TFrmOfficials;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFrmOfficials.FormActivate(Sender: TObject);
begin
  inherited;
FDQueryPositions.Open();

states.Clear;
states.Items.Add('AC');
states.Items.Add('AL');
states.Items.Add('AM');
states.Items.Add('AP');
states.Items.Add('BA');
states.Items.Add('CE');
states.Items.Add('DF');
states.Items.Add('ES');
states.Items.Add('GO');
states.Items.Add('MA');
states.Items.Add('MT');
states.Items.Add('MS');
states.Items.Add('MG');
states.Items.Add('PA');
states.Items.Add('PB');
states.Items.Add('PR');
states.Items.Add('PE');
states.Items.Add('PI');
states.Items.Add('RJ');
states.Items.Add('RN');
states.Items.Add('RS');
states.Items.Add('RO');
states.Items.Add('RR');
states.Items.Add('SC');
states.Items.Add('SP');
states.Items.Add('SE');
states.Items.Add('TO');


end;

procedure TFrmOfficials.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
FDQueryPositions.Close;
end;

end.
