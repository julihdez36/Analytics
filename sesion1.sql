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



