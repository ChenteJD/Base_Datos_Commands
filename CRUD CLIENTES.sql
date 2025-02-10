DELIMITER //

CREATE PROCEDURE GestionarClientes(
    IN accion VARCHAR(10),
    IN new_cliente_id INT,
    IN new_nombre VARCHAR(100),
    IN new_apellidop VARCHAR(100),
    IN new_apellidom VARCHAR(100),
    IN new_correo VARCHAR(150),
    IN new_telefono VARCHAR(20)
)
BEGIN
    IF accion = 'INSERTAR' THEN
        INSERT INTO clientes (nombre, apellidop, apellidom, correo, telefono)
        VALUES (new_nombre, new_apellidop, new_apellidom, new_correo, new_telefono);
    
    ELSEIF accion = 'BUSCAR' THEN
        SELECT * FROM clientes WHERE cliente_id = new_cliente_id;
        
    ELSEIF accion = 'LEER' THEN
        SELECT * FROM clientes;
        
    ELSEIF accion = 'ACTUALIZAR' THEN
        UPDATE clientes 
        SET nombre = new_nombre,
            apellidop = new_apellidop,
            apellidom = new_apellidom,
            correo = new_correo,
            telefono = new_telefono
        WHERE cliente_id = new_cliente_id;
    END IF;
END //
