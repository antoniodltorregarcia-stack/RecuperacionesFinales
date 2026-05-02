/*8.5.1. Subconsultas en general.
Realiza los ejercicios sin utilizar INNER JOIN.
Base de datos: tiendadb.*/

/*Iniciamos base de datos*/

use 0atorgar;
select * from fabricante;
select * from producto;
select * from pais;

/*añadir datos que faltaban*/

insert into producto values ("LEN01", "Portatil Yoga 520", 564, 2);
insert into producto values ("LEN02", "Portatil Idepad 320", 449, 2);


/*1. Devuelve todos los productos del fabricante “Lenovo”. */

select p.codigo, p.nombre
from producto p
where codigo_fabricante = (select f.codigo
							from fabricante f
                            where f.nombre = "Lenovo");
                            
/* 2. Devuelve todos los datos de los productos que tienen el mismo precio o superior al 
producto más caro del fabricante “Asus”. */


select p.nombre , p.precio
from producto p
where p.precio >= (select max(precio)
					from producto 
					where codigo_fabricante = (select codigo
							from fabricante 
                            where nombre = "Asus")
					);
                    
/*3. Lista el nombre del producto más caro del fabricante Lenovo.*/

select nombre, precio
from producto
where precio = (select max(precio)
				from producto
                where codigo_fabricante = (select codigo
											from fabricante
                                            where nombre = "Lenovo")
				);
                
/* 4. Lista el nombre del producto más barato del fabricante Hewlett-Packard. */

select nombre, precio
from producto
where precio = (select min(precio)
				from producto
                where codigo_fabricante = (select codigo
											from fabricante
                                            where nombre = "Hewlett-Packard")
				);
                
                
                
/*8.5.2. Subconsultas con ALL y ANY.
Base de datos: tiendadb. */

/*1. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, 
ORDER BY ni LIMIT */

use 0atorgar;
/*Arrancar bd*/

alter table producto modify column precio double null;
/*Modificar tabla para que el precio pueda ser null*/

insert into producto values ("ASU04", "Gorra to perita", null, 1);
/*Añadimos la gorra to perita con valor nul*/

select * from producto;
/*Comprobamos que esta*/

select codigo Codigo, nombre Nombre, precio Precio
from producto 
where precio >= all (select distinct precio 
					 from producto
                     where precio is not null);

