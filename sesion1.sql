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








