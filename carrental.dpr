program carrental;

uses
  Vcl.Forms,
  UnitMainMenu in 'UnitMainMenu.pas' {FrmMainMenu},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  UnitPattern in 'UnitPattern.pas' {FrmPattern},
  Vcl.Themes,
  Vcl.Styles,
  UnitLogin in 'UnitLogin.pas' {FrmLogin},
  UnitUsers in 'UnitUsers.pas' {FrmUsers},
  UnitClients in 'UnitClients.pas' {FrmClients},
  UnitOfficials in 'UnitOfficials.pas' {FrmOfficials},
  UnitPositions in 'UnitPositions.pas' {FrmPositions},
  UnitDepartments in 'UnitDepartments.pas' {FrmDepartments},
  UnitProviders in 'UnitProviders.pas' {FrmProviders},
  UnitWorkshops in 'UnitWorkshops.pas' {FrmWorkShops},
  UnitMaintenance in 'UnitMaintenance.pas' {FrmMaintenance},
  UnitBrands in 'UnitBrands.pas' {FrmBrands},
  UnitModels in 'UnitModels.pas' {FrmModels},
  UnitCars in 'UnitCars.pas' {FrmCars},
  UnitRents in 'UnitRents.pas' {FrmRents},
  UnitSales in 'UnitSales.pas' {FrmSales};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amakrits');
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmPattern, FrmPattern);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmUsers, FrmUsers);
  Application.CreateForm(TFrmClients, FrmClients);
  Application.CreateForm(TFrmOfficials, FrmOfficials);
  Application.CreateForm(TFrmPositions, FrmPositions);
  Application.CreateForm(TFrmDepartments, FrmDepartments);
  Application.CreateForm(TFrmProviders, FrmProviders);
  Application.CreateForm(TFrmWorkShops, FrmWorkShops);
  Application.CreateForm(TFrmMaintenance, FrmMaintenance);
  Application.CreateForm(TFrmBrands, FrmBrands);
  Application.CreateForm(TFrmModels, FrmModels);
  Application.CreateForm(TFrmCars, FrmCars);
  Application.CreateForm(TFrmRents, FrmRents);
  Application.CreateForm(TFrmSales, FrmSales);
  Application.Run;
end.
