/*Ejemplo 2 Savepoints*/

DROP DATABASE IF EXISTS test;
CREATE DATABASE test CHARACTER SET utf8mb4;
USE test;
CREATE TABLE cuentas 
    (id INTEGER UNSIGNED PRIMARY KEY,
     saldo DECIMAL(11,2) CHECK (saldo >= 0));
     
INSERT INTO cuentas VALUES (1, 1000);
INSERT INTO cuentas VALUES (2, 2000);
INSERT INTO cuentas VALUES (3, 0);

SELECT  *  FROM cuentas;

START TRANSACTION;
	UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;
	UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;
COMMIT;

SELECT  *  FROM cuentas; 

START TRANSACTION;
	UPDATE cuentas SET saldo = saldo - 100 WHERE id = 9999;
	UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;
COMMIT;

SELECT  *  FROM cuentas;