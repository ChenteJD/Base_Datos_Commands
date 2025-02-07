##En clase
DELIMITER //
CREATE PROCEDURE LlenarClienteFijos5 (IN cantidad INT)
BEGIN
DECLARE i INT DEFAULT 1;
DECLARE nombreSeleccionado VARCHAR(50);
DECLARE apellidoPSeleccionado VARCHAR(40);
DECLARE apellidoMSeleccionado VARCHAR(50);
DECLARE correoSeleccionado VARCHAR(50);
DECLARE telefonoSeleccionado VARCHAR(20);

DECLARE nombre TEXT DEFAULT 'Juan, Ana, Luis, Monica, Carlos, Diana, Pamela, Griselda, Norma, Laila';
DECLARE apellidoP TEXT DEFAULT 'Cruz, Ortega, Rafael, Alvarez, Castaneda,
 Santos, Ramirez, Calderon, Mendoza, Sanchez';
DECLARE apellidoM TEXT DEFAULT 'Ortega, Rafael, Alvarez, Santos,
 Cruz, Portales, Hernadez, Santillan, Mendoza, Ramirez';
DECLARE correo TEXT DEFAULT 'carlos.mendoza82@gmail.com,
 sofia_rios99@yahoo.com,
pedro.luna24@outlook.com,
andrea.velazquez77@hotmail.com,
fernando.gomez15@protonmail.com,
mariana.castillo88@icloud.com,
juanperez34@live.com,
lucia.fernandez51@gmail.com,
roberto_sanchez03@aol.com,
monica.ortega27@zoho.com';
DECLARE telefono TEXT DEFAULT '+52 55 1234 5678
,+1 305 987 6543
,+44 7712 345678
,+34 612 345 678
,+49 1523 4567890
,+33 6 12 34 56 78
,+61 412 345 678
,+81 90 1234 5678
,+55 11 98765 4321
,+27 82 345 6789';
-- BUCLE
WHILE i <= cantidad DO

SET nombreSeleccionado = SUBSTRING_INDEX(SUBSTRING_INDEX(nombre, ',',i),',',-1); 
SET apellidoPSeleccionado = SUBSTRING_INDEX(SUBSTRING_INDEX(apellidoP, ',',i),',',-1); 
SET apellidoMSeleccionado = SUBSTRING_INDEX(SUBSTRING_INDEX(apellidoM, ',',i),',',-1); 
SET correoSeleccionado = SUBSTRING_INDEX(SUBSTRING_INDEX(correo, ',',i),',',-1); 
SET telefonoSeleccionado = SUBSTRING_INDEX(SUBSTRING_INDEX(telefono, ',',i),',',-1); 

-- insertar registros
INSERT INTO clientes(nombre,apellidoP,apellidoM,correo, telefono)
VALUES (nombreSeleccionado,apellidoPSeleccionado,apellidoMSeleccionado,correoSeleccionado,telefonoSeleccionado);

-- incrementar indice

SET i =i + 1;
END WHILE;
END//


##Ejemplo de Loop
DELIMITER //
CREATE PROCEDURE disminuir_stock_categoria_loop(
IN p_categoria VARCHAR(50),
IN p_cantidad INT 
)
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE v_producto_id INT;
DECLARE cur CURSOR FOR
SELECT producto_id FROM productos WHERE categoria=p_categoria;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;

OPEN cur;
read_loop: LOOP 
FETCH cur INTO v_producto_id;
IF done THEN
LEAVE read_loop;
END IF;
UPDATE productos
SET stock= greatest(stock - p_cantidad,0)
WHERE producto_id = v_producto_id;
END LOOP;
CLOSE cur;
END //


## LOOP2 (no sirve)
DELIMITER //
CREATE PROCEDURE desactivar_producto_sin_stock()
BEGIN
DECLARE v_producto_id INT;
SELECT producto_id INTO v_producto_id FROM productos WHERE stock='0' LIMIT 1;
REPEAT
UPDATE productos SET estado='inactivo' WHERE producto_id = v_producto_id;
SELECT product_id INTO v_producto_id FROM producto WHERE stock=0 LIMIT 1;
UNTIL v_producto_id IS NULL
END REPEAT;
END //


##DETERMINISTA
DELIMITER //
CREATE FUNCTION calcular_cuadrado(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
RETURN n*n;
END //

##NO DETERMINISTAS
DELIMITER //

CREATE FUNCTION calcular_cuadrado_aleatorio(n INT)
RETURNS INT
NOT DETERMINISTIC
NO SQL
BEGIN
    RETURN (n * n) + FLOOR(RAND() * 10);  
END //

	
##INTENTO 2 DE INACTIVO
DELIMITER //
CREATE PROCEDURE sin_stock()
BEGIN
    DECLARE v_producto_id INT;
    DECLARE done BOOLEAN DEFAULT FALSE;
    
    DECLARE cur CURSOR FOR 
        SELECT producto_id FROM productos WHERE stock = 0;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    bucle: LOOP
        FETCH cur INTO v_producto_id;
        IF done THEN
            LEAVE bucle;
        END IF;
        UPDATE productos SET estado = 'inactivo' WHERE producto_id = v_producto_id;
    END LOOP;
    
    CLOSE cur;
END //
DELIMITER ;