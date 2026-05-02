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

