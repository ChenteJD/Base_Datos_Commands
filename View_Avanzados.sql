CREATE VIEW tipodescuento AS
    SELECT*FROM tb_canales 
    WHERE tipo = 'privado';
    
    
CREATE VIEW videos_canales AS
SELECT 
v.id AS video_id,
v.titulo AS titulo_video,
c.id AS canal_id,
c.nombre AS nombre_canal
FROM tb_videos v
JOIN tb_canales c 
ON v.id = c.id;


CREATE VIEW reproducciones_canal AS
SELECT 
c.id AS canal_id,
c.nombre AS nombre_canal,
AVG(r.id) AS promedio_reproducciones
FROM tb_canales c
LEFT JOIN tb_reproducciones r ON c.id = r.id
GROUP BY c.id, c.nombre;


CREATE VIEW total_reproducciones AS
SELECT 
    COUNT(*) AS cantidad_videos,
    SUM(id) AS total_reproducciones,
    AVG(id) AS promedio_reproducciones,
    MAX(id) AS max_reproducciones,
    MIN(id) AS min_reproducciones
FROM tb_reproducciones;


CREATE VIEW distribucion_videos AS
SELECT 
    YEAR(fecha_publicacion) AS lanzamiento,
    COUNT(*) AS cantidad_videos,
    MIN(fecha_publicacion) AS primer_video,
    MAX(fecha_publicacion) AS ultimo_video
FROM tb_videos
GROUP BY YEAR(fecha_publicacion);


CREATE VIEW analisis_longitud_titulos AS
SELECT 
    LENGTH(titulo) AS longitud_titulo,
    COUNT(*) AS cantidad_videos
FROM tb_videos
GROUP BY LENGTH(titulo)
ORDER BY longitud_titulo;



CREATE VIEW actividad_subida_por_mes_years AS
SELECT 
    YEAR(fecha_publicacion) AS years,
    MONTH(fecha_publicacion) AS mes,
    COUNT(*) AS cantidad_videos
FROM tb_videos
GROUP BY 
    YEAR(fecha_publicacion), MONTH(fecha_publicacion)
ORDER BY years, mes;