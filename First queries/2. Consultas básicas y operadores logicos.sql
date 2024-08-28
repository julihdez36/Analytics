# Operadores relacionales
/*
= igual
<> distinto
> MAYOR
< MENOR

*/
# Llenemos la tabla con mas registros
USE PRIMERA;
INSERT INTO persona (nombre, apellido, dni, nacimiento) VALUES
('Juan', 'Pérez', 12345678, '1985-01-15'),
('María', 'González', 23456789, '1990-02-20'),
('Carlos', 'Rodríguez', 34567890, '1987-03-25'),
('Ana', 'López', 45678901, '1995-04-30'),
('Luis', 'Martínez', 56789012, '1992-05-10');

#------- CONSULTAS SELECT Y WHERE --------------------------------

SELECT nombre, apellido FROM PERSONA; # Filtrando columnas

SELECT * FROM persona WHERE nombre = 'Julian'; # Filtrando filas

select * from persona where dni <> '1013636689'; 

SHOW COLUMNS FROM persona; # Este comando muestra detalles de la estructura de la tabla	

# Elimemos algunos registros

DELETE FROM PERSONA WHERE DNI = '1013636689';
SELECT * FROM persona; 

DELETE FROM PERSONA; # Esto nos borra toda la tabla, pero no es recomendado, de ahí que halla permisos en preferencias que evitan su eliminación

 # OPERADORES LÓGICOS
 
 INSERT INTO persona (nombre, apellido, dni, nacimiento) VALUES
('Laura', 'González', 67890123, '1988-06-15'),
('Pedro', 'Martínez', 78901234, '1993-07-20'),
('Sofía', 'González', 89012345, '1986-08-25'),
('Roberto', 'Pérez', 90123456, '1994-09-30'),
('Elena', 'Rodríguez', 12345677, '1997-10-10');

# Filtados combinando operadores relacionales y operadores lógicos

#Usando el and
select * from persona
 where  apellido = 'González'
 and nombre = 'Laura';
 
 # usando el or
select * from persona
where  apellido = 'González'
or nombre = 'Laura';
 
 # usando el not
SELECT * FROM persona
WHERE NOT apellido = 'Martínez';

# usando los tres
SELECT * FROM persona
WHERE (nombre = 'Juan' OR nombre = 'María') AND NOT apellido = 'González';

# ------------------------------- BETWEEN E iN -------------------------------
# Empezaremos por agregar una columna autoincremental como PK, lo que implicará eliminar nuestra anterior PK

ALTER TABLE persona
DROP PRIMARY KEY;

ALTER TABLE persona
ADD COLUMN id_usuario INT AUTO_INCREMENT PRIMARY KEY FIRST;

show columns from persona;
select * from persona;

# Ahora usemos between

select * from persona where id_usuario between 2 and 5; # Selecciono valores entre los rangos 2 y 5
select * from persona where id_usuario not between 2 and 5; #Omitimos el rango

# Con el IN accedemos a valores específicos

select * from persona where id_usuario in (3,6,9) or nombre = 'Juan';


# ------------------------------- LIKE -------------------------------

/*
Like
(%) = en este espacio puede ir cualquier cadena de caracteres
(_) = en este espacio puede ir cualquier caracter individual
*/

select * from primera.persona
where nombre like "%a%"; # Nombres que tienen una a antes y despues de texto

select * from primera.persona
where nombre like "%a"; # A como último caracter

select * from primera.persona
where nombre like "a%"; # A como primer caracter

select * from primera.persona
where nombre like "__a"; # Dos caracteres antes de la a


