# C.R.U.D: create, read-retrieve, update, delete

#####################################################
###### Creación de bases de datos y tablas ######
#####################################################

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

# Agregar y eliminación columnas, variables o campos ------------------

alter table student add gpa decimal(3,2);

alter table student add last_name varchar(20);

select * from student;

alter table student drop column gpa;
alter table student drop column last_name;

# inserción de datos

insert into student values(1,"Anderson","Ingeniería");
insert into student values(2, 'Jack', 'Matemáticas' );

select * from student;

alter table student add level int; 


create table student(
	student_id int,
    name varchar(20) not null, # No NA
    major varchar(20),
    level int unique, # Unicos
    primary key(student_id)
);

describe student;

insert into student values(1,NULL,'Chemistry',5);

insert into student values(1,'Maria','Chemistry',5);
insert into student values(2,'José','Chemistry',5);


drop table student;


create table student(
	student_id int auto_increment,
    name varchar(20) not null, # No NA
    major varchar(20),
    level int unique, # Unicos
    primary key(student_id)
);

insert into student(name, major, level) values('Maria','Chemistry',3);
insert into student(name, major, level) values('Pedro','Chemistry',2);

select * from student; 



