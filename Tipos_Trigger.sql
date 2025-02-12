##Trigger before insertar
DELIMITER //
CREATE TRIGGER before_insert_ventas BEFORE INSERT ON ventas
FOR EACH ROW
BEGIN
INSERT INTO historial_ventas(venta_id,cliente_id,fecha_venta,total,accion)
VALUES(NEW.venta_id,NEW.cliente_id,NEW.fecha_venta,NEW.total,'before insert');
END//

##Trigger de actualizar 
DELIMITER //
CREATE TRIGGER before_update_ventas BEFORE UPDATE ON ventas
FOR EACH ROW
BEGIN
INSERT INTO historial_ventas(venta_id,cliente_id,fecha_venta,total,accion)
VALUES(OLD.venta_id,OLD.cliente_id,OLD.fecha_venta,OLD.total,'before update');
END//

##Trigger de borra
DELIMITER //
CREATE TRIGGER before_delete_ventas BEFORE DELETE ON ventas
FOR EACH ROW
BEGIN
INSERT INTO historial_ventas(venta_id,cliente_id,fecha_venta,total,accion)
VALUES(OLD.venta_id,OLD.cliente_id,OLD.fecha_venta,OLD.total,'before delete');
END//

##Trigger after borrar
CREATE TRIGGER after_delete_ventas AFTER DELETE ON ventas
FOR EACH ROW
BEGIN
INSERT INTO historial_ventas(venta_id,cliente_id,fecha_venta,total,accion)
VALUES(OLD.venta_id,OLD.cliente_id,OLD.fecha_venta,OLD.total,'after delete');
END//

##Trigger after insertar
DELIMITER //
CREATE TRIGGER after_insert_ventas after INSERT ON ventas
FOR EACH ROW
BEGIN
INSERT INTO historial_ventas(venta_id,cliente_id,fecha_venta,total,accion)
VALUES(NEW.venta_id,NEW.cliente_id,NEW.fecha_venta,NEW.total,'after insert');
END//

##Trigger after actualiza
DELIMITER //
CREATE TRIGGER after_update_ventas after UPDATE ON ventas
FOR EACH ROW
BEGIN
INSERT INTO historial_ventas(venta_id,cliente_id,fecha_venta,total,accion)
VALUES(NEW.venta_id,NEW.cliente_id,NEW.fecha_venta,NEW.total,'after update');
END//