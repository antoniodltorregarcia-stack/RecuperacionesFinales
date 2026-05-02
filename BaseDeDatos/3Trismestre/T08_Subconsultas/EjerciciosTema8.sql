/*8.5.1. Subconsultas en general.*/

select * from pais;
select * from fabricante;
select * from producto;

/*1. Devuelve todos los productos del fabricante “Lenovo”*/

select * 
from producto
where codigo_fabricante = (select codigo
						  from fabricante
                          where nombre like "%Lenovo%");
                          
/*2. Devuelve todos los datos de los productos que tienen el mismo precio o superior al 
producto más caro del fabricante “Asus”.*/

select *
from producto
where precio >= (select max(precio)
				from producto
                where codigo_fabricante = (select codigo
										   from fabricante
                                           where nombre = "Asus")
				);
                
                
/*3. Lista el nombre del producto más caro del fabricante Lenovo.*/

select nombre
from producto
where precio = (select max(precio)
				from producto
                where codigo_fabricante = (select codigo
											from fabricante
                                            where nombre = "Lenovo")
				);
                
/*4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.*/

select nombre
from producto
where precio = (select min(precio)
				from producto
                where codigo_fabricante = (select codigo
											from fabricante
                                            where nombre = "Hewlett-Packard")
				);
                
/*5. Lista todos los productos del fabricante Asus, Hewlett-Packard, Lenovo que tienen un 
precio superior al precio medio de todos sus productos.*/

select nombre
from producto
where codigo_fabricante in (select codigo
							from fabricante
                            where nombre in ("Asus", "Hewlett-Packard", "Lenovo")
and precio > (select avg(precio)
			  from producto
              where codigo_fabricante in (select codigo
							from fabricante
                            where nombre in ("Asus", "Hewlett-Packard", "Lenovo")
										 )
			 )
);


/*Base de datos: empleadodb.*/

select * from departamento;
select * from empleado;

/*1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas.*/

select *
from empleado
where codigo_departamento = (select codigo
							from departamento
                            where nombre = "Sistemas");
                            
/*2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene 
asignada.*/

select nombre, presupuesto
from departamento
where presupuesto = (select max(presupuesto)
					from departamento);
                    
                    
/*3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene 
asignada.*/

select nombre, presupuesto
from departamento
where presupuesto = (select min(presupuesto)
					from departamento);

/*8.5.2. Subconsultas con ALL y ANY.*/

select * from pais;
select * from fabricante;
select * from producto;

/*1. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, 
ORDER BY ni LIMIT.*/

select *
from producto
where precio >= all (select precio
					from producto
                    where precio is not null);
        
/*2. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, 
ORDER BY ni LIMIT*/

select *
from producto
where precio <= all (select precio
					from producto
                    where precio is not null);

/*3. Devuelve los nombres de los fabricantes que tienen productos asociados.*/

select *
from fabricante
where codigo = any (select codigo_fabricante
					from producto
					where codigo_fabricante is not null);
                    
/*4. Devuelve los nombres de los fabricantes que no tienen productos asociados.*/

select *
from fabricante
where codigo != all (select codigo_fabricante
					from producto
					where codigo_fabricante is not null);
                    
/*8.5.3. Subconsultas con IN y NOT IN.*/

select * from pais;
select * from fabricante;
select * from producto;

/*1. Devuelve los nombres de los fabricantes que tienen productos asociados.*/

select *
from fabricante
where codigo in (select codigo_fabricante
				from producto
                where codigo_fabricante is not null);
                
/*2. Devuelve los nombres de los fabricantes que no tienen productos asociados. */
                
select *
from fabricante f
where exists (select codigo_fabricante
				from producto p
                where p.codigo_fabricante = f.codigo);
