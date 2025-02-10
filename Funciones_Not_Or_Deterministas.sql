##Ejemplo de determinista
DELIMITER //
CREATE FUNCTION cuadrado(numero INT)
RETURNS INT
DETERMINISTIC
BEGIN
RETURN numero*numero;
END//
## Ejemplo de no determinista
DELIMITER //
CREATE FUNCTION numero_aleatorio()
RETURNS INT
NOT DETERMINISTIC
READS SQL DATA
BEGIN
RETURN FLOOR(RAND()*100)+1;
END//

##Buscador de correo
DELIMITER //
CREATE FUNCTION buscar_correos(nombre_param VARCHAR(255)) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE total INT;
    DECLARE correos VARCHAR(100);
    
    SELECT COUNT(*) INTO total 
    FROM clientes 
    WHERE nombre = nombre_param;
    
    IF total > 2 THEN
        SELECT GROUP_CONCAT(correo SEPARATOR ', ') INTO correos
        FROM clientes 
        WHERE nombre = nombre_param;
    ELSE
        SELECT correo INTO correos
        FROM clientes 
        WHERE nombre = nombre_param
        LIMIT 1;
    END IF;
    
    RETURN correos;
END//


##Nombre al lazar
DELIMITER //
CREATE FUNCTION nombre_aleatorio()
RETURNS VARCHAR(100)
NOT DETERMINISTIC
READS SQL  DATA
BEGIN
    DECLARE nombre_seleccionado VARCHAR(100);
    SELECT nombre INTO nombre_seleccionado
    FROM clientes
    ORDER BY RAND()
    LIMIT 1;
    RETURN nombre_seleccionado;
END//

##Funcion Extra
DELIMITER //
CREATE FUNCTION contar_empleados()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM empleados
    WHERE estado = 'Sin Bono';
    RETURN total;
END//





