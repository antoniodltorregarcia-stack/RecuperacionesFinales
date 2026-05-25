select @@sql_safe_updates; -- ver seguridad
set sql_safe_updates = 0; -- cambiarla pa reventarlo to

use bibliotecadb;
select * from TAdministrador;

update TAdministrador set apellido1=lower(apellido1) where grupo = "DAW";
update TAdministrador set apellido1=upper(apellido1) where codigo between 1 and 20;
