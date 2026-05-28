-- Tema 8 Ejercicios

-- 8.5.1. Subconsultas en general.

use tiendadb;
select * from producto;
select * from fabricante;

/*1. Devuelve todos los productos del fabricante “Lenovo”.*/

select * 
from producto
where codigo_fabricante in (select codigo
						   from fabricante
                           where nombre = "Asus");
                           
/*2. Devuelve todos los datos de los productos que tienen el mismo precio o superior al 
producto más caro del fabricante “Asus”.*/

select * 
from producto
where precio >= (select max(precio)
				 from producto
                 where codigo_fabricante in (select codigo
											 from fabricante
                                             where nombre = "Asus"));
                                             
/*3. Lista el nombre del producto más caro del fabricante Asus.*/

select nombre, precio
from producto
where precio = (select max(precio)
						   from producto
                           where codigo_fabricante = (select codigo
													  from fabricante
                                                      where nombre = "Asus"));
                                                      
/*4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.*/

select nombre, precio
from producto
where precio = (select min(precio)
				from producto
                where codigo_fabricante = (select codigo
										   from fabricante
                                           where nombre = "Hewlett-Packard"));
                                           
/*5. Lista todos los productos del fabricante Asus, Hewlett-Packard, Lenovo que tienen un 
precio superior al precio medio de todos sus productos.*/

select *
from producto
where codigo_fabricante in (select codigo
							from fabricante
                            where nombre in ( "Asus", "Hewlett-Packard", "Lenovo")
)
and precio > (select avg(precio)
			  from producto
              where codigo_fabricante in (select codigo
										  from fabricante));
       
-- Base de datos: empleadodb.

use empleadodb;

select * from empleado;
select * from departamento;

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
where presupuesto in (select max(presupuesto)
					  from departamento);
                      
                      
/*3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene 
asignada.*/

select nombre, presupuesto
from departamento
where presupuesto in (select min(presupuesto)
					  from departamento);
                      
-- Base de datos: ventasdb.

use ventasdb;
select * from cliente;
select * from comercial;
select * from pedido;

/*1. Devuelve un listado con todos los pedidos que ha realizado Araceli Salas Díaz. */

select *
from pedido
where id_cliente in (select id
					 from cliente
                     where nombre like "Araceli"
                     and apellido1 like "Salas"
                     and apellido2 like "Díaz");
                     
/*2. Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez 
Vega.*/

select count(id_comercial) as "Nº Pedidos"
from pedido
where id_comercial in (select id
					   from comercial
                       where concat_ws(" ", nombre, apellido1, apellido2) = "Daniel Sáez Vega");
                       
/*3. Devuelve los datos del cliente que realizó el pedido más caro en el año 2019.*/

select *
from cliente
where id in (select id_cliente
			from pedido
            where fecha like "2019%"
            and total = (select max(total)
						 from pedido
                         where fecha like "2019%"));

/*4. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe 
Ruiz Santana.*/

select fecha, total, id_cliente
from pedido
where total = (select min(total)
			   from pedido
               where id_cliente = (select id
								   from cliente
								   where concat_ws(" ", nombre, apellido1, apellido2) 
                                   like "Pepe Ruiz Santana"));

/*5. Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que 
han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio 
de los pedidos realizados durante ese mismo año.*/

select c.*, p.*
from cliente c, pedido p
where total >= (select avg(total)
				from pedido)
and fecha in (select fecha
			 from pedido
             where fecha like "2017%");

-- Base de datos: jardineria.

use jardineria;
select * from cliente;
select * from producto;
select * from detalle_pedido;
select * from pago;

/*1. Devuelve el nombre del cliente con mayor límite de crédito*/

select nombre_cliente
from cliente
where limite_credito = (select max(limite_credito)
						from cliente);
                        
/*2. Devuelve el nombre del producto que tenga el precio de venta más caro.*/

select nombre
from producto
where precio_venta = (select max(precio_venta)
					  from producto);
                      
/*3. Devuelve el nombre del producto del que se han vendido mas unidades. (Tenga en 
cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de
cada producto a partir de los datos de la tabla detalle_pedido. Una vez que sepa cuál es 
el código del producto, puede obtener su nombre fácilmente).*/


select nombre
from producto	
where codigo_producto in (select codigo_producto
						 from detalle_pedido
                         where cantidad in (select max(cantidad)
										   from detalle_pedido));
                                           
                                           
/*4. Los clientes cuyo limite de credito sea mayor que los pagos que haya realizado.*/

select *
from cliente c
where limite_credito > (select sum(total)
						from pago p
                        where p.codigo_cliente = c.codigo_cliente);