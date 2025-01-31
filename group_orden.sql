CREATE DATABASE db_laboratorio;

SELECT nombre_equipos,estado 
FROM tb_equipos;

SELECT id, descripcion, realizado_por 
FROM tb_mantenimientos
ORDER BY realizado_por DESC;


SELECT nombre_equipos,estado
FROM tb_equipos
WHERE estado = 'En reparacion';

SELECT tipo_mantenimiento, COUNT(*) AS id
FROM tb_mantenimientos
GROUP BY tipo_mantenimiento
ORDER BY id ASC;

SELECT id, LENGTH(id) 
AS contraseña
FROM tb_usuarios;


SELECT  id_equipo,fecha
FROM tb_mantenimientos
WHERE fecha > '2025-01-10'
ORDER BY id ;


SELECT id,nombre
FROM tb_usuarios
INNER JOIN tb_roles ON id.usuario = nombre.usuario
ORDER BY nombre.usuario;






