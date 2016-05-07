unit UnitProviders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitClients, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TFrmProviders = class(TFrmClients)
    FDTableid: TFDAutoIncField;
    FDTablecpf_cnpj: TStringField;
    FDTablename_conpany_name: TStringField;
    FDTablefantasy_name: TStringField;
    FDTableie_rg: TStringField;
    FDTableaddr: TStringField;
    FDTablecomplement: TStringField;
    FDTablecity: TStringField;
    FDTabledistrict: TStringField;
    FDTablestates: TStringField;
    FDTablezip_code: TStringField;
    FDTablephone: TStringField;
    FDTablecell: TStringField;
    FDTablecell2: TStringField;
    FDTablefax: TStringField;
    FDTableemail: TStringField;
    FDTabledate_add: TSQLTimeStampField;
    FDTabledate_alt: TSQLTimeStampField;
    FDTablestatus: TStringField;
    FDTabletp: TStringField;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProviders: TFrmProviders;

implementation

{$R *.dfm}

procedure TFrmProviders.FormActivate(Sender: TObject);
begin
  inherited;

tipocli.Clear;
tipocli.Items.Add('F');
tipocli.Items.Add('J');
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

end.
