unit UnitClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPattern, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus;

type
  TFrmClients = class(TFrmPattern)
    Pnlcli: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    tipocli: TDBComboBox;
    states: TDBComboBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit16: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure btnchangeClick(Sender: TObject);
    procedure btnaddClick(Sender: TObject);
    procedure tipocliExit(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
    procedure btnsearchClick(Sender: TObject);
    procedure DBEdit8Change(Sender: TObject);
    procedure DBEdit11Change(Sender: TObject);
    procedure DBEdit12Change(Sender: TObject);
    procedure DBEdit10Change(Sender: TObject);
    procedure DBEdit16Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClients: TFrmClients;

implementation

{$R *.dfm}

uses UnitDM, UnitRelClients, UnitClientSearch;

procedure TFrmClients.btnaddClick(Sender: TObject);
begin
  inherited;
tipocli.Enabled:= true;
end;

procedure TFrmClients.btnchangeClick(Sender: TObject);
begin
  inherited;
tipocli.Enabled:= false;
end;

procedure TFrmClients.btnprintClick(Sender: TObject);
begin
  inherited;
  FrmRelClients.ShowModal;
end;

procedure TFrmClients.btnsearchClick(Sender: TObject);
begin
  inherited;
    frmclientsearch.ShowModal;
end;

procedure TFrmClients.DBEdit10Change(Sender: TObject);
begin
  inherited;
 FDtable.FieldByName('phone').EditMask:= '!\(99\)0000-0000;1';
end;

procedure TFrmClients.DBEdit11Change(Sender: TObject);
begin
  inherited;
  FDtable.FieldByName('cell').EditMask:= '!\(99\)9000-0000;1';
end;

procedure TFrmClients.DBEdit12Change(Sender: TObject);
begin
  inherited;
 FDtable.FieldByName('cell2').EditMask:= '!\(99\)9000-0000;1';
end;

procedure TFrmClients.DBEdit16Change(Sender: TObject);
begin
  inherited;
 FDtable.FieldByName('fax').EditMask:= '!\(99\)0000-0000;1';
end;

procedure TFrmClients.DBEdit8Change(Sender: TObject);
begin
  inherited;
FDtable.FieldByName('zip_code').EditMask:= '00000\-999;1;_';
end;

procedure TFrmClients.FormActivate(Sender: TObject);
begin
  inherited;

tipocli.Clear;
tipocli.items.add('F');
tipocli.items.add('J');

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
procedure TFrmClients.tipocliExit(Sender: TObject);
begin
  inherited;

  if tipocli.Text = 'F' then
begin
  Label5.Caption:= 'Nome';
  Label3.Caption:= 'CPF';
  Label4.Caption:= 'RG';
  label6.Visible:= false;
  dbedit4.visible:= false;
  FDtable.FieldByName('CPF_CNPJ').EditMask:= '000.000.000-00;1;_';
end
else
begin
  label6.Visible:= true;
  dbedit4.visible:= true;
  Label5.Caption:= 'Razão Social';
  Label3.Caption:= 'CNPJ';
  Label4.Caption:= 'IE';

  FDtable.FieldByName('CPF_CNPJ').EditMask:= '00.000.000/0000-00;1;_';
end;

end;

procedure TFrmClients.ToolButton2Click(Sender: TObject);
begin
  inherited;
  FrmRelClients.showmodal;
end;

end.




