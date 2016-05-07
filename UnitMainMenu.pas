unit UnitMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls,
  Vcl.AppEvnts, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.jpeg, VCLTee.TeeFilters,
  Vcl.StdStyleActnCtrls, Vcl.XPStyleActnCtrls;

type
  TFrmMainMenu = class(TForm)
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ApplicationEvents1: TApplicationEvents;
    ActionManager1: TActionManager;
    ImageList1: TImageList;
    Access_Clients: TAction;
    Access_Rent: TAction;
    FDQueryUsers: TFDQuery;
    Access_Positions: TAction;
    Access_Departments: TAction;
    Access_Officials: TAction;
    Access_users: TAction;
    Access_Providers: TAction;
    access_workshops: TAction;
    access_Maintenance: TAction;
    Access_Models: TAction;
    Access_Brands: TAction;
    Access_cars: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    Access_sales: TAction;
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure AccessUsersExecute(Sender: TObject);
    procedure Access_ClientsExecute(Sender: TObject);
    procedure Access_DepartmentsExecute(Sender: TObject);
    procedure Access_OfficialsExecute(Sender: TObject);
    procedure Access_usersExecute(Sender: TObject);
    procedure Access_usersUpdate(Sender: TObject);
    procedure Access_PositionsUpdate(Sender: TObject);
    procedure Access_DepartmentsUpdate(Sender: TObject);
    procedure Access_OfficialsUpdate(Sender: TObject);
    procedure Access_PositionsExecute(Sender: TObject);
    procedure Access_ProvidersUpdate(Sender: TObject);
    procedure Access_ProvidersExecute(Sender: TObject);
    procedure access_workshopsExecute(Sender: TObject);
    procedure access_workshopsUpdate(Sender: TObject);
    procedure access_MaintenanceExecute(Sender: TObject);
    procedure access_MaintenanceUpdate(Sender: TObject);
    procedure Access_ModelsExecute(Sender: TObject);
    procedure Access_BrandsExecute(Sender: TObject);
    procedure Access_carsExecute(Sender: TObject);
    procedure Access_ModelsUpdate(Sender: TObject);
    procedure Access_BrandsUpdate(Sender: TObject);
    procedure Access_carsUpdate(Sender: TObject);
    procedure Access_RentExecute(Sender: TObject);
    procedure Access_RentUpdate(Sender: TObject);
    procedure Access_salesExecute(Sender: TObject);
    procedure Access_salesUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMainMenu: TFrmMainMenu;

implementation

{$R *.dfm}

uses UnitDM, UnitLogin, UnitUsers, UnitClients, UnitDepartments, UnitOfficials,
  UnitPositions, UnitProviders, UnitWorkshops, UnitMaintenance, UnitBrands,
  UnitCars, UnitModels, UnitRents, UnitSales;

procedure TFrmMainMenu.AccessUsersExecute(Sender: TObject);
begin
frmUsers.ShowModal;

end;



procedure TFrmMainMenu.Access_BrandsExecute(Sender: TObject);
begin
frmbrands.ShowModal;
end;

procedure TFrmMainMenu.Access_BrandsUpdate(Sender: TObject);
var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();


    if FDQueryUsers.FieldByName('brands').AsString = 'Y' then
        Access_Brands.Enabled:= True
      else
        Access_Brands.Enabled:= False;

        FDQueryUsers.Close;
end;
procedure TFrmMainMenu.Access_ClientsExecute(Sender: TObject);
begin
FrmClients.showmodal;
end;

procedure TFrmMainMenu.Access_usersExecute(Sender: TObject);
begin
frmUsers.ShowModal;
end;



procedure TFrmMainMenu.Access_usersUpdate(Sender: TObject);
var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();


    if FDQueryUsers.FieldByName('users').AsString = 'Y' then
        Access_Users.Enabled:= True
      else
        Access_Users.Enabled:= False;

        FDQueryUsers.Close;
end;

procedure TFrmMainMenu.access_workshopsExecute(Sender: TObject);
begin
frmWorkshops.ShowModal;
end;

procedure TFrmMainMenu.access_workshopsUpdate(Sender: TObject);
var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();

    if FDQueryUsers.FieldByName('workshops').AsString = 'Y' then
        Access_Workshops.Enabled:= True
      else
        Access_Workshops.Enabled:= False;

        FDQueryUsers.Close;

end;

procedure TFrmMainMenu.Access_salesExecute(Sender: TObject);
begin
frmSales.showmodal;
end;

