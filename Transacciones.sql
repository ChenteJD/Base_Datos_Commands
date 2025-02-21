##

SET autocommit=0;
SELECT @@autocommit;

##inico de primera transaccion 
START TRANSACTION;

SET autocommit =0;

INSERT INTO productos(nombre, precio, stock, categoria, estado) 
VALUES ('jabon', 15, 50, 'limpieza', 'inactivo');

COMMIT;


##NEW
START TRANSACTION;

SET autocommit =0;

UPDATE productos SET nombre = 'galletas85' WHERE producto_id=80;

ROLLBACK;
