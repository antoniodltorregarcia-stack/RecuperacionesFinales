use jardineria;

select * from cliente;
select * from detalle_pedido;

/* 1. Devuelve el nombre del cliente con mayor límite de crédito. */

select concat_ws (" ", apellido_contacto, nombre_contacto) as Cliente
from cliente
where limite_credito = (select max(limite_credito) from cliente);

/*2. Devuelve el nombre del producto que tenga el precio de venta más caro. */

select nombre 
from producto
where precio_venta = (select max(precio_venta) from producto);

/*3. Devuelve el nombre del producto del que se han vendido mas unidades. (Tenga en 
cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de
cada producto a partir de los datos de la tabla detalle_pedido. Una vez que sepa cuál es 
el código del producto, puede obtener su nombre fácilmente). */

insert into detalle_pedido values (1, "FR-103", 960, 25, 6);

select codigo_producto, sum(cantidad)
from detalle_pedido
group by codigo_producto
having sum(cantidad) >= all (select distinct sum(cantidad)
from detalle_pedido
group by codigo_producto);

/* 4. Los clientes cuyo limite de credito sea mayor que los pagos que haya realizado. */

select codigo_cliente, nombre_cliente, limite_credito
from cliente 
where limite_credito > (select sum(total) 
						from pago 
                        where pago.codigo_cliente = cliente.codigo_cliente);
                        
/* 5. Devuelve el producto que mas unidades tiene en stock.*/

select nombre "Nombre Producto" , cantidad_en_stock "Stock"
from producto
where cantidad_en_stock >= (select max(cantidad_en_stock)
							from producto);
                            
/* 6. Devuelve el producto que menos unidades tiene en stock. */

select nombre "Nombre Producto" , cantidad_en_stock "Stock"
from producto
where cantidad_en_stock >= (select min(cantidad_en_stock)
							from producto);
                            
/*7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de 
Alberto Soria. */

select concat_ws(", ", nombre, concat_ws(" ", apellido1,apellido2)) "Empleado", email "Correo electronico"
from empleado
where codigo_jefe = (select codigo_empleado
					from empleado
                    where nombre = "Alberto"
                    and apellido1 = "Soria");