select @@sql_safe_updates; -- ver seguridad
set sql_safe_updates = 1; -- modo seguro
set sql_safe_updates = 0; -- cambiarla pa reventarlo to

use bibliotecadb;
select * from TAdministrador;

update TAdministrador set apellido1=lower(apellido1) where grupo = "DAW";
update TAdministrador set apellido1=upper(apellido1) where codigo between 1 and 20;

-------------------------------------------------------------

select @@foreign_key_checks;
use 0atorgar;

select * from empleado;
select * from departamento;

start transaction;

delete from departamento where nombre = "Ventas";
delete from departamento where codigo = 4;
delete from departamento where nombre = "Desarrollo";
delete from departamento where codigo = 2;

update departamento set nombre = "DESARROLLO" where codigo = 2;

show create table departamento;
show create table empleado;

-- ¡¡¡TRABAJAR CON CASCADE !!!


-- Primero creamos la nueva clave foranea

alter table empleado
add foreign key (codigo_departamento)
references departamento(codigo)
on update cascade
on delete restrict;

-- Eliminamos la antigua
alter table empleado
drop foreign key empleado_ibfk_1;

-- Podemos trabajar con ella
update departamento set codigo = 20 where codigo = 2;

commit;
rollback;

