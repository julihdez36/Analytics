# Esto es un comentario, lo que significa que no se va a ejecutar nada de lo que escriba acá.
# Queries = consultas
# C.R.U.D.: Create, read-retrieve, update, delete

# Empecemos por crear una base de datos

create database bd_gestion;

# Indicamos que vamos a trabajar sobre esa base de datos
use bd_gestion;

# Creamos una tabla
create table clientes (
	cliente_id int unique primary key,
    direccion varchar(50),
    primer_nombre varchar(20),
    apellido varchar(20),
    suscribcion varchar(10),
    productos_id int
);

# Consultar o leer una tabla

select * from clientes; # visualizamos

describe clientes;

# Modificaciones de nuestra tabla (update) 
# Agreguemos una columna

alter table clientes add ahorro decimal(6,5);

#Eliminamos una columna
alter table clientes drop ahorro;

# Creamos y eliminamos una tabla
create table producto (
	producto_id int primary key
);

drop table producto;

# Inserción de los datos

describe clientes;

insert into clientes values(123,'cll 123','José','Perez','Dorada',5);
insert into clientes values(124,'cll 123','Maria','Hernández','Bronce',3);
insert into clientes values(125,'cll 123','Pedro','López','Plata',8);

select * from clientes;

# Sentencia WHERE y los comparadores lógicos
# =, !=, <>, >, <, >=

select * from clientes 
where suscribcion = 'Dorada';


select * from clientes 
where suscribcion <> 'Dorada';

# Operadores lógicos
# AND, OR, NOT

select * from clientes 
where suscribcion <> 'Dorada' or productos_id = 8;

select cliente_id as cedula from clientes 
where suscribcion <> 'Dorada' or productos_id = 8;

select cliente_id as cedula, suscribcion as suscripción from clientes 
where suscribcion <> 'Dorada' or productos_id = 8;

use bd_gestion;

describe ecommerce;

# Funciones de agregación

/*
Sum = sumar
min = minimo
max = máximo
count = contar
avg = promedio 
*/

select * from ecommerce;

select * from ecommerce 
where Country <> 'United Kingdom' and Country <> 'France';

select count(InvoiceNo) from ecommerce; # 4860 registros

select count(InvoiceNo) from ecommerce
	where Country = 'United Kingdom'; # 4559 registros del reino unido

select Country, count(InvoiceNo) as Frecuencia from ecommerce
	group by Country;

select Country, avg(Quantity) from ecommerce
	where Country = 'United Kingdom';

select Country, count(InvoiceNo) as Quantity_invoice, 
	avg(Quantity) as Mean_Quantity from ecommerce
	group by Country;

select StockCode, min(UnitPrice) as min_precio from ecommerce
	group by StockCode;
	

describe ecommerce;








