# Supermarket sales
# Historical record of sales data in 3 different supermarkets
# https://www.kaggle.com/datasets/aungpyaeap/supermarket-sales?select=supermarket_sales+-+Sheet1.csv

######################## Empecemos por crear nuestra base de datos ########################

create database cursoBI;
use cursoBI;

######################## Importar conjunto de datos ########################
# Podemos importar manualmente o por asistente, o una mezcla de ambas
# Por asistente resulta mejor

-- CREATE TABLE raw_df(
--     InvoiceID VARCHAR(50),
--     Branch VARCHAR(50),
--     City VARCHAR(50),
--     CustomerType VARCHAR(50),
--     Gender VARCHAR(10),
--     ProductLine VARCHAR(50),
--     UnitPrice DOUBLE,
--     Quantity INT,
--     Tax5Percent DOUBLE,
--     Total DOUBLE,
--     Date DATE,
--     Time TIME,
--     Payment VARCHAR(50),
--     COGS DOUBLE,
--     GrossMarginPercentage DOUBLE,
--     GrossIncome DOUBLE,
--     Rating DOUBLE
-- );
 
######################## Visualicemos la tabla ######################## 

select * from supermarket_sales;

select * from supermarket_sales limit 5; #combinando limit

########################  Cuántos registros tengo ######################## 

select count(*) as total_registros from supermarket_sales ;

######################## Visualicemos caracterustucas de la tabla ######################## 

describe supermarket_sales;

# Acá notamos que tenemos que corregir los campos de fecha

######################## Limpieza de datos ######################## 

# Cambiamos los valores

UPDATE supermarket_sales
SET Date = STR_TO_DATE(Date, '%m/%d/%Y');

# Esta actualización no se realizará si no deshabilitamos el modo seguro: Edit --> 	Preferences --> desmarca la opción Safe Updates

# Ahora modificamos el tipo de la columna

ALTER TABLE supermarket_sales
MODIFY COLUMN Date DATE;

# Ahora, hagamos lo mismo con Time
# El tipo de dato adecuado para almacenar horas es TIME

UPDATE supermarket_sales
SET Time = STR_TO_DATE(Time, '%H:%i');

# Ahora cambiamos el tipo asignado a la columna
ALTER TABLE supermarket_sales
MODIFY Time TIME;

describe supermarket_sales; # apreciamos el resultado


######################## NORMALIZACIÓN DE MI TABLA ######################## 

# Tras definir las reglas de negocio procederemos a crear las tablas

drop database cursobi;



