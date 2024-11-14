# Supermarket sales
# Historical record of sales data in 3 different supermarkets
# https://www.kaggle.com/datasets/aungpyaeap/supermarket-sales?select=supermarket_sales+-+Sheet1.csv

######################## Empecemos por crear nuestra base de datos ########################

create database cursoBI;
use cursoBI;

drop table raw_df;

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

UPDATE supermarket_sales
SET Date = STR_TO_DATE(Date, '%d/%m/%Y');


# Esta actualización no se realizará si no deshabilitamos el modo seguro: Edit --> 	Preferences --> desmarca la opción Safe Updates






    
# Si se quiere modificar la tabla



# Habiendo creado la tabla ya podremos realizar la importación de los datos

select * from ecommerce;

describe ecommerce;

# Pero recordemos que nuestra columna InvoiceDate es fecha, así que cambiemolo ahora si

UPDATE ecommerce
SET InvoiceDate = STR_TO_DATE(InvoiceDate, '%m-%d-%Y');




# Si deseo verifiar si tiene datos nulos

select sum(InvoiceNo is null) from ecommerce;

# Replicado para toda columna

SELECT 
    SUM(InvoiceNo IS NULL) AS nulos_InvoiceNo,
    SUM(StockCode IS NULL) AS nulos_StockCode,
    SUM(Destails IS NULL) AS nulos_Destails,
    SUM(Quantity IS NULL) AS nulos_Quantity,
    SUM(InvoiceDate IS NULL) AS nulos_InvoiceDate,
    SUM(UnitPrice IS NULL) AS nulos_UnitPrice,
    SUM(CustomerID IS NULL) AS nulos_CustomerID,
    SUM(Country IS NULL) AS nulos_Country
FROM ecommerce;


# Ahora si vamos a cambiar el tipo de datos





    
