-- T12 indices

-- create index idx_nombre on tabla(atributo)

-- show index from tabla

-- drop index on table

/*Ejemplo 1*/

use jardineria;


-- Versión de siempre

select nombre_contacto, telefono
from cliente
where pais = 'France';

-- Explicación de indice

explain select nombre_contacto, telefono
from cliente
where pais = "France";

-- Vemos los indices de clientes

show index from cliente;

-- Creamos idx_pais

create index idx_pais on cliente(pais);

show index from cliente; -- Ahora sale nuestro indice

-- Trabajamos con jardineriadb;

/*borramos ejemplos*/
drop index idx_ciudad on cliente;
drop index idx_pais on cliente;

/*observamos cliente*/

describe cliente;

/*vemos sus indices*/
show index from cliente;

show create table cliente;

/*Ver cuantos cod_cliente hay*/

select count(codigo_cliente) from cliente; -- count se encarga de contar

select count(distinct codigo_empleado_rep_ventas) from cliente; -- Para no contar repeditos

select * from cliente;

/*Primero hacemos la consulta clasica*/
select codigo_cliente, nombre_cliente, telefono, pais 
from cliente
where pais = "France";

/*Explain mas consulta se añade debajo sin nada mas*/
explain 
	select codigo_cliente, nombre_cliente, telefono, pais 
	from cliente
	where pais = "France";
    
/*Creamos el indice*/

create index idx_pais on cliente(pais);

/*vemos los indices*/

show index from cliente;

/*verificamos el indice deben salir 2*/

select count(pais) 
from cliente 
where pais = "France";

  ------------------------------------------------------------- 
  
select * from producto;

select * 
from producto
where descripcion regexp "planta"; -- regexp para buscar datos mas sencillo que like


-- Indices Tipo Texto

/*Ejemplo*/
select count(codigo_producto) from producto; /*276 filas*/

explain 
	select * 
	from producto
	where descripcion regexp "planta"; /*276 filas*/
    
/*creamos indice pa descripcion*/

create index idx_descripcion on producto(descripcion);

/*No se puede, vemos porque*/

show create table producto; -- Es tipo text (una pila caracteres, no se puede)

/*Lo hacemos con index full text*/

create fulltext index idx_descripcion on producto(descripcion);

show index from producto;

explain 
	select * 
	from producto
	where descripcion regexp "planta"; /*276 filas*/
    
/*debemos cambiar la estructura del select porque no se ejecuta bien*/

/*Usamos match y against*/

select *
from producto
where match (descripcion) against ("Tremoncillo");

explain 
	select *
	from producto
	where match (descripcion) against ("Tremoncillo");