DELIMITER //
CREATE PROCEDURE pa_ganerar_aleatorios(
OUT valor1 INT,
OUT valor2 INT)
BEGIN
SET valor1=0;
SET valor2=0;
WHILE valor1=valor2 DO
SET valor1=rand()*10;
SET valor2=rand()*10;
END WHILE;
END //

DELIMITER //
CREATE PROCEDURE generar_datos_aleatorios2()
BEGIN
DECLARE i INT DEFAULT 0;
DECLARE registros INT DEFAULT 10;
WHILE i<registros DO
INSERT INTO clientes(nombre,apellidop, apellidom, correo, telefono)
VALUES (
CONCAT('Nombre',FLOOR(1000+(RAND()*9000))),
CONCAT('Apellidop',FLOOR(1000+(RAND()*9000))),
CONCAT('Apellidom',FLOOR(1000+(RAND()*9000))),
CONCAT('Usuario',FLOOR(1000+(RAND()*9000)),'@gmail.com'),
CONCAT('55',FLOOR(100000000+(RAND()*900000000)))
);
SET i = i+ 1;
END WHILE;
END //




##saludar
DELIMITER //
CREATE PROCEDURE SaludarUsuario(IN nombreUsuario VARCHAR(50))
BEGIN
    SELECT CONCAT('¡Hola, ', nombreUsuario, '! Un gusto conocerte.') AS Saludo;
END //
DELIMITER ;


##calculadora
DELIMITER //

CREATE PROCEDURE calculadora(
    IN valor1 DECIMAL(10,2),
    IN valor2 DECIMAL(10,2),
    IN operacion VARCHAR(10)
)
BEGIN
    DECLARE resultado DECIMAL(10,2); 
    IF operacion = 'suma' THEN
        SET resultado = valor1 + valor2;
    ELSEIF operacion = 'resta' THEN
        SET resultado = valor1 - valor2;
    ELSEIF operacion = 'multiplicacion' THEN
        SET resultado = valor1 * valor2;
    ELSEIF operacion = 'division' THEN
        IF valor2 = 0 THEN
            SET resultado = NULL;
        ELSE
            SET resultado = valor1 / valor2;
        END IF;
    ELSE
        SET resultado = NULL;
    END IF;
    
    IF resultado IS NOT NULL THEN
        SELECT CONCAT('El resultado de la ', operacion, ' es: ', resultado) AS Resultado;
    ELSE
        SELECT 'Operación no válida o error (¿división por cero?)' AS Resultado;
    END IF;
END //
DELIMITER ;



##saludarcorrecto
DELIMITER //
CREATE PROCEDURE SaludarUsuario2(IN nombreIngresado VARCHAR(50))
BEGIN
    DECLARE nombreCorrecto VARCHAR(50); 
    SET nombreCorrecto = 'Vicente'; 
    IF nombreIngresado = nombreCorrecto THEN
        SELECT CONCAT('¡Hola, ', nombreCorrecto, '! Has ingresado el nombre correcto.') AS Saludo;
    ELSE
        SELECT 'El nombre ingresado no es correcto. Intenta de nuevo.' AS Error;
    END IF;
END //
DELIMITER ;


##Tarea
DELIMITER //
CREATE PROCEDURE SaludoPorHora(IN nombreUsuario VARCHAR(50), IN horaIngresada VARCHAR(50))
BEGIN
    IF horaIngresada < 0 OR horaIngresada > '23:00' THEN
        SELECT 'La hora ingresada no es válida. Por favor, introduce un valor entre 0:00 y 23:00.' AS MensajeError;
    ELSE
        IF horaIngresada >= 0 AND horaIngresada < '12:00' THEN
            SELECT CONCAT('¡Buenos días, ', nombreUsuario, '!') AS Saludo;
        ELSEIF horaIngresada >= '12:00' AND horaIngresada < '18:00' THEN
            SELECT CONCAT('¡Buenas tardes, ', nombreUsuario, '!') AS Saludo;
        ELSE
            SELECT CONCAT('¡Buenas noches, ', nombreUsuario, '!') AS Saludo;
        END IF;
    END IF;
END //
DELIMITER ;










