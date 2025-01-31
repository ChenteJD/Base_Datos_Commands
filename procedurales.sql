show procedure status;

DELIMITER //
CREATE PROCEDURE parametro (IN vContinente CHAR(40))
BEGIN
SELECT COUNT(*) FROM tb_paises
WHERE Continente LIKE vContinente;
END //
CALL bd_youtube_2025.parametro('ASIA');

DELIMITER //
CREATE PROCEDURE parametroOUT (OUT total INT)
BEGIN
SELECT COUNT(Nombre) INTO total
FROM tb_videos;
END //
CALL bd_youtube_2025.parametroOUT('Video');


DELIMITER //
CREATE PROCEDURE parametroINOUT(IN N1 FLOAT,IN N2 FLOAT,OUT resultado FLOAT)
BEGIN
SELECT(N1+N2)/2 INTO resultado;
END //




DELIMITER //
CREATE PROCEDURE parametroT1(IN Num1 FLOAT,IN Num2 FLOAT,OUT resultadoC FLOAT)
BEGIN
    IF Num1 > Num2 THEN
        SET resultadoC = Num1;
    ELSE
        SET resultadoC = Num2;
    END IF;
END //
