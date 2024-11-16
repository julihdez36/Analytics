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

select * from sales limit 5;

describe sales;

select Date, Time from sales limit 5;

select Branch from sales; 





