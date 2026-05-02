use tiendadb;
select * from fabricante;
select * from pais;
select * from producto;

/* 1. Queremos disponer en una tabla nueva de los siguientes datos: nombre_fabricante (todos, incluidos
los que no proporcionan ningún producto), nombre_producto y precio. Nota: Una vez creada la tabla nueva se han de insertar
todos los registros en una única operación de inserción. */
/*Antonio De La Torre Garcia*/

create table fabricante_producto (
	nombre_fabricante varchar(100),
    nombre_producto varchar (100),
    precio double
);

insert into fabricante_producto (nombre_fabricante, nombre_producto, precio)
select f.nombre as nombre_fabricante, p.nombre as nombre_producto, p.precio
from fabricante f
left join producto p
	on f.codigo = p.codigo_fabricante;
	
select * from fabricante_producto;

/*2. Eliminar el fabricante Xiaomi. ¿Es posible eliminarlo? Si no fuese posible, 
¿qué cambios debería realizar para que fuese posible borrarlo?*/

/*Antonio De La Torre Garcia*/

/*Buscamos cual es su codigo*/
select codigo, nombre
from fabricante
where nombre = "Xiaomi";

/*Lo eliminamos*/
delete from fabricante
where codigo = 9;
/*Es posible eliminarlo porque no existen productos asociados a Xiaomi*/

/*3. Actualizar el código del fabricante Lenovo al valor 20. 
¿Es posible actualizarlo? Si no fuese posible, realiza los cambios necesarios para la cambiarlo*/

/*Antonio De La Torre Garcia*/

/*Procedemos a eliminar la clave Foranea*/
alter table producto
drop foreign key producto_ibfk_1;

/*Creamos la clave foranea usando el metodo on update cascade*/

alter table producto
add constraint producto_ibfk_1
foreign key (codigo_fabricante)
references fabricante(codigo)
on update cascade;

/*Ahora podríamos actualizar Lenovo sin problema*/
update fabricante
set codigo = 20
where codigo = 2;

/*Comprobamos*/
select codigo, nombre
from fabricante
where codigo = 20;

/* 4. Incrementar los precios de todos los productos en 5 €. */

/*Antonio De La Torre Garcia*/

/*Desactivamos el modo seguro*/
set sql_safe_updates = 0;

/*aumentamos el valor + 5* evitando los null*/
update producto
set precio = precio + 5
where codigo is not null;

/*Volvemos a activarlo*/
set sql_safe_updates = 1;

/*Comprobamos*/
select codigo, nombre, precio
from producto;

/*5. Eliminar todas las impresoras que tienen un precio menor de 200 €.*/

/*Antonio De La Torre Garcia*/

/*Desactivamos el modo seguro*/
set sql_safe_updates = 0;

/*Realizamos la consulta*/
delete from producto
where nombre like "%Impresora%"
and precio < 200
and codigo is not null;

/*Activamos el modo seguro*/
set sql_safe_updates = 1;

/*Comprobamos*/

select nombre, precio
from producto
where nombre like "%Impresora%";