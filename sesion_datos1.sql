# Consultas SQL: C.R.U.D: Create, read, update, delete.

################################################################
########## Breve introducción a las consultas en SQL ##########

# 1. Creación y uso de la base de datos 

create database BD_curso;
use BD_curso;

# 2. Creación de tablas

create table ejemplo(
	columan_1 varchar(50),
    columna_2 int,
    columna_3 date,
    columna_4 float);
    
# Lectura de mi tabla

select * from ejemplo;

select	columan_1 as Nombre from ejemplo;

describe ejemplo;

# Actualización de mi tabla

alter table ejemplo
modify column columna_4 double;

describe ejemplo;

# Eliminación de tablas y BD

drop table ejemplo; 

select * from ejemplo; 

################################################################
############## Proyecto ventas de supermercados ###############

# 1. Importación y creación de la tabla temporal
# 2. Leer nuestros datos

use BD_curso;

select * from sales limit 5;

describe sales;

select Date, Time from sales limit 5;

###### Sentencias básicas en SQL  ######

show columns from sales;
describe sales;   

select * from sales;

select count(*) from sales; # Número de registros es 1000

# Relaciones lógicas
# = , != , <= , >=

# Operadores lógicos
# not, or, and
# 1: True, 0: False
# and = 1 : 1 and 1
# or = 0 : 0 or 0

select * from sales 
where Branch = 'A' or Payment != 'Cash'; # 230

select count(*) from sales 
where Branch = 'A' and Payment != 'Cash'; # 230

select count(*) from sales 
where Branch = 'A' or Payment != 'Cash'; # 766

select Branch, City, 'Product line' from sales
where Payment = 'Cash' and Rating >= 9;

show columns from sales;

# Funciones agregados

select count(*) from sales where Branch = 'A'; # 340
select count(*) from sales where Branch = 'B'; # 322
select count(*) from sales where Branch = 'C'; # 328

select * from sales; 

select sum(Total) from sales where Branch = 'A'; # 106200.3705000001
select sum(Total) from sales where Branch = 'B'; # 106197.67199999996
select sum(Total) from sales where Branch = 'C'; # 110568.70649999994

# min, max

describe sales;

select min('Tax 5%') from sales; 


########### Proceso de ETL ########### 

describe sales;

select Date, Time from sales;

# Cambio de tipado de la fecha

update sales set Date = str_to_date(Date, '%m/%d/%Y');

alter table sales
modify column Date DATE;

# Cambio de tipado de hora

update sales set Time = str_to_date(Time, '%H:%i');

alter table sales
modify column Time Time;

describe sales;

select * from sales;

########### Almacenamito como BDR ########### 

create table Customer (
	CustomerID int auto_increment primary key,
    CustomerType varchar(50),
    Gender varchar(50),
    Raiting float
);

create table Invoices(
	InvoiceID varchar(50) primary key,
    Branch varchar(10),
    City varchar(50),
    Date date,
    Time time,
    Payment varchar(50),
    CustomerID int,
    foreign key (CustomerID) references Customer(CustomerID)
);

create table Products(
	ProductID int auto_increment primary key,
    Name varchar(50),
	ProductLine varchar(50),
    UnitPrice float    
);

create table sales(
	SalesID int auto_increment primary key,
    InvoiceID varchar(50),
    ProductID int,
    Quantity int,
    Tax float,
    Total float,
    COGS float, 
    GrossMarginPer float,
    GrossIncome float,
    foreign key (InvoiceID) references Invoices(InvoiceID),
    foreign key (ProductID) references Products(ProductID)
);









