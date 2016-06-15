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
  Vcl.StdStyleActnCtrls, Vcl.XPStyleActnCtrls, Vcl.StdCtrls, Vcl.Themes, Vcl.Styles,
  Vcl.Imaging.pngimage;


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
    Access_ExpImp: TAction;
    Access_WebReserves: TAction;
    Action1: TAction;
    Image1: TImage;
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
    procedure Access_ExpImpExecute(Sender: TObject);
    procedure Access_ExpImpUpdate(Sender: TObject);
    procedure RelSalesExecute(Sender: TObject);
    procedure RelRentsExecute(Sender: TObject);
    procedure Access_WebReservesExecute(Sender: TObject);
    procedure Access_WebReservesUpdate(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure Action1Execute(Sender: TObject);
    procedure Access_ReservesExecute(Sender: TObject);
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
  UnitCars, UnitModels, UnitRents, UnitSales, UnitExpotaImportaWeb,
  UnitRelRents, UnitRelSale, UnitWebReserves, UnitAppearance, UnitReserves;

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

procedure TFrmMainMenu.Action1Execute(Sender: TObject);
begin
FrmAppearance.ShowModal;
end;

procedure TFrmMainMenu.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
var
 mensagem: string;
 Pos1, Pos2: integer;
begin

if Pos(UpperCase('is not a valid date'), UpperCase(E.Message)) <> 0 then
  mensagem:='Data inválida, proceda a correção.'
 else if Pos(UpperCase('must have a value'), UpperCase(E.Message)) <> 0 then
 begin
  Pos1:=Pos('''', E.Message);
  mensagem:=E.Message;
  Delete(mensagem, Pos1, 1);
  Pos2:=Pos('''', mensagem);
  mensagem:=copy(E.Message, Pos1 + 1, Pos2 - Pos1);
  mensagem := 'É obrigatório o preenchimento do campo '+ mensagem + '.';
 end
 else if Pos(UpperCase('key violation'), UpperCase(E.Message)) <> 0 then
  mensagem := 'Houve violação de Chave. Registro já incluido.'
 else if Pos(UpperCase('is not a valid time'), UpperCase(E.Message)) <> 0 then
  mensagem := 'Hora inválida, proceda a correção.'
 else if Pos(UpperCase('is not a valid float'), UpperCase(E.Message)) <> 0 then
 begin
  Pos1 :=Pos('''', E.Message);
  mensagem :=E.Message;
  Delete(mensagem, Pos1, 1);
  Pos2 := Pos('''', mensagem);
  mensagem :=copy(E.Message, Pos1 + 1, Pos2 - Pos1);
  mensagem := 'O valor '+ mensagem + ' não é válido.';
 end
 else if Pos(UpperCase('field value required'), UpperCase(E.Message)) <> 0 then
 begin
  Pos1 :=Pos('column ', E.Message) + 7;
  Pos2 :=Pos(',', E.Message);
  mensagem :=copy(E.Message, Pos1, Pos2 - Pos1);
  mensagem := 'Campo ' + mensagem + ' deve ser preenchido.';
 end
 else if Pos(UpperCase('UNIQUE KEY'), UpperCase(E.Message)) <> 0
 then
  mensagem := 'Não é permitido valor duplicado. '
 else if Pos(UpperCase('FOREIGN KEY'), UpperCase(E.Message)) <> 0 then
  mensagem := 'Operação não permitida, registro vinculado em outra tabela está faltando.'
 else if Pos('VIOLATION OF PRIMARY OR UNIQUE KEY CONSTRAINT', UpperCase(E.Message)) <> 0
 then
  mensagem := 'Registro Duplicado'+#13#10+Copy(UpperCase(E.Message),Pos('VIOLATION OF PRIMARY OR UNIQUE KEY CONSTRAINT',UpperCase(E.Message))+47,100)
 else if (Pos(UpperCase('MUST APPLY UPDATES BEFORE REFRESHING DATA'),
 UpperCase(E.Message)) <> 0) then
  mensagem := 'É necessário aplicar as alterações antes de atualizar os dados.'
  else if Pos('VIOLATION OF PRIMARY OR UNIQUE KEY CONSTRAINT', UpperCase(E.Message)) <> 0
 then
  mensagem := 'Registro Duplicado'
 else if (Pos(UpperCase('LOST CONNECTION TO MYSQL'), UpperCase(E.Message)) <> 0) then
  mensagem := #32 +#32+#32+#32+#32+#32'Não foi possivel conectar com o Servidor Web.'+ #13 + #13 +
  'Verifique sua Conexão com a Internet e Tente Novamente.'
 else
  mensagem := 'Ocorreu o seguinte erro: ' + #13 +UpperCase(E.Message);
 MessageDlg(mensagem, mtError, [mbOk], 0);


end;

procedure TFrmMainMenu.Access_WebReservesExecute(Sender: TObject);
begin
frmwebreserve.showmodal;
end;

procedure TFrmMainMenu.Access_WebReservesUpdate(Sender: TObject);
var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();

      if FDQueryUsers.FieldByName('webreserves').AsString = 'Y' then
        Access_WebReserves.Enabled:= True
      else
        Access_WebReserves.Enabled:= False;
        FDQueryUsers.Close;
end;

procedure TFrmMainMenu.Access_ExpImpExecute(Sender: TObject);
begin
 FrmExpottImport.ShowModal;
end;



procedure TFrmMainMenu.Access_ExpImpUpdate(Sender: TObject);
var strCurrentSQL: string;
begin

strCurrentSQL:='SELECT * FROM users WHERE login = ' + #39 + users + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();

      if FDQueryUsers.FieldByName('expimp').AsString = 'Y' then
        Access_ExpImp.Enabled:= True
      else
        Access_ExpImp.Enabled:= False;
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

     strCurrentSQL:='SELECT * FROM users WHERE id = ' + #39 + inttostr(iduser) + #39;

      FDQueryUsers.Close;
      FDQueryUsers.SQL.Clear;
      FDQueryUsers.SQL.Add(strCurrentSQL);
      FDQueryUsers.Open();
      TStyleManager.TrySetStyle(FDQueryUsers.FieldByName('appearance').AsString);
      FDQueryUsers.Close;


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

procedure TFrmMainMenu.RelRentsExecute(Sender: TObject);
begin
FrmRelRents.showmodal;
end;

procedure TFrmMainMenu.RelSalesExecute(Sender: TObject);
begin
  FrmRelSale.showmodal;
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
        Access_Officials.Enabled:= True
      else
        Access_Officials.Enabled:= False;
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

      if FDQueryUsers.FieldByName('positions').AsString = 'Y' then
        Access_Positions.Enabled:= True
      else
        Access_Positions.Enabled:= False;
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


procedure TFrmMainMenu.Access_ReservesExecute(Sender: TObject);
begin
FrmReserves.ShowModal;
end;



procedure TFrmMainMenu.Timer1Timer(Sender: TObject);
begin
 StatusBar1.Panels[0].Text:=
 TimeToStr(Time);
end;

end.
