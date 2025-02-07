DELIMITER //

CREATE PROCEDURE GestionarClientes(
    IN accion VARCHAR(10),
    IN p_cliente_id INT,
    IN p_nombre VARCHAR(100),
    IN p_apellidop VARCHAR(100),
    IN p_apellidom VARCHAR(100),
    IN p_correo VARCHAR(150),
    IN p_telefono VARCHAR(20)
)
BEGIN
    IF accion = 'INSERTAR' THEN
        INSERT INTO clientes (nombre, apellidop, apellidom, correo, telefono)
        VALUES (p_nombre, p_apellidop, p_apellidom, p_correo, p_telefono);
    
    ELSEIF accion = 'BUSCAR' THEN
        SELECT * FROM clientes WHERE cliente_id = p_cliente_id;
        
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
