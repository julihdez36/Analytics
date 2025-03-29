use bd_ejemplo; 

select * from bank;

select balance, job, education,  y from bank
order by balance asc;

select * from bank 
order by balance desc
limit 5;

# where

select * from bank
where marital = 'married' and
education <> 'primary' and pdays > 100
order by pdays asc;

### Funciones agregados and Group by

select * from bank;

describe bank;

/*
Las funciones de agregación nos permiten resumir nuestro conjunto de datos a través de expresiones 
numéricas derivadas de la estadistica. Podemos construir nuevas tablas de resumen aprovechando el potencial
de las funciones:

Sum = sumar
min = valor mínimo
max = valor máximo
count = contar valores
avg = media de los valores
*/

select count(age) as Suma_Total from bank; # 4521

select count(*) from bank
where marital = 'married'; # 2797


select count(*) as Trabajadores_casados from bank
where marital = 'married' and job <> 'unemployed'; # 2722

select * from bank;

select sum(balance) from bank
where education = 'tertiary' and job <> 'unemployed' and
duration <= 200;

select avg(balance) from bank;

## Group By

select education, count(*) as Frecuencia, avg(balance) as Balance_deuda from bank
group by education;

