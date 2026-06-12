use jardineria;

/* Ejercicio 2 */

select c.codigo_cliente, c.nombre_cliente, p.total 
from cliente c, pago p 
where c.codigo_cliente = p.codigo_cliente 
and p.total > (select avg(total) 
			   from pago)
group by codigo_cliente, p.total;


/* Ejercicio 3 */

select concat_ws(' ', nombre, apellido1, apellido2) as nombre_jefe,
	   (select count(*) 
	    from empleado 
	    where empleado.codigo_jefe = jefe.codigo_empleado) as cantidad_empleados
from empleado jefe
where jefe.codigo_empleado in (select codigo_jefe 
							   from empleado)
order by cantidad_empleados desc, nombre_jefe asc;


/*Ejercicio 4*/

select e.codigo_empleado, concat_ws(" ", e.apellido1, e.apellido2, e.nombre) as nombre_empleado,
e.codigo_oficina, o.ciudad
from empleado e, oficina o
where e.codigo_oficina = (select o.codigo_oficina
						   from oficina o
                           where o.pais like "%España%" or "%Francia%")
group by e.codigo_empleado, e.codigo_oficina, o.ciudad 
order by e.codigo_empleado asc;

/*Ejercicio 5*/

select c.codigo_cliente, c.nombre_cliente
from cliente c
where not exists (select 1
				  from pedido p
				  where p.codigo_cliente = c.codigo_cliente);
                  
/* Ejercicio 6*/

alter table pedido
add fulltext indice_comentarios (comentarios);

explain 
select *
from pedido
where comentarios like '%retraso%';



/* Ejercicio 7*/

start transaction;

create table posibles_clientes (
	codigo_cliente int primary key auto_increment,
    nombre_cliente varchar(50) not null,
    nombre_contacto VARCHAR(30) DEFAULT NULL,
	apellido_contacto VARCHAR(30) DEFAULT NULL,
	telefono VARCHAR(15) NOT NULL
);

select * from posibles_clientes;

insert into posibles_clientes (nombre_cliente, nombre_contacto, apellido_contacto, telefono)
select c.nombre_cliente, c.nombre_contacto, c.apellido_contacto, c.telefono
from cliente c
where not exists (select 1
				  from pedido p
                  where p.codigo_cliente = c.codigo_cliente);
				
set sql_safe_updates = 0;

delete from cliente c
where not exists (select 1
				  from pedido p
				  where p.codigo_cliente = c.codigo_cliente);

select * from cliente;

rollback;

commit;