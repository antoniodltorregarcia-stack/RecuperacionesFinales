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
select * from empleado;

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
                        
/*5. Devuelve el producto que mas unidades tiene en stock.*/

select *
from producto
where cantidad_en_stock = (select max(cantidad_en_stock)
						   from producto);
                           
/*6. Devuelve el producto que menos unidades tiene en stock.*/

select * 
from producto
where cantidad_en_stock = (select min(cantidad_en_stock)
						   from producto);

/*7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de 
Alberto Soria.*/

select nombre, concat_ws(" ", apellido1, apellido2) as apellidos, email
from empleado
where codigo_jefe = (select codigo_empleado
					 from empleado
                     where concat_ws(" ", nombre, apellido1,apellido2) like "Alberto Soria%");
                     

-- 8.5.3. Subconsultas con IN y NOT IN

-- Base de datos: tiendadb.

use tiendadb;
select * from producto;


/*1. Devuelve los nombres de los fabricantes que tienen productos asociados. */

select nombre
from fabricante
where codigo in (select codigo_fabricante
				 from producto);

/*2. Devuelve los nombres de los fabricantes que no tienen productos asociados.*/

select nombre
from fabricante
where codigo not in (select codigo_fabricante
					 from producto
                     where codigo_fabricante is not null);
                     
                     
-- Base de datos: empleadodb.

use empleadodb;

/*1. Devuelve los nombres de los departamentos que tienen empleados asociados.*/

select nombre
from departamento
where codigo in (select codigo_departamento
				 from empleado);

/*2. Devuelve los nombres de los departamentos que no tienen empleados asociados.*/

select nombre
from departamento
where codigo not in (select codigo_departamento
					 from empleado
                     where codigo_departamento is not null);
  
  
-- Base de datos: ventadb.

use ventasdb;

/*1. Devuelve un listado de los clientes que no han realizado ningún pedido.*/

select *
from cliente
where id not in (select id_cliente
				 from pedido
                 where id_cliente is not null);
                 
/*2. Devuelve un listado de los comerciales que no han realizado ningún pedido.*/

select *
from comercial
where id not in (select id_comercial
				 from pedido
                 where id_comercial is not null);
                 
                 
-- 8.5.4. Subconsultas con EXISTS y NOT EXISTS.

-- Base de datos: tiendadb.

use tiendadb;

/*1. Devuelve los nombres de los fabricantes que tienen productos asociados. */

select nombre
from fabricante f
where exists (select 1
			  from producto p
			  where f.codigo = p.codigo_fabricante);

/*2. Devuelve los nombres de los fabricantes que no tienen productos asociados.*/

select nombre
from fabricante f
where not exists (select 1 -- El select no se tiene en cuenta
				  from producto p
                  where p.codigo_fabricante = f.codigo );
                  
                  
-- Base de datos: empleadodb.

use empleadodb;

/*1. Devuelve los nombres de los departamentos que tienen empleados asociados.*/

select nombre
from departamento d
where exists (select 1
			  from empleado e
              where e.codigo_departamento = d.codigo);
              
              
/*2. Devuelve los nombres de los departamentos que no tienen empleados asociados.*/

select nombre
from departamento d
where not exists (select 1
			  from empleado e
              where e.codigo_departamento = d.codigo);
              

-- Base de datos: ventasdb.

use ventasdb;

/*1. Devuelve un listado de los clientes que no han realizado ningún pedido.*/              

select *
from cliente c
where not exists (select 1
				  from pedido p
                  where c.id = p.id_cliente);


/*2. Devuelve un listado de los comerciales que no han realizado ningún pedido.*/

select *
from comercial c
where not exists (select 1
				  from pedido p
                  where c.id = p.id_comercial);
                  
-- Base de datos: Jardinería.

use jardineria;

/*1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún 
pago.*/

select *
from cliente c
where not exists (select 1
				  from pago p
                  where c.codigo_cliente = p.codigo_cliente);
                  
/*2. Devuelve un listado que muestre solamente los clientes que sí han realizado ningún 
pago.*/

select *
from cliente c
where exists (select 1
				  from pago p
                  where c.codigo_cliente = p.codigo_cliente);
                  
/*3. Devuelve un listado de los productos que nunca han aparecido en un pedido.*/

select *
from producto pr
where not exists (select 1
			      from detalle_pedido d
                  where pr.codigo_producto = d.codigo_producto);
                  
/*4. Devuelve un listado de los productos que han aparecido en un pedido alguna vez*/

select *
from producto pr
where  exists (select 1
			   from detalle_pedido d
			   where pr.codigo_producto = d.codigo_producto);