-- Practica savepoints

DROP DATABASE IF EXISTS test;
CREATE DATABASE test CHARACTER SET utf8mb4;
USE test;
CREATE TABLE producto (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE
);

INSERT INTO producto (id, nombre) VALUES (1, 'Primero');
INSERT INTO producto (id, nombre) VALUES (2, 'Segundo');
INSERT INTO producto (id, nombre) VALUES (3, 'Tercero');

show tables;
select * from producto;

START TRANSACTION; -- Comienza la transaccion
   INSERT INTO producto (id, nombre) VALUES (4, 'Cuarto');
   SAVEPOINT sp1; -- Guardamos el savepoint justo hasta el producto 4
   INSERT INTO producto (id, nombre) VALUES (5, 'Cinco');
   INSERT INTO producto (id, nombre) VALUES (6, 'Seis');
ROLLBACK TO sp1; -- Volvemos al 4 eliminando la creacion de todos los demas 

select * from producto; -- solo muestra hasta el 4

