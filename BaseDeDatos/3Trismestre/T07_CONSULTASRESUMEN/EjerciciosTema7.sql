use 0atorgar;
select * from pais;
select * from fabricante;
select * from producto;

/* 7.6.1. Base de datos: tiendadb. */

/* 1 Calcula el número total de fabricantes que hay en la tabla fabricante. */

select count(*) as "Total de Fabricantes"
from fabricante;

/* 2 Calcula el número de valores distintos de código de fabricante aparecen en la tabla 
productos. */

select count( distinct codigo_fabricante) as "Número de fabricantes"
from producto;


/* 3 Calcula el precio medio, el máximo y el mínimo de todos los fabricantes. */

select 
avg(precio) as "Precio medio" ,  
max(precio) as "Precio máximo" , 
max(precio) as "Precio máximo" , 
min(precio) as "Precio Míninmo"
from producto;

/* 4 Lista el nombre y el precio del producto más caro. */

select distinct nombre as "Nombre del producto" , precio as "Precio del producto"
from producto
where precio = (select max(precio)
				from producto
                );

/* 5 Calcula el número de productos que tiene el fabricante Asus. */

select count(*) as "Total productos de Asus"
from producto
where codigo_fabricante = ( select codigo
							from fabricante
                            where nombre = "Asus"
                            );

/* 6 Calcula la media del precio de todos los productos del fabricante Asus. */

select avg(precio) as "Precio medio Asus"
from producto
where codigo_fabricante = ( select codigo
							from fabricante
                            where nombre = "Asus"
                            );

/* 7 Calcula el precio más barato de todos los productos del fabricante Asus. */

select min(precio) as "Precio más barato de Asus"
from producto
where codigo_fabricante = ( select codigo
							from fabricante
                            where nombre = "Asus"
                            );
                            
/* 8 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos 
que tiene el fabricante Crucial */

select max(precio) as "Precio máximo", min(precio) as "Precio mínimo", count(*) as "Número de productos"
from producto
where codigo_fabricante = ( select codigo
							from fabricante
                            where nombre = "Crucial"
                            );
                            
/* 9 Muestra el número total de productos que tiene cada uno de los fabricantes. El listado 
también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará
dos columnas, una con el nombre del fabricante y otra con el número de productos que 
tiene. Ordene el resultado descendentemente por el número de productos. */

select f.nombre as "Nombre del fabricante" , count(p.codigo) as "Número de productos"
from fabricante f
left join producto p
	on f.codigo = p.codigo_fabricante
group by f.codigo, f.nombre
order by count(p.codigo) desc;

/* 10 Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, 
precio medio y el número total de productos de los fabricantes que tienen un precio 
medio superior a 200€. Es necesario mostrar el nombre del fabricante. */

select f.nombre as "Nombre fabricante" , max(p.precio) as "Precio máximo" , 
min(p.precio) as "Precio mínimo" , count(p.codigo) as "Número de productos"
from fabricante f
left join producto p
	on f.codigo = p.codigo_fabricante
group by f.codigo, f.nombre
having avg(p.precio) > 200;

/* 11 Calcula el número de productos que tienen un precio mayor o igual a 180€. */

select count(*) as "Número de productos"
from producto
where precio  >= 180;

/* 12 Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 
180€. */

select f.nombre as "Fabricante" , count(p.precio) as "Número productos mayores a 180€"
from fabricante f
left join producto p
	on f.codigo = p.codigo_fabricante
    and p.precio >= 180
group by f.codigo, f.nombre;

/* 13 Lista el precio medio los productos de cada fabricante, mostrando solamente el código 
del fabricante. */

select codigo_fabricante as "Codigo del fabricante", avg(precio) as "Precio medio"
from producto
group by codigo_fabricante;

/* 14 Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre 
del fabricante. */

select f.nombre as Fabricante, avg (p.precio) as "Precio de media"
from fabricante f
join producto p 
on f.codigo = p.codigo_fabricante
group by f.nombre;

/*  15 Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o 
igual a 150€. */

select avg(p.precio) as precio , f.nombre
from producto p join fabricante f on p.codigo_fabricante = f.codigo
group by f.codigo
having avg (p.precio) >= 150
order by f.codigo;

/* 16 Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos. */

select f.nombre as Fabricante
from producto p join fabricante f on p.codigo_fabricante=f.codigo
group by f.codigo
having count(p.codigo)>= 2;

/* 17 Devuelve un listado con los nombres de los fabricantes y el número de productos que 
tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre
de los fabricantes que no tienen productos que cumplan la condición.*/

