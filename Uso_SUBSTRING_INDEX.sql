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
