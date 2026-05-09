USE cocina_db;

-- Limpiar datos de prueba anteriores
DELETE FROM pedidos WHERE notas LIKE 'PRUEBA_%';
DELETE FROM utensilios WHERE codigo LIKE 'TEST_%';
DELETE FROM usuarios WHERE email LIKE 'test_%';

-- Insertar usuarios de prueba
INSERT INTO usuarios (nombre, apellido, email, password, rol, telefono, activo)
VALUES
('Test', 'Admin', 'test_admin@example.com', 'hash_password', 'administrador', '555-0000', 1),
('Test', 'Cliente', 'test_cliente@example.com', 'hash_password', 'cliente', '555-0001', 1),
('Inactivo', 'Usuario', 'test_inactivo@example.com', 'hash_password', 'cliente', '555-0002', 0);

SELECT id, nombre, email, rol, activo FROM usuarios WHERE email LIKE 'test_%';

-- Insertar utensilios de prueba
INSERT INTO utensilios (codigo, nombre, descripcion, categoria_id, precio, cantidad_inventario, material, activo)
VALUES
('TEST_001', 'Utensilio Prueba 1', 'Desc prueba 1', 1, 100, 10, 'Acero', 1),
('TEST_002', 'Utensilio Prueba 2', 'Desc prueba 2', 2, 200, 20, 'Madera', 1);

SELECT * FROM utensilios WHERE codigo LIKE 'TEST_%';