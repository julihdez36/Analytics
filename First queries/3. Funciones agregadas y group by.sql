# Funciones agregadas
use primera;
/*
Sum = sumar
min = minimo
max = maximo
count = contar valores
 */
 
 select * from persona;
 
 select sum(id_usuario) from persona; # sumo la columna que me interesa
 
  select count(apellido) from persona
  where apellido = 'Rodríguez'; # Contando los apellidos que son rodriguez
  
  select * from persona
  where apellido = 'Rodríguez';  # Validamos que se trata de dos personas
  
  select min(id_usuario) from persona
  where id_usuario between 2 and 5; # El minimo dadas unas restricciones
  
  # ----------------------------  Clausula group by ------------------------
  
select apellido, count(id_usuario) from persona
group by apellido; # cuantas personas hay por apellido
  
select apellido, sum(id_usuario) from persona
group by apellido; # Suma del id_usuario por apellido
  
  

  
  
 