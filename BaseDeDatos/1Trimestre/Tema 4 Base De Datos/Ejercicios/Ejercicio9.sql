/*Ejercicio 9 a Script*/

create database if not exists facturacion;
use facturacion;

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
    nCodigoCliente int not null,
    nDescuento int not null,
    nTotal int not null,
    foreign key (nCodCliente) references TCliente (nCodCliente)
);

create table if not exists TLinea (
	nIdentidicadorID int primary key auto_increment not null,
    nCodigoProductoID int primary key not null,
    nCantidad int not null,
    nPVP int not null,
    nSubTotal int not null,
    foreign key (nIdentidicadorID) references TCompra (nIdentidicadorID),
    foreign key (nCodigoProductoID) references TProducto (nCodigoProductoID)
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

create table if not exists TCategoria (
	nCodigoCategoria int primary key not null,
    cNombreCategoria varchar(15) not null,
    cDescripcion varchar (200) not null
);

create table if not exists TProveedor (
	nCodigoProveedor int primary key not null,
    cNombreProveedor varchar (15) not null,
    cDireccion varchar (15) not null,
    cTlfno varchar(9),
    cWeb varchar(25)
);





