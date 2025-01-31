select*from tb_canales;
select Estatus from tb_canales;
select 'Nombre_canales', Nombre from tb_canales;
select Estatus,Total_Supcriptores*2 from tb_canales;
select distinct Estatus from tb_canales;
select Nombre,Descripcion,Total_Suscriptores from tb_canales order by Total_Suscriptores asc;
select Nombre,Estatus from tb_canales where Estatus = 'Inactivo';
select*from tb_canales where Fecha_Creacion>'2019-04-04 18:56:22';
select*from tb_canales where ID between 285 and 339 and Estatus = 'Inactivo';
select*from tb_canales where ID in(286,289);
select avg (Total_Suscriptores), max(Total_Suscriptores),min(Total_Suscriptores),sum(Total_Suscriptores),count(*)from tb_canales;
SELECT Usuario_ID, LENGTH(Usuario_ID) AS Total_Suscriptores FROM tb_canales;
SELECT Usuario_ID AS Total_Suscriptores FROM tb_canales;
SELECT id, Nombre, LEFT(nombre, 4) AS nombre_corto FROM tb_canales;
SELECT id, Nombre, Descripcion FROM tb_canales WHERE MATCH(Nombre, Descripcion) AGAINST('+MySQL -consultas' IN BOOLEAN MODE);
SELECT ID , CONCAT(Nombre, 'bloqueado', Estatus, 'publico', Tipo) AS descripcion FROM tb_canales;
SELECT REPLACE (Tipo, 'privado','Muyprivado') as Nueva_Tipo from tb_canales;
select*from tb_canales;



