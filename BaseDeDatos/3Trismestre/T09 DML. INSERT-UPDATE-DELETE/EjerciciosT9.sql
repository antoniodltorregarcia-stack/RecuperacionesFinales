-- Ejercicios Tema 9

use tiendadb;
select * from fabricante;

/*1. Inserta un nuevo fabricante indicando su código y su nombre.*/

describe fabricante;

-- Modificamos fabricante porque el valor de pais no puede estar vacio
alter table fabricante modify pais int null;

-- insertamos los datos
insert into fabricante (codigo,nombre) values (null, "Juan");

/*2. Inserta un nuevo fabricante indicando solamente su nombre.*/

insert into fabricante (nombre) values ("Luis");
-- Automaticamente nos genera un código ya que es auto_increment

/*3. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción
debe incluir: código, nombre, precio y código_fabricante.*/

select * from producto;
describe producto;

insert into producto values ("123ER", "Alfombrilla Gaming", 9.99, 1);

/*4. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción
debe incluir: nombre, precio y código_fabricante.*/

-- No se puede insertar sin el codigo ya que es obligatorio por ser clave primaria
insert into producto (nombre, precio, codigo_fabricante) values ("Ratón toGuapo", 20.50, 8); 

/*5. Crea una nueva tabla con el nombre fabricante_productos que tenga las siguientes columnas: 
nombre_fabricante, nombre_producto y precio. Una vez creada la tabla inserta todos los 
registros de la base de datos tienda en esta tabla haciendo uso de única operación de inserción*/

create table fabricante_productos (
	nombre_fabricante varchar(100), 
    nombre_producto varchar(100),
    precio double
);

insert into fabricante_productos (nombre_fabricante, nombre_producto, precio) -- No son necesarios porque los 
select 
    f.nombre as nombre_fabricante,
    p.nombre as nombre_producto,
    p.precio
from fabricante f
left join producto p
       on f.codigo = p.codigo_fabricante;

/*6. Actualiza el precio de todos los productos sumándole 5 € al precio actual.*/       

select * from fabricante_productos;
update fabricante_productos set precio = precio + 5;

/*7. Elimina todas las impresoras que tienen un precio menor de 200 €.*/

delete from fabricante_productos where nombre_producto like "%impresora%";

/*8. Elimina el fabricante Asus. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería
realizar para que fuese posible borrarlo?*/

-- No nos deja porque los productos estan referenciados a el

delete from fabricante where nombre = "Asus";

-- Primero borramos los productos de Asus

delete from producto where codigo_fabricante = (select codigo
												from fabricante
                                                where nombre = "Asus");
                                                
-- Ahora si podemos borrarlo

delete from fabricante where nombre = "Asus";

/*9. Elimina el fabricante Xiaomi. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios 
debería realizar para que fuese posible borrarlo?*/

delete from fabricante where nombre = "Xiaomi";

-- No tiene productos asi que si es posible eliminarlo

/*10. Actualiza el código del fabricante Lenovo y asígnale el valor 20. ¿Es posible actualizarlo? Si 
no fuese posible, realiza los cambios necesarios para que fuese actualizado.*/

update fabricante set codigo = 20 where nombre = "Lenovo";

select * from producto;
select * from fabricante;

/*11. Actualiza el código del fabricante Huawei y asígnale el valor 30. ¿Es posible actualizarlo? Si 
no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?*/

update producto set codigo_fabricante = null where codigo_fabricante = (select codigo
																		from fabricante
                                                                        where nombre = "Huawei");
                                                                        
update fabricante set codigo = 30 where nombre = "Huawei";

/*12. ¿Hay algún producto que no tenga asignado fabricante? Realiza las siguientes acciones:
a. Modifica el diseño de las tablas para que permita tener productos sin fabricantes. 
b. Cambia la configuración que sea necesaria para que en caso de eliminar un fabricante 
asigne nulo a los posibles productos que nos ofrecía y si cambiamos el código del 
fabricante lo actualice en los productos. 
c. Una vez hecho el paso anterior, elimina “Lenovo” y cambia el código a “Asus” a 50.
d. Comprueba los resultados: Listado de todos los productos y sus proveedores*/

describe producto;

-- a)
alter table producto modify codigo_fabricante int not null;

-- b)

-- eliminamos la clave foranea
alter table producto drop foreign key producto_ibfk_1;

-- actualizamos en cascada
alter table producto add constraint producto_ibfk_1 
foreign key (codigo_fabricante) references fabricante(codigo)
on delete set null
on update cascade;

-- c)

delete from fabricante where nombre = "Lenovo";

update fabricante set codigo = 50 where nombre = "Asus";


-- d)

select p.nombre as producto, p.precio, f.nombre as fabricante
from producto p
left join fabricante f
	on p.codigo_fabricante = f.codigo;