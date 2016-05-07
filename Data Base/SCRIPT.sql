create database carrental

	create table users(
		id int identity(1,1) not null,
		users varchar(20) not null,
		pass varchar(20) not null,		
		add_data char(1),
		change_data char(1),
		delete_data char(1),
		hr char (1),
		sales char(1),
		maint_vehicles char (1), 
		date_add datetime,
		date_alt datetime,
		status char(1),   
		constraint PK_users_id
		primary key (id),
	);  

	create table clients(
		id int identity(1,1) not null,
		cpf_cnpj varchar(20) not null,
		tp varchar(20) not null,
		name_conpany_name varchar(50) not null,
		fantasy_name varchar(50),
		ie_rg varchar(30) not null,
		addr varchar(100) not null,
		complement varchar(50),
		city varchar(50) not null,
		district varchar(50) not null,
		states varchar(50) not null,
		zip_code varcHar(20) not null,
		phone varchar(20) not null,
		cell varchar(20),
		cell2 varchar(20),
		fax varchar(20),
		email varchar(50),
		date_add datetime,
		date_alt datetime,
		status char(1),  
		constraint PK_clients_id
		primary key (id),
	);
  
  
	create table departments(
		id int identity(1,1) not null,
		department varchar(20)not null,
		date_add datetime,
		date_alt datetime,
		status char(1),  
		constraint PK_departments_id
		primary key (id),
	
	);                   
	
	create table positions(
		id int identity(1,1) not null,
		department_id int not null,
		position varchar(20) not null,
		date_add datetime,
		date_alt datetime,
		status char(1),  
		constraint PK_positions_id
		primary key (id),
		constraint FK_positions_department
		foreign key(department_id) references departments (id),

	);          
	
	
	create table officials(
		id int identity(1,1) not null,
		position_id int not null,
		cpf_cnpj varchar(20) not null,
		tp varchar(20) not null,
		name_conpany_name varchar(50) not null,
		fantasy_name varchar(50),
		ie_rg varchar(30) not null,
		addr varchar(100) not null,
		complement varchar(50),
		city varchar(50) not null,
		district varchar(50) not null,
		states varchar(50) not null,
		zip_code varcHar(20) not null,
		phone varchar(20) not null,
		cell varchar(20),
		cell2 varchar(20),
		fax varchar(20),
		email varchar(50),
		date_add datetime,
		date_alt datetime,	
		status char(1),  
		constraint PK_officials_id
		primary key (id),
		constraint FK_officials_position
		foreign key (position_id) references positions (id),
	);        
	
	
	create table workshops(
		id int identity(1,1) not null,
		cpf_cnpj varchar(20) not null,
		conpany_name varchar(50) not null,
		fantasy_name varchar(50),
		ie varchar(30) not null,
		addr varchar(100) not null,
		complement varchar(50),
		city varchar(50) not null,
		district varchar(50) not null,
		states varchar(50) not null,
		zip_code varcHar(20) not null,
		phone varchar(20) not null,
		cell varchar(20),
		cell2 varchar(20),
		fax varchar(20),
		email varchar(50),
		date_add datetime,
		date_alt datetime,
		status char(1),  
		constraint PK_workshops_id
		primary key (id),
	);      
	
	
	create table providers(
		id int identity(1,1) not null,
		cpf_cnpj varchar(20) not null,
		conpany_name varchar(50) not null,
		fantasy_name varchar(50),
		ie varchar(30) not null,
		addr varchar(100) not null,
		complement varchar(50),
		city varchar(50) not null,
		district varchar(50) not null,
		states varchar(50) not null,
		zip_code varcHar(20) not null,
		phone varchar(20) not null,
		cell varchar(20),
		cell2 varchar(20),
		fax varchar(20),
		email varchar(50),
		date_add datetime,
		date_alt datetime,
		status char(1),  
		constraint PK_providers_id
		primary key (id),
	); 

	create table brands(
		id int identity(1,1) not null,
		name varchar(20),
		date_add datetime,
		date_alt datetime,
		status char(1),  
		constraint PK_brands_id
		primary key (id),
	);
	create table car_models(
		id int identity(1,1) not null,
		id_brand int not null,
		name varchar(20),
		status char(1),  		
		constraint PK_models_id
		primary key (id), 
		constraint FK_carmodels_brands
		foreign key (id_brand) references brands (id),
	);
	
	create table cars(
		id int identity(1,1) not null,
		id_brand int not null,
		id_model int not null,
		vendor_id int not null,
		chassis varchar(20) not null,
		air_conditioning char(1),
		power_steering char(1), 
		power_windows char(1), 
		automatic_exchange char(1), 
		airbags char(1),
		date_add datetime,
		date_alt datetime,
		status char(1),  
		constraint PK_cars_id
		primary key (id), 
		constraint FK_cars_brands
		foreign key (id_brand) references brands (id),
		constraint FK_cars_models
		foreign key (id_model) references car_models (id),
	);          
	
	create table maintenances(
		id int identity(1,1) not null,
		id_workshop int not null,
		id_car int not null,
		startdate datetime,
		enddate datetime,
		date_add datetime,
		date_alt datetime,
		status char(1),  
		constraint PK_maintenances_id
		primary key (id), 
		constraint FK_maintenances_workshop
		foreign key (id_workshop) references workshops (id),
		constraint FK_maintenances_cars
		foreign key (id_car) references cars (id),
	);          

	
	create table rentals(
		id int identity(1,1) not null,
		id_client int not null,
		value_daily decimal(18,2),		
		startdate datetime,
		enddate datetime,
		amount decimal(18,2),
		date_add datetime,
		date_alt datetime,
		status char(1),  
		constraint PK_rentals
		primary key (id),
		constraint FK_rentals_clients
		foreign key (id_client) references clients(id),
	);     
	
	create table rentals_itens(
		id_rent int identity(1,1) not null,
		id_car int not null,
		value_daily decimal(18,2),
		amount decimal(18,2),
		date_add datetime,
		date_alt datetime,
		status char(1),  

		
	);                                                                       
