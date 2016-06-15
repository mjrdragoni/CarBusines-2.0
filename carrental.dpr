program carrental;









{$R *.dres}

uses
  Vcl.Forms,
  UnitMainMenu in 'UnitMainMenu.pas' {FrmMainMenu},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  UnitPattern in 'UnitPattern.pas' {FrmPattern},
  Vcl.Themes,
  Vcl.Styles,
  UnitLogin in 'UnitLogin.pas' {FrmLogin},
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
  UnitSales in 'UnitSales.pas' {FrmSales},
  UnitExpotaImportaWeb in 'UnitExpotaImportaWeb.pas' {FrmExpottImport},
  UnitPatternRel in 'UnitPatternRel.pas' {FrmPatternRel},
  UnitRelRents in 'UnitRelRents.pas' {FrmRelRents},
  UnitRelSale in 'UnitRelSale.pas' {FrmRelSale},
  UnitWebReserves in 'UnitWebReserves.pas' {FrmWebReserve},
  UnitRelClients in 'UnitRelClients.pas' {FrmRelClients},
  UnitSearchDate in 'UnitSearchDate.pas' {pesqData},
  UnitClientSearch in 'UnitClientSearch.pas' {frmclientsearch},
  UnitUsers in 'UnitUsers.pas' {FrmUsers},
  UnitAppearance in 'UnitAppearance.pas' {FrmAppearance},
  UnitRelBrands in 'UnitRelBrands.pas' {FrmRelBrands},
  UnitRelCars in 'UnitRelCars.pas' {FrmRelCars},
  UnitRelDepartments in 'UnitRelDepartments.pas' {FrmRelDepartments},
  UnitRelMaint in 'UnitRelMaint.pas' {FrmRelMaint},
  UnitRelModels in 'UnitRelModels.pas' {FrmRelModels},
  UnitRelOfficials in 'UnitRelOfficials.pas' {FrmRelOfficials},
  UnitRelPositions in 'UnitRelPositions.pas' {FrmRelPosition},
  UnitRelProv in 'UnitRelProv.pas' {FrmRelProv},
  UnitRelUsers in 'UnitRelUsers.pas' {FrmRelUsers},
  UnitRelWorkShop in 'UnitRelWorkShop.pas' {FrmRelWorkShop},
  UnitPatternSearchString in 'UnitPatternSearchString.pas' {frmpatternseachstring},
  UnitProviersSearch in 'UnitProviersSearch.pas' {frmprovidersearch},
  UnitCarsSearch in 'UnitCarsSearch.pas' {frmcarsearch};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmPattern, FrmPattern);
  Application.CreateForm(TDM, DM);
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
  Application.CreateForm(TFrmExpottImport, FrmExpottImport);
  Application.CreateForm(TFrmPatternRel, FrmPatternRel);
  Application.CreateForm(TFrmRelRents, FrmRelRents);
  Application.CreateForm(TFrmRelSale, FrmRelSale);
  Application.CreateForm(TFrmWebReserve, FrmWebReserve);
  Application.CreateForm(TFrmRelClients, FrmRelClients);
  Application.CreateForm(TpesqData, pesqData);
  Application.CreateForm(Tfrmclientsearch, frmclientsearch);
  Application.CreateForm(TFrmUsers, FrmUsers);
  Application.CreateForm(TFrmAppearance, FrmAppearance);
  Application.CreateForm(TFrmRelBrands, FrmRelBrands);
  Application.CreateForm(TFrmRelCars, FrmRelCars);
  Application.CreateForm(TFrmRelDepartments, FrmRelDepartments);
  Application.CreateForm(TFrmRelMaint, FrmRelMaint);
  Application.CreateForm(TFrmRelModels, FrmRelModels);
  Application.CreateForm(TFrmRelOfficials, FrmRelOfficials);
  Application.CreateForm(TFrmRelPosition, FrmRelPosition);
  Application.CreateForm(TFrmRelProv, FrmRelProv);
  Application.CreateForm(TFrmRelUsers, FrmRelUsers);
  Application.CreateForm(TFrmRelWorkShop, FrmRelWorkShop);
  Application.CreateForm(Tfrmpatternseachstring, frmpatternseachstring);
  Application.CreateForm(Tfrmprovidersearch, frmprovidersearch);
  Application.CreateForm(Tfrmcarsearch, frmcarsearch);
  Application.Run;
end.