procedure TFrmMainMenu.Access_salesUpdate(Sender: TObject);
var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();

      if FDQueryUsers.FieldByName('sales').AsString = 'Y' then
        Access_cars.Enabled:= True
      else
        Access_cars.Enabled:= False;
        FDQueryUsers.Close;
end;


procedure TFrmMainMenu.Access_carsExecute(Sender: TObject);
begin
frmcars.showmodal;
end;

procedure TFrmMainMenu.Access_carsUpdate(Sender: TObject);
var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();

      if FDQueryUsers.FieldByName('cars').AsString = 'Y' then
        Access_cars.Enabled:= True
      else
        Access_cars.Enabled:= False;
        FDQueryUsers.Close;
end;

procedure TFrmMainMenu.Access_DepartmentsExecute(Sender: TObject);
begin
frmDepartments.showmodal;
end;

procedure TFrmMainMenu.Access_DepartmentsUpdate(Sender: TObject);
var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();

    if FDQueryUsers.FieldByName('departments').AsString = 'Y' then
        Access_Departments.Enabled:= True
      else
        Access_Departments.Enabled:= False;

        FDQueryUsers.Close;

end;

procedure TFrmMainMenu.access_MaintenanceExecute(Sender: TObject);
begin
frmMaintenance.ShowModal;
end;

procedure TFrmMainMenu.access_MaintenanceUpdate(Sender: TObject);
var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();

    if FDQueryUsers.FieldByName('maint_vehicles').AsString = 'Y' then
        Access_Maintenance.Enabled:= True
      else
        Access_Maintenance.Enabled:= False;

        FDQueryUsers.Close;

end;

procedure TFrmMainMenu.FormActivate(Sender: TObject);
begin
StatusBar1.Panels[1].Text:=
    formatDateTime(' dddd ", "' +
     ' dd " de " mmmm " de " yyyy',Now);
     StatusBar1.Panels[2].Text:= 'Usuário: ' + users;

end;

procedure TFrmMainMenu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);

var confSaida: Integer;

begin
    beep;
  confSaida:= Application.MessageBox('Tem certeza que deseja sair '+
  'do sistema?','Atenção',
  MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);

  if confSaida = IDYes then
    halt;

  if confSaida = IDNO then
    CanClose:= False;

end;

procedure TFrmMainMenu.Access_ModelsExecute(Sender: TObject);
begin
FrmModels.showmodal;
end;

procedure TFrmMainMenu.Access_ModelsUpdate(Sender: TObject);
var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();


    if FDQueryUsers.FieldByName('models').AsString = 'Y' then
        Access_models.Enabled:= True
      else
        Access_models.Enabled:= False;
        FDQueryUsers.Close;

end;

procedure TFrmMainMenu.Access_OfficialsExecute(Sender: TObject);
begin
FrmOfficials.showmodal;
end;

procedure TFrmMainMenu.Access_OfficialsUpdate(Sender: TObject);
var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();


    if FDQueryUsers.FieldByName('officials').AsString = 'Y' then
        Access_Positions.Enabled:= True
      else
        Access_Positions.Enabled:= False;
        FDQueryUsers.Close;

end;

procedure TFrmMainMenu.Access_PositionsExecute(Sender: TObject);
begin
frmPositions.ShowModal;
end;

procedure TFrmMainMenu.Access_PositionsUpdate(Sender: TObject);
var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();

      if FDQueryUsers.FieldByName('Positions').AsString = 'Y' then
        Access_Officials.Enabled:= True
      else
        Access_Officials.Enabled:= False;
        FDQueryUsers.Close;
end;

procedure TFrmMainMenu.Access_ProvidersExecute(Sender: TObject);
begin
frmProviders.showmodal;
end;

procedure TFrmMainMenu.Access_ProvidersUpdate(Sender: TObject);

var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();

      if FDQueryUsers.FieldByName('Providers').AsString = 'Y' then
        Access_Providers.Enabled:= True
      else
        Access_Providers.Enabled:= False;
        FDQueryUsers.Close;
end;


procedure TFrmMainMenu.Access_RentExecute(Sender: TObject);
begin
frmrents.ShowModal;
end;

procedure TFrmMainMenu.Access_RentUpdate(Sender: TObject);
var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();

      if FDQueryUsers.FieldByName('rentals').AsString = 'Y' then
        Access_Providers.Enabled:= True
      else
        Access_Providers.Enabled:= False;
        FDQueryUsers.Close;
end;


procedure TFrmMainMenu.Timer1Timer(Sender: TObject);
begin
 StatusBar1.Panels[0].Text:=
 TimeToStr(Time);
end;

end.
