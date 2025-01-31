SELECT*FROM tb_videos A 
INNER JOIN tr_videos_tienen_restricciones B 
ON A.ID = B.Video_ID;

SELECT A.ID, A.Nombre,A.Titulo, B.Restriccion_ID
FROM tb_videos A 
INNER JOIN tr_videos_tienen_restricciones B
ON A.Usuario_ID=B.Video_ID;

SELECT A.Nombre,A.Apellido_Paterno,A.Apellido_Materno,B.Estatus
FROM tb_usuarios A 
LEFT JOIN tb_canales B 
ON A.ID=B.Usuario_ID
UNION 
SELECT A.Nombre,A.Apellido_Paterno,A.Apellido_Materno,B.Estatus
FROM tb_usuarios A 
RIGHT JOIN tb_canales B 
ON A.ID=B.Usuario_ID;


SELECT A.ID, A.Pais, B.Estatus
FROM tb_ubicaciones A
INNER JOIN tb_usuarios B
ON A.ID=B.ID;

SELECT 
    tb_videos.id AS VideoID,
    tb_videos.nombre AS NombreVideo
FROM tb_videos
INNER JOIN tr_videos_tienen_restricciones 
ON tb_videos.id = tr_videos_tienen_restricciones.video_id
WHERE tr_videos_tienen_restricciones.restriccion_id = 2;


SELECT A.Nombre_Usuario, A.Estatus_Conexion, A.Tipo, A.Ubicacion_ID, B.Dispositivo_origen 
FROM tb_usuarios A 
RIGHT JOIN tb_reproducciones B 
ON A.Ubicacion_ID = B.Usuario_ID;




SELECT* 
FROM tb_ubicaciones
INNER JOIN tb_usuarios
ON tb_ubicaciones.ID = tb_usuarios.Ubicacion_ID
INNER JOIN tb_reproducciones
ON tb_usuarios.ID = tb_reproducciones.Ubicacion_ID;





