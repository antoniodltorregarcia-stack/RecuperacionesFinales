/*7.6.1. Base de datos: tiendadb.*/

use tiendadb;

/*1 Calcula el número total de fabricantes que hay en la tabla fabricante.*/

select * from fabricante;

select count(codigo) -- Count cuenta el numero de valores que existen 
from fabricante;

/*2 Calcula el número de valores distintos de código de fabricante aparecen en la tabla 
productos.*/

select * from producto;

select count( distinct codigo_fabricante)
from producto;

/*3 Calcula el precio medio, el máximo y el mínimo de todos los fabricantes*/

select codigo_fabricante, avg(precio) as "Precio medio", max(precio) as "Precio máximo", 
min(precio) as "Precio mínimo"
from producto
where codigo_fabricante is not null
group by codigo_fabricante;

/*4. Lista el nombre y el precio del producto más caro*/

select nombre, precio
from producto
where precio = (select max(precio)	
				from producto);
                
select nombre, precio
from producto
order by precio desc
limit 1;

/*5 Calcula el número de productos que tiene el fabricante Asus.*/

select f.nombre, p.precio
from producto p
join fabricante f
	on f.codigo = p.codigo_fabricante
where f.nombre = "Asus";

/*6 Calcula la media del precio de todos los productos del fabricante Asus.*/

select f.nombre, avg(p.precio) as "Media precio"
from producto p
join fabricante f
	on f.codigo = p.codigo_fabricante
where f.nombre = "Asus";

/*7 Calcula el precio más barato de todos los productos del fabricante Asus.*/

select f.nombre, min(p.precio)
from producto p
join fabricante f
	on f.codigo = p.codigo_fabricante
where f.nombre = "Asus";

/*8 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos 
que tiene el fabricante Crucial.*/

select f.nombre, max(precio) as "Precio max", min(precio) as "Precio min",
avg(precio) as "Precio medio", count(p.codigo) as "Cantidad productos"
from producto p
join fabricante f
	on f.codigo = p.codigo_fabricante
where f.nombre = "Crucial";

/*9 Muestra el número total de productos que tiene cada uno de los fabricantes. El listado 
también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará
dos columnas, una con el nombre del fabricante y otra con el número de productos que 
tiene. Ordene el resultado descendentemente por el número de productos.*/

select f.nombre, count(p.codigo) as "Numero Productos"
from fabricante f
left join producto p
	on f.codigo = p.codigo_fabricante
group by f.codigo, f.nombre
order by count(p.codigo) desc;

/*10 Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, 
precio medio y el número total de productos de los fabricantes que tienen un precio 
medio superior a 200€. Es necesario mostrar el nombre del fabricante.*/

select f.nombre, max(p.precio), min(p.precio), avg(p.precio), count(p.codigo)
from fabricante f
left join producto p
	on f.codigo = p.codigo_fabricante
group by f.nombre
having avg(p.precio) > 200;


/*11 Calcula el número de productos que tienen un precio mayor o igual a 180€.*/

select count(codigo)
from producto
where precio > 180;

/*12 Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 
180€.*/

select f.nombre, count(p.codigo)
from fabricante f
left join producto p
	on f.codigo = p.codigo_fabricante
	and p.precio >= 180 -- No se usa where pq sino eliminamos a los que no tienen la condicion
group by f.nombre
order by count(p.codigo) desc;

/*13 Lista el precio medio los productos de cada fabricante, mostrando solamente el código 
del fabricante*/

select codigo_fabricante, avg(precio)
from producto
group by codigo_fabricante; -- Con group by no es necesario usar distinct para grupos

/*14 Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre 
del fabricante.*/

select f.nombre, avg(p.precio)
from fabricante f
join producto p
	on f.codigo = p.codigo_fabricante
group by f.nombre;

/*15 Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o 
igual a 150€.*/

select f.nombre, avg(p.precio)
from fabricante f
join producto p
	on f.codigo = p.codigo_fabricante
group by f.nombre
having avg(p.precio) >= 150;

/*16 Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.*/

select f.nombre, count(p.codigo)
from fabricante f
join producto p
	on f.codigo = p.codigo_fabricante
group by f.nombre
having count(p.codigo) >= 2;

/*17 Devuelve un listado con los nombres de los fabricantes y el número de productos que 
tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre
de los fabricantes que no tienen productos que cumplan la condición.*/

select f.nombre, count(p.codigo)
from fabricante f
join producto p
	on f.codigo = p.codigo_fabricante
where p.precio >= 220
group by f.nombre;

/*18 Devuelve un listado con los nombres de los fabricantes y el número de productos que 
tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre 
de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un 
precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el 
número de productos. (ha de hacerse con UNION).*/

select f.nombre, count(p.codigo)
from fabricante f
left join producto p
	on f.codigo = p.codigo_fabricante
	and p.precio >= 220
group by f.nombre
order by count(p.codigo) desc;

/*19 Devuelve un listado con los nombres de los fabricantes donde la suma del precio de 
todos sus productos es superior a 1000 €.*/

