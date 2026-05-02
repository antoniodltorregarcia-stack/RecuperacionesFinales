use zapateria;

select * from pais;
select * from fabricante;
select * from articulo;
select * from categoria;

/* 1. Listado de los fabricantes que no nos proporcionan ningún producto. Sin JOIN. */
/* Antonio De La Torre Garcia*/

select f.id as "Id fabricante" , f.nombre as "Nombre fabricante"
from fabricante f
where not exists ( select *
				   from articulo a
                   where a.fabricante = f.id
				 );

/* 2. Listado de todos los países y el número de fabricantes que tenemos de ese país.
Ordenado descendentemente por la cantidad y ascendentemente por el nombre del país. */
/* Antonio De La Torre Garcia*/

select p.nombre as "Nombre pais" , count(f.pais) as "Número fabricantes"
from pais p
left join fabricante f
	on p.id = f.pais
group by p.id, p.nombre
order by count(f.pais) desc , p.nombre asc;

/* 3. Listado de las categorías cuyo precio medio es superior a 120 euros.
Mostrar también el precio medio con dos decimales. */
/* Antonio De La Torre Garcia */

select c.nombre as "Categoría", avg(a.precio) as "Precio medio" ,
round(avg(a.precio), 2) as "Precio medio 2 decimales"
from categoria c
left join articulo a
	on c.id = a.categoria
group by c.nombre , c.id
having avg(a.precio) > 120;

/*4. Listado de todos los productos nacionales con el nombre de su fabricante.
Has de usar una de las siguientes cláusulas: ALL, ANY, IN, EXISTS.*/
/* Antonio De La Torre Garcia */

select a.modelo as "Producto nacional" ,f.nombre as "Nombre fabricante"
from articulo a
join fabricante f
	on a.fabricante = f.id
where exists ( select *
			   from pais p
               where p.id = f.pais
               and p.nombre = "España"
			  );
              
/* 5. Artículo más caro. Sin utilizar las funciones: MAX, ORDER BY ni LIMIT. */
/* Antonio De La Torre Garcia */

select modelo as "Nombre articulo", precio as "Precio en €"
from articulo
where precio >= all (
					 select precio
                     from articulo
                     );

/* 6. Para una codificación interna de la tienda se asignará a cada zapato
un código con el siguiente patrón:

- Tres primeros caracteres de la categoría a la que pertenece.

- Separado por un guion los tres primeros caracteres del modelo.

- Unidad y decena de la temporada.

Mostrar un listado de todos los zapatos y su correspondiente código.*/
/* Antonio De La Torre Garcia */

select a.modelo as "Modelo zapato",
concat( left(c.nombre, 3), "-" , left (a.modelo, 3), "-", right (a.temporada, 2)) as "Codigo"
from articulo a
join categoria c
	on a.categoria = c.id;

/* 7. Listado de todos los zapatos running y su fabricante. Utiliza EXISTS. */
/* Antonio De La Torre Garcia */

select a.modelo as "Zapatos running", f.nombre as "Nombre fabricante"
from articulo a
join fabricante f
	on a.fabricante = f.id
where exists ( select * 
			   from categoria c
               where c.id = a.categoria
               and c.nombre = "Deportivo running"
               );