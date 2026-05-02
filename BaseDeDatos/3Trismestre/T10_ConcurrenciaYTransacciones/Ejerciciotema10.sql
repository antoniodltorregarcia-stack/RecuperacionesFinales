SELECT @@GLOBAL.transaction_isolation; /* Comprobaría el sistema en general. */
SELECT @@SESSION.transaction_isolation; /* Comprobaría la de sesión. */
SELECT @@transaction_isolation; /* Comprobaría la de sesión. */

use mysql;
select user, host from user;

select user();  /*Ver con que usuario trabajamos actualmente*/

show databases;
use tiendadb;
select * from producto;


-------------------------------
-- NIvel de aislamiento: READ-COMMITED
-- Transacción B
-------------------------------

select @@transaction_isolation;
set session transaction_isolation = "READ-COMMITED";