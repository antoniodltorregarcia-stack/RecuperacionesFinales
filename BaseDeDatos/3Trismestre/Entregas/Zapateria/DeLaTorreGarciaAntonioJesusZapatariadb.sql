/*
Practica Prt-15. Consultas sobre base de datos zapateriadb.sql
Antonio Jesús de la Torre García
*/

use zapateria;


/*1. Listado de los fabricantes que no nos proporcionan ningún producto. Sin JOIN.*/

select nombre
from fabricante
where id not in (select fabricante
				 from articulo
                 where fabricante is not null);
     
     
/*2. Listado de todos los países y el número de fabricantes que tenemos de ese país
Ordenado descendentemente por la cantidad y ascendentemente por el nombre del país.*/

select nombre, (select count(id) 
				from fabricante 
				where pais = pais.id) as cantidad
from pais
order by cantidad desc, nombre asc;


/*3. Listado de las categorías cuyo precio medio es superior a 120 euros.
Mostrar también el precio medio con dos decimales.*/

select (select nombre 
		from categoria 
        where id = a.categoria) as nombre, 
round(avg(precio), 2) as 'precio medio'
from articulo a
group by categoria
having avg(precio) > 120;


/*4. Listado de todos los productos nacionales con el nombre de su fabricante.
Has de usar una de las siguientes cláusulas: ALL, ANY, IN, EXISTS.*/

select modelo, (select nombre 
				from fabricante f
				where f.id = a.fabricante) as fabricante
from articulo a
where fabricante in (select id 
					 from fabricante 
					 where pais = (select id 
								   from pais 
								   where nombre = 'España')
);

/*5. Artículo más caro. Sin utilizar las funciones: MAX, ORDER BY ni LIMIT.*/

select modelo, precio
from articulo
where precio >= all (select precio
					 from articulo);

/*6. Para una codificación interna de la tienda se asignará a cada zapato un
código con el siguiente patrón:

- Tres primeros caracteres de la categoría a la que pertenece.

- Separado por un guion los tres primeros caracteres del modelo.

- Unidad y decena de la temporada.

Mostrar un listado de todos los zapatos y su correspondiente código.*/

select modelo, upper( concat( left( (select c.nombre 
									 from categoria c 
                                     where c.id = a.categoria), 3),
							  '-',
                              left(a.modelo, 3),
                              right(a.temporada, 2)
							)
					) as codigo
from articulo a
where a.categoria is not null 
and a.temporada is not null;

/*7. Listado de todos los zapatos running y su fabricante. Utiliza EXISTS.*/

select modelo, (select c.nombre
				from categoria c
                where a.categoria = c.id) as categoria
from articulo a
where exists (select 1 
			  from categoria c 
			  where c.id = a.categoria 
			  and c.nombre like '%running%');