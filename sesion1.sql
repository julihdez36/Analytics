# Consultas SQL: C.R.U.D [create, read, update, delete]

##### Introducción a las consultas en SQL #####
# 1. Creación de la base da la base de datos

create database cursoBI;

# 2. Llamar a mi BD

use cursoBi;

# 3. Crear mis tablas de trabajo

create table ejemplo(
	columna_1 varchar(50),
    columna_2 int,
    columna_3 date
);

select columna_1 from ejemplo;

describe ejemplo;

alter table ejemplo
modify column columna_2 float;

describe ejemplo;

drop table ejemplo;

##### Proyecto de ventas del supermercado #####

describe df;

select * from df limit 5;

select Branch as Sede from df limit 5;

############## Sesión número 2 ##############

use cursobi;

select * from df limit 5;

######### Exploración de nuestros datos a través de consultas #########

show columns from df;

select City from df;

## Operadores relacionales ##
## where ##

select * from df where City = 'Yangon'; # Operador igual

select * from df where City != 'Yangon'; # Operador de diferencia
 
select * from df where Quantity >= 10; # Operador de mayor (igual)
  
select * from df where Quantity < 10; # Operador de menor (igual)

## Operadores lógicas ##
# and, or, not

# And

select * from df;
describe df;

select City, Branch, Quantity from df
where Gender = 'Female' and Branch != 'A';

# Or

select * from df;

select City, Branch, Quantity from df
where (Gender = 'Female' and Payment = 'Cash') or Branch = 'A';

# 1: True, 0: False
# and = 1 sii 1 and 1
# or = 0 sii 0 or 0
describe df;

select count(*) from df
where Gender = 'Female' and City = 'Yangon'; # 161

select count(*) from df
where Gender = 'Female' or City = 'Yangon'; # 680

select count(*) from df 
where not Gender = 'Female'; # 499

select count(*) from df 
where Gender != 'Female'; # 499

select * from df limit 5;

Select Rating * 2 as Rating_times_2 from df;

######### Proceso de ETL #########

describe df;

select 'Customer type' from df;

ALTER TABLE df CHANGE `Customer type` Customer_type VARCHAR(255);

describe df;
select Date from df;

# Modificación de el tipado de Date

update df 
set Date = str_to_date(Date, '%m/%d/%Y'); 

alter table df modify column Date DATE;

describe df; 

update df set Time = str_to_date(Time, '%H:%i');

alter table df modify Time TIME;

############### Sesión 28.11: normalización ###############

create table Customer(
	CustomerID INT auto_increment primary key,
    CustomerType varchar(50),
    Gender varchar(10),
    Rating float
);

select * from Customer;

create table Invoices(
	InvoiceID varchar(50) primary key,
    Branch varchar(10),
    City varchar(50),
    Date DATE,
    Time TIME,
    payment varchar(50),
    CustomerID INT,
    foreign key (CustomerID) references Customer(CustomerID)
);

select * from Invoices;

create table Products(
	ProductID INT auto_increment primary key,
	ProductLine varchar(50)
    ## UnitPrice ???
);

create table sales (
	SaleID int auto_increment primary key,
    InvoiceID varchar(50),
    ProductID INT,
    Quantity INT,
    Tax float,
    Total float,
    COGS float,
    GrossMargin float,
    GrossIncome float,
    foreign key (InvoiceID) references Invoices(InvoiceID),
    foreign key (ProductID) references Products(ProductID)
)








