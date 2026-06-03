/*Ejercicios T12*/

use jardineria;

/*1. Consulte cuáles son los índices que hay en la tabla producto utilizando las dos
instrucciones SQL que nos permiten obtener esta información de la tabla*/

describe producto;
show index from producto;

/*2. Haga uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas
y diga cuál de las dos consultas realizará menos comparaciones para encontrar el producto
que estamos buscando, indica:  ¿Cuántas comparaciones se realizan en cada caso? ¿Por qué?
a) Código de producto: OR-114.
b) Nombre del producto: “Evonimus Pulchellus”*/

explain 
	select codigo_producto
	from producto
	where codigo_producto like "OR-114";
    
-- 1 row
-- codigo_producto esta indexado como vimos en el ejer1 por esto tarda mucho menos
explain
    select nombre 
    from producto
    where nombre like "Evonimus Pulchellus";
    
-- 276 rows
-- nombre no tiene indice, tarda mas en buscarlo

/*3. Suponga que estamos trabajando con la base de datos jardineria y queremos saber
optimizar las siguientes consultas. ¿Cuál de las dos sería más eficiente? ¿Qué se podría
hacer para mejorarlas? Se recomienda hacer uso de EXPLAIN para obtener información sobre
cómo se están realizando las consultas.*/

explain
	SELECT AVG(total)
	FROM pago
	WHERE YEAR(fecha_pago) = 2008;
    
-- Menos eficiente, calcula el year en cada fila.

explain
	SELECT AVG(total)
	FROM pago
	WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';
    
-- Mas eficiente, el rango realiza menos trabajo por fila, no calcula ni convierte como el anterior

/*4. Optimiza la siguiente consultas creando índices cuando sea necesario. Se recomienda hacer
uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas.*/

explain
SELECT *
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE 'A%';

-- Creamos un indice nombre_cliente

create index idx_cliente_nombre on cliente (nombre_cliente);

-- Ahora la consultas es mucho mas rapuda e eficiente

/*5. ¿Por qué no es posible optimizar el tiempo de ejecución de las siguientes consultas, incluso
haciendo uso de índices normales? Prueba a optimizar dichas consultas con el índice
adecuado*/

explain
	SELECT *
	FROM cliente INNER JOIN pedido
		ON cliente.codigo_cliente = pedido.codigo_cliente
	WHERE cliente.nombre_cliente LIKE '%A%';

-- Usa % con lo que obliga a mysql a leer todas las lineas de nombre cliente que empiecen por A
-- En el de abajo ocurre igual
explain
	SELECT *
	FROM cliente INNER JOIN pedido
		ON cliente.codigo_cliente = pedido.codigo_cliente
	WHERE cliente.nombre_cliente LIKE '%A';
    
/*
'A%' → sí usa índice

'AB%' → sí usa índice

'A' → sí usa índice

'%A%' → ❌ NO usa índice

'%A' → ❌ NO usa índice
*/