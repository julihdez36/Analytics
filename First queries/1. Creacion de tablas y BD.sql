# Empezamos por crear una base de datos con CREATE DATABASE
CREATE DATABASE PRIMERA;

CREATE DATABASE SEGUNDA;
# Queremos ver qué bases de datos hemos creado
# En el panel de navegación lateral izquierdo podemos ver las bases de datos en schemas

SHOW DATABASES;
# Podemos también eliminar algunas
DROP DATABASE segunda;

# Para empezar a trabajar con una base de datos tenemos que indicarle qué base de datos vamos a modificar, eestablecemos la base de trabajo
USE PRIMERA;

# Vamos a crear una tabla con unos campos específicos
CREATE TABLE PERSONA(
	NOMBRE VARCHAR(15),
    APELLIDO VARCHAR(15),
    DNI INT(12) NOT NULL,
    NACIMIENTO DATE, 
    PRIMARY KEY (DNI)
);
# La visualizamos
SHOW TABLES;

# Existe otra forma de crear una tabla, veamosla

CREATE database SEGUNDA;

USE SEGUNDA;
/*
Desde acá podemos crear la tabla ya no con código sino con el panel de opciones superior, especificamente en create new table.
 Esto no sólo lo crea, sino además nos arroja el código de salida
 */
 
 SHOW TABLES; #Nos muestra las tablas creadas
 
 # ---------------- Procedamos ahora a insertar datos en las tablas ----------------------
 
 USE PRIMERA;
 SHOW TABLES; #MUESTRO QUÉ TABLAS TENGO
 
 INSERT INTO PERSONA (NOMBRE, APELLIDO, DNI, NACIMIENTO) VALUE ("Julian", "Lopez", "1013636689", "921029"); #AA-MM-DD
 
select * from PERSONA; # El ; es importante porque de lo contrario entiende todo como una misma linea

# No puedo volver a correr la misma linea, por lo que la primary key se duplicaría, lo que no es posible
 
 



