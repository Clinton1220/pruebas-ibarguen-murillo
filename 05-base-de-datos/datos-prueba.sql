USE cocina_db;

-- 1. LIMPIEZA CONTROLADA DE REGISTROS DE PRUEBA PREVIOS
-- (Se eliminan en orden inverso a las llaves foráneas para evitar bloqueos)
DELETE FROM ofertas_diarias WHERE porcentaje_descuento = 99.00;
DELETE FROM resenas WHERE comentario LIKE 'PRUEBA_QA_%';
DELETE FROM rastreo_pedidos WHERE estado LIKE 'PRUEBA_%';
DELETE FROM facturas WHERE metodo_pago = 'PRUEBA_PAGO';
DELETE FROM detalles_pedido WHERE precio_unitario = 9999.99;
DELETE FROM pedidos WHERE estado_pago LIKE 'PRUEBA_%';
DELETE FROM utensilios WHERE nombre LIKE 'PRUEBA_%';
DELETE FROM usuarios WHERE email LIKE 'test_%@pruebas.com';

-- 2. INSERTAR USUARIOS DE PRUEBA (Utiliza tus columnas reales: nombre, email, password, rol)
-- NOTA: Tu sistema almacena contraseñas, para las pruebas usaremos MD5 o texto plano según tu backend
INSERT INTO usuarios (nombre, email, password, rol, created_at) VALUES 
('Admin QA', 'test_admin@pruebas.com', MD5('Admin123!'), 'admin', NOW()),
('Cliente QA', 'test_cliente@pruebas.com', MD5('User123!'), 'cliente', NOW());

-- Obtener IDs generados para usarlos como llaves foráneas de forma segura
SET @admin_id = LAST_INSERT_ID();
SET @cliente_id = @admin_id + 1;

-- 3. INSERTAR UTENSILIOS DE PRUEBA (Utiliza tus columnas reales: nombre, descripcion, precio, stock, categoria)
INSERT INTO utensilios (nombre, descripcion, precio, stock, categoria, imagen) VALUES
('PRUEBA_Sarten_Titanio', 'Sartén antiadherente profesional de 32cm', 150000.00, 10, 'Sartenes', 'sarten.jpg'),
('PRUEBA_Cuchillo_Chef', 'Cuchillo de acero inoxidable forjado 8 pulgadas', 85000.00, 15, 'Cuchillos', 'cuchillo.jpg'),
('PRUEBA_Licuadora_Ind', 'Licuadora industrial de alta potencia', 450000.00, 5, 'Electrodomésticos', 'licuadora.jpg');

-- Verificación visual inmediata en consola
SELECT id, nombre, precio, stock, categoria FROM utensilios WHERE nombre LIKE 'PRUEBA_%';
SELECT id, nombre, email, rol FROM usuarios WHERE email LIKE 'test_%@pruebas.com';