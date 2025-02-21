##trigger de curd tabal clientes
DELIMITER //
CREATE TRIGGER crude_clientes
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
    IF NEW.nombre IS NULL OR NEW.nombre = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El nombre es obligatorio.';
    END IF;

    IF NEW.apellidop IS NULL OR NEW.apellidop = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El apellido paterno es obligatorio.';
    END IF;

    IF NEW.apellidom IS NULL OR NEW.apellidom = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El apellido materno es obligatorio.';
    END IF;

    IF NEW.correo IS NULL OR NEW.correo = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El correo es obligatorio.';
    END IF;

    IF NEW.telefono IS NULL OR NEW.telefono = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El teléfono es obligatorio.';
    END IF;
END //

##trigger de curd tabla productos
DELIMITER //
CREATE TRIGGER actualizar_estado_stock
BEFORE UPDATE ON productos
FOR EACH ROW
BEGIN
    IF NEW.stock = 0 THEN
        SET NEW.estado = 'Agotado';
    END IF;
END //



