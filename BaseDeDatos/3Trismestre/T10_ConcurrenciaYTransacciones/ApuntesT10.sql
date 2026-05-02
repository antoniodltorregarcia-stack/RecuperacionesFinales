SELECT @@GLOBAL.transaction_isolation; /* Comprobaría el sistema en general. */
SELECT @@SESSION.transaction_isolation; /* Comprobaría la de sesión. */
SELECT @@transaction_isolation;  /* Comprobaría la de sesión. */