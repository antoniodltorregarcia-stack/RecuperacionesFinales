/*Ejercicio 9 a Script*/

/*IMPORTANTE EL ORDEN DE LAS TABLAS*/
/*No podemos crear tablas con claves foraneas encima de las tablas que se referencian (Cascada)*/

drop database if exists facturacion; /*Eliminamos si existes antes una*/
create database if not exists facturacion;
use facturacion;

/*Podemos dropear las tablas tambien*/
/*
drop table if exists tTlfno;
drop table if exists tLinea;
drop table if exists tCompra;
drop table if exists tProducto;
drop table if exists tCategoria;
drop table if exists tProveedor;
drop table if exists tCliente;
*/


create table if not exists TCliente (
	nCodCliente int primary key auto_increment not null,
    cNombre varchar (15) not null,
    cCalle varchar (25),
    nNumCalle int,
    cComunidad varchar (25) not null,
    cCiudad varchar (15) not null
);

create table if not exists TTlfno (
	cTlfnoID varchar(9) primary key not null,
    nCodCliente int not null,
    foreign key (nCodCliente) references TCliente (nCodCliente)
);

create table if not exists TCompra (
	nIdentificadorID int primary key not null,
    dFecha date not null,
    nCodCliente int not null,
    nDescuento int not null,
    nTotal int not null,
    foreign key (nCodCliente) references TCliente(nCodCliente)
);

create table if not exists TCategoria (
	nCodigoCategoriaID int primary key not null,
    cNombreCategoria varchar(15) not null,
    cDescripcion varchar (200) not null
);

create table if not exists TProveedor (
	nCodigoProveedorID int primary key not null,
    cNombreProveedor varchar (15) not null,
    cDireccion varchar (15) not null,
    cTlfno varchar(9),
    cWeb varchar(25)
);

create table if not exists TProducto (
	nCodigoProductoID int primary key not null,
    cNombreProducto varchar (15) not null,
    nPrecio int not null,
    nStock int not null,
    nCodigoProveedor int,
    nCodigoCategoria int,
    foreign key (nCodigoProveedor) references TProveedor (nCodigoProveedorID),
	foreign key (nCodigoCategoria) references TCategoria (nCodigoCategoriaID)
);

create table if not exists TLinea (
	nIdentificadorID int auto_increment not null,
    nCodigoProductoID int not null,
    nCantidad int not null,
    nPVP int not null,
    nSubTotal int not null,
    primary key (nIdentificadorID,nCodigoProductoID), /*Cuando son ambas claves se crea este especificador*/
    foreign key (nIdentificadorID) references TCompra (nIdentificadorID),
    foreign key (nCodigoProductoID) references TProducto (nCodigoProductoID)
);

insert into tcliente values (null, "Esperanza", "c/competa", 12, "Málaga","Málaga"); /*Insertamos datos*/

/*prueba pa ver si furula*/

-- select * from tcliente;

/*Metemos los inserts*/

/*(añadir 10 productos, son de 3 proveedores,
 4 categorias, 
 10 ventas [TLinea ] alguna de 2 lineas, 
 5 clientes, 
 algun cliente  con 2 o 3 tlfnos*/
 
 
insert into TCliente values (null, "esperanza", "c/ competa", 12, "andalucía", "málaga");
insert into TCliente values (null, "antonio", "av. andalucía", 55, "andalucía", "málaga");
insert into TCliente values (null, "lucía", "c/ granada", 8, "andalucía", "málaga");
insert into TCliente values (null, "marcos", "c/ sevilla", 22, "andalucía", "málaga");
insert into TCliente values (null, "sofía", "c/ córdoba", 31, "andalucía", "málaga");

insert into TTlfno values ("600111222", 1);
insert into TTlfno values ("600333444", 1);
insert into TTlfno values ("611222333", 2);
insert into TTlfno values ("611444555", 2);
insert into TTlfno values ("611666777", 2);
insert into TTlfno values ("622111333", 3);
insert into TTlfno values ("633222444", 4);
insert into TTlfno values ("644555666", 5);
insert into TTlfno values ("644777888", 5);

insert into TCategoria values (1, "tecnología", "productos electrónicos y gadgets");
insert into TCategoria values (2, "hogar", "artículos para el hogar");
insert into TCategoria values (3, "oficina", "material de oficina");
insert into TCategoria values (4, "gaming", "productos para videojuegos");

insert into TProveedor values (1, "techcorp", "c/ silicon", "952111222", "techcorp.com");
insert into TProveedor values (2, "homeplus", "c/ hogar", "952333444", "homeplus.es");
insert into TProveedor values (3, "gameworld", "c/ gamer", "952555666", "gameworld.es");

insert into TProducto values (1, "teclado", 25, 100, 1, 3);
insert into TProducto values (2, "ratón", 15, 150, 1, 3);
insert into TProducto values (3, "monitor 24", 120, 40, 1, 1);
insert into TProducto values (4, "aspiradora", 90, 30, 2, 2);
insert into TProducto values (5, "cafetera", 45, 60, 2, 2);
insert into TProducto values (6, "silla gaming", 150, 20, 3, 4);
insert into TProducto values (7, "auriculares", 35, 80, 3, 4);
insert into TProducto values (8, "alfombrilla", 10, 200, 3, 4);
insert into TProducto values (9, "lámpara led", 20, 90, 2, 2);
insert into TProducto values (10, "usb 64gb", 12, 300, 1, 1);

insert into TCompra values (1, "2025-01-10", 1, 0, 0);
insert into TCompra values (2, "2025-01-12", 2, 5, 0);
insert into TCompra values (3, "2025-01-15", 3, 0, 0);
insert into TCompra values (4, "2025-01-18", 4, 10, 0);
insert into TCompra values (5, "2025-01-20", 5, 0, 0);
insert into TCompra values (6, "2025-01-22", 1, 0, 0);
insert into TCompra values (7, "2025-01-25", 2, 5, 0);
insert into TCompra values (8, "2025-01-28", 3, 0, 0);
insert into TCompra values (9, "2025-01-30", 4, 0, 0);
insert into TCompra values (10, "2025-02-01", 5, 0, 0);

insert into TLinea values (1, 1, 1, 25, 25);
insert into TLinea values (1, 10, 2, 12, 24);
insert into TLinea values (2, 3, 1, 120, 120);
insert into TLinea values (3, 4, 1, 90, 90);
insert into TLinea values (3, 9, 2, 20, 40);
insert into TLinea values (4, 6, 1, 150, 150);
insert into TLinea values (5, 7, 1, 35, 35);
insert into TLinea values (6, 2, 3, 15, 45);
insert into TLinea values (7, 5, 1, 45, 45);
insert into TLinea values (8, 8, 2, 10, 20);
insert into TLinea values (9, 3, 1, 120, 120);
insert into TLinea values (10, 6, 1, 150, 150);
insert into TLinea values (10, 7, 1, 35, 35);


/*
(copiar)  --> origen --> destino
c:\>scp --> ejercicio9.sql --> 0atorgar148.113.42.124:/C:\Users\anton\Desktop\RecuperacionesFinales\BaseDeDatos\1Trimestre\Tema 4 Base De Datos\Ejercicios
*/

describe TCliente;