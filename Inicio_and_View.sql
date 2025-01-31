select*from tb_canales;
SELECT * FROM tb_reproducciones WHERE tipo = 'Parcial';
SELECT MAX(ubicacion_id) AS max_ubicacion_id FROM tb_reproducciones;
SELECT * FROM tb_usuarios ORDER BY fecha_nacimiento ASC;
SELECT COUNT(*) AS total_usuarios FROM `tr_usuarios_suscriben_canales`;
SELECT * FROM `tb_paises` WHERE continente = 'Europa';
SELECT * FROM `tb_ubicaciones`WHERE Region = 'Centrosur' AND distrito_estado = 'México';

SELECT estatus, COUNT(canal_id)
FROM `tr_usuarios_suscriben_canales`
GROUP BY  estatus;

SELECT tipo, 
       AVG(Total_Suscriptores) AS promedio_suscriptores, 
       MAX(Total_Suscriptores) AS max_suscriptores
FROM `tb_canales`
GROUP BY tipo;

SELECT estatus, 
       SUM(Total_Suscriptores) AS total_suscriptores
FROM `tb_canales`
GROUP BY estatus;

SELECT 
    tipo, 
    AVG(Total_Suscriptores) AS promedio_suscriptores, 
    MAX(Total_Suscriptores) AS maximo_suscriptores, 
    COUNT(*) AS numero_canales
FROM 
    tb_canales
GROUP BY 
    tipo;
    DESCRIBE tb_canales;
    
    
    CREATE VIEW tipodescuento AS
    SELECT*FROM tb_canales 
    WHERE tipo = 'privado';
    
    




