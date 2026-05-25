-- Tema 9 UML

use tiendadb;

-- Mostrar descripcion de los atributos de la tabla
describe producto; 

-- comprobar descripcion creacion de tabla
show create table producto;


-- insert
insert into producto (codigo, nombre, precio) values ("23eD", "Luis Miguel", 2.80);

insert into fabricante values (15, "Dig_Málaga", 2);
insert into fabricante values (null, "Dig_Málaga", 2);

select * from producto;


-- añadir a fabricante y borrarlo
describe fabricante;
show create table fabricante;

insert into fabricante values (15, "Dig_Málaga", 2);
insert into fabricante values (null, "Tilines_Digitales", 2);

delete from fabricante where codigo in (15,16);

select * from fabricante;

-- añadir paises y reorganizar el autoincrement

select * from pais;
show create table pais;
describe pais;

insert into pais (nombre) values ("Portugal"),
							     ("Francia"),
                                 ("Alemania"),
                                 ("Reino Unido"),
                                 ("Italia");
insert into pais values (20, "Cánada");
delete from pais where codigo in (7,9,10);

drop table nuevo_pais;

create table nuevo_pais (
	id int auto_increment not null,
    nom_pais varchar(20) not null,
    primary key (id)
);

insert into nuevo_pais (antigua_clave,nom_pais) select * from pais order by 1;

select * from nuevo_pais;
show create table nuevo_pais;

select nombre from pais order by 1; -- Comprobamos y ordenamos

insert into nuevo_pais (nom_pais) select nombre from pais order by 1; -- lo añadimos a la nueva tabla

alter table nuevo_pais auto_increment = 25; -- cambiar el autoincremente en caso de problemas

-- Mostramos su antigua clave

drop table nuevo_pais;

create table nuevo_pais (
	id int auto_increment not null,
    nom_pais varchar(20) not null,
    antigua_clave int,
    primary key (id)
);

insert into nuevo_pais (antigua_clave,nom_pais) select * from pais order by 1;

-- Modifica los precios de los productos Asus y hewlett pack(HWk1) un 10%
select * from producto;

update producto set precio = precio * 1.1 where codigo_fabricante in 
																	(select codigo 
																	from fabricante
																	where nombre in ("Asus","Hewlett-Packard"));

select @@sql_safe_updates; -- ver seguridad
set sql_safe_updates = 0; -- cambiarla pa reventarlo to