select f.nombre "Fabricante" , count(p.codigo) "Cantidad"
from producto p join fabricante f on p.codigo_fabricante=f.codigo
where p.precio>=220
group by f.codigo
order by 2;

/*18 Devuelve un listado con los nombres de los fabricantes y el número de productos que 
tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre 
de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un 
precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el 
número de productos. (ha de hacerse con UNION)*/

select f.nombre "Fabricante" , count(p.codigo) "Cantidad"
from producto p join fabricante f on p.codigo_fabricante=f.codigo
where p.precio>=220
group by f.codigo

union

select distinct f.nombre "Fabricante", 0 "Cantidad"
from producto p join fabricante f on p.codigo_fabricante=f.codigo
where f.codigo not in (select f.codigo
from producto p right join fabricante f on p.codigo_fabricante=f.codigo
where p.precio>=220
group by f.codigo);

/* 19 Devuelve un listado con los nombres de los fabricantes donde la suma del precio de 
todos sus productos es superior a 1000 €. */

select f.nombre "fabricante", sum(p.precio) "Total"
from producto p join fabricante f on codigo_fabricante=f.codigo
group by f.nombre having sum(p.precio)>1000;

/* 20 Ejercicio extra del profesor */

insert into producto values ("SAM04", "tv 700 pulg", 700, 4);

select f.nombre as "nombre fabricante", p.precio as "precio", p.nombre as "nombre producto"
from producto p join fabricante f on p.codigo_fabricante = f.codigo 
where p.precio = (
select max(p.precio)
from producto p
where p.codigo_fabricante = f.codigo)
order by 3;

/* 7.6.2. Base de datos: empleadodb */

select * from departamento;
select * from empleado;

/* 1. Calcula la suma, media, máximo y mínimo del presupuesto de todos los departamentos. */

select sum(presupuesto), avg(presupuesto), max(presupuesto), min(presupuesto)
from departamento;

/*2. Calcula el nombre del departamento con menor presupuesto. Muestra el departamento y su 
presupuesto.*/

select nombre, presupuesto
from departamento
where presupuesto = (select min(presupuesto)
					from departamento);

/*3. Calcula el valor máximo del presupuesto de todos los departamentos.*/

select sum(presupuesto)
from departamento;

/*4. Calcula el nombre del departamento con mayor presupuesto. Muestra el departamento y su 
presupuesto.*/

select nombre, presupuesto
from departamento
where presupuesto = (select max(presupuesto)
					from departamento);
                    
/*5. Calcula el número total de empleados que hay en la tabla empleado.*/

select count(*)
from empleado;

/*6. Calcula el número de empleados que no tienen NULL en su segundo apellido.*/

select count(*)
from empleado
where apellido2 is not null;

/*7. Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos 
columnas, una con el nombre del departamento y otra con el número de empleados que tiene 
asignados.*/

select d.nombre "Nombre Departamento", (select count(*)
										from empleado e
										where e.codigo_departamento = d.codigo) as "Numero Empleados"
from departamento d;

/*8. Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe 
tener dos columnas, una con el nombre del departamento y otra con el número de empleados 
que tiene asignados.*/

select d.nombre "Nombre Departamento", 
(select count(*)
from empleado e
where e.codigo_departamento = d.codigo) as numero_empleados
from departamento d
having numero_empleados > 2;

/* 9. Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado 
de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún 
empleado asociado.*/

select d.nombre as nombre_departamento, 
(select count(*)
from empleado e
where e.codigo_departamento = d.codigo) as numero_empleados
from departamento d;

/*10. Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un
presupuesto mayor a 2000 euros.*/

select d.nombre as nombre_departamento,
(select count(*)
from empleado e
where e.codigo_departamento = d.codigo) as numero_empleados
from departamento d
where d.presupuesto > 2000;

/* 7.6.3. Base de datos: ventasdb. */

select * from cliente;
select * from comercial;
select * from pedido;

/*1. Calcula la cantidad total que suman todos los pedidos, la media de los pedidos, el valor 
máximo de pedido y el valor del pedido mínimo que aparecen en la tabla pedido.*/

select round(sum(total),2) as TotalPedidos, round(avg(total),2) as MediaPedidos, max(total) as MayorCantPedidos,
min(total) as MinimaCantPedidos
from pedido;

/*2. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.*/

select count(distinct id_comercial) as CantidadComerciales
from pedido;
                        
/* 3. Calcula el número total de clientes que aparecen en la tabla cliente. */