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




