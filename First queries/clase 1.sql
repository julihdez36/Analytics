# C.R.U.D: create, read-retrieve, update, delete

# Create and delete

# Crear una base datos
create database bd_ejemplo;

show databases; # Visualización de lsa bases de datos disponibles
use bd_ejemplo; # Vamos a trabajar con esta base de datos

# Crear tablas

create table student(
	student_id int primary key,
	name varchar(20),
	major varchar(20)
);

drop table student;

create table student(
	student_id int,
    name varchar(20),
    major varchar(20),
    primary key(student_id)
);

describe student; 

# inserción de datos

insert into student values(1,"Anderson","Ingeniería");

select * from student;