select f.nombre, sum(p.precio)
from fabricante f
join producto p
	on f.codigo = p.codigo_fabricante
group by f.nombre
having sum(p.precio) > 1000;

/*7.6.2. Base de datos: empleadodb.*/

use empleadodb;

select * from empleado;
select * from departamento;

/*1. Calcula la suma, media, máximo y mínimo del presupuesto de todos los departamentos.*/

select sum(presupuesto), avg(presupuesto), max(presupuesto), min(presupuesto)
from departamento;

/*2. Calcula el nombre del departamento con menor presupuesto. Muestra el departamento y su 
presupuesto.*/

select nombre, presupuesto
from departamento
order by presupuesto asc
limit 1;

/*3. Calcula el valor máximo del presupuesto de todos los departamentos.*/

select max(presupuesto)
from departamento;

/*4. Calcula el nombre del departamento con mayor presupuesto. Muestra el departamento y su 
presupuesto.*/

select nombre, presupuesto
from departamento
order by presupuesto desc
limit 1;

/*5. Calcula el número total de empleados que hay en la tabla empleado.*/

select count(codigo)
from empleado;

/*6. Calcula el número de empleados que no tienen NULL en su segundo apellido.*/

select count(codigo)
from empleado
where apellido2 is not null;

/*7. Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos 
columnas, una con el nombre del departamento y otra con el número de empleados que tiene 
asignados.*/

select d.nombre, count(e.codigo)
from empleado e
right join departamento d
	on e.codigo_departamento = d.codigo
group by d.nombre, d.codigo
order by count(e.codigo) desc;

/*8. Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe 
tener dos columnas, una con el nombre del departamento y otra con el número de empleados 
que tiene asignados.*/

select d.nombre, count(e.codigo)
from departamento d
join empleado e
	on d.codigo = e.codigo_departamento
group by d.nombre, d.codigo
having count(e.codigo) > 2
order by count(e.codigo) desc;

/*9. Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado 
de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún 
empleado asociado.*/

select d.nombre, count(e.codigo)
from empleado e
right join departamento d
	on e.codigo_departamento = d.codigo
group by d.nombre, d.codigo
order by count(e.codigo) desc; 

/*10. Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un
presupuesto mayor a 2000 euros.*/

select d.nombre, count(e.codigo), d.presupuesto
from empleado e
join departamento d
	on d.codigo = e.codigo_departamento
group by d.nombre, d.codigo
having d.presupuesto > 2000;

/*7.6.3. Base de datos: ventasdb.*/

use ventasdb;

/*1. Calcula la cantidad total que suman todos los pedidos, la media de los pedidos, el valor 
máximo de pedido y el valor del pedido mínimo que aparecen en la tabla pedido.*/

select sum(total), avg(total), max(total), min(total)
from pedido;

/*2. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.*/

select count(distinct id_comercial)
from pedido;

/*3. Calcula el número total de clientes que aparecen en la tabla cliente.*/

select count(id)
from cliente;

/*4. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece 
en la tabla cliente.*/
select * from cliente;

select ciudad, max(categoria)
from cliente
group by ciudad;

/*5. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada 
uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de 
diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo 
valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el 
identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.*/

select c.id, c.nombre, concat_ws(" ", c.apellido1, c.apellido2) as Apellidos, p.fecha, max(p.total)
from cliente c
join pedido p
	on c.id = p.id_cliente
group by c.id, p.fecha
order by c.id asc;

/*6. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada 
uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que 
superen la cantidad de 2000 €*/

select c.nombre, concat_ws(" ", c.apellido1, c.apellido2) as Apellidos, p.fecha, max(p.total)
from cliente c
join pedido p
	on c.id = p.id_cliente
group by c.id, p.fecha
having max(p.total) > 2000
order by c.id asc;

/*7. Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales 
durante el año 2016. Muestra el identificador del comercial, nombre, apellidos y total*/

select p.id_comercial, c.nombre, concat_ws(" ", c.apellido1, c.apellido2) as apellidos, max(p.total), p.fecha
from pedido p
join comercial c
	on p.id_comercial = c.id
where p.fecha like ("2016%")
group by p.id_comercial, p.fecha;

/*8. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total 
de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir 
clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el 
listado indicando que el número de pedidos realizados es 0.*/

select c.id, c.nombre, concat_ws(" ", c.apellido1, c.apellido2) as apellidos, count(p.id)
from cliente c
left join pedido p
	on c.id = p.id_cliente
group by c.id
order by count(p.id) desc;

/*9. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total 
de pedidos que ha realizado cada uno de clientes durante el año 2017.*/

select c.id, c.nombre, concat_ws(" ", c.apellido1, c.apellido2) as apellidos, count(p.id)
from cliente c
left join pedido p
	on c.id = p.id_cliente
	and fecha like "2017%"
group by c.id
order by count(p.id) desc;

/*11. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.*/

select max(total), year(fecha)
from pedido
group by year(fecha)
order by year(fecha);

/*12. Devuelve el número total de pedidos que se han realizado cada año.*/

select count(id), year(fecha)
from pedido
group by year(fecha)
order by year(fecha);
