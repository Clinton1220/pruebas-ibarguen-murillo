USE cocina_db;

-- PASO 1: Buscar reseñas huérfanas (que apunten a utensilios inexistentes)
SELECT r.* FROM resenas r 
LEFT JOIN utensilios u ON r.utensilio_id = u.id 
WHERE u.id IS NULL;

-- PASO 2: Buscar pedidos huérfanos (sin un cliente/usuario válido asignado)
SELECT p.* FROM pedidos p 
LEFT JOIN usuarios u ON p.cliente_id = u.id 
WHERE u.id IS NULL;

-- PASO 3: Control de Unicidad - Detectar correos electrónicos duplicados en el sistema
SELECT email, COUNT(*) AS registros_duplicados 
FROM usuarios 
GROUP BY email 
HAVING COUNT(*) > 1;

-- PASO 4: Control de Rangos de Negocio - Detectar utensilios con Stock crítico o negativo (Invalidez)
SELECT id, nombre, stock FROM utensilios WHERE stock < 0;

-- PASO 5: Control de Rangos de Negocio - Detectar precios inválidos (menores o iguales a cero)
SELECT id, nombre, precio FROM utensilios WHERE precio <= 0;

-- PASO 6: Consulta resumida de auditoría total para la captura de pantalla
SELECT 'Total Usuarios' AS Metrica, COUNT(*) AS Cantidad FROM usuarios
UNION ALL
SELECT 'Total Utensilios Catálogo', COUNT(*) FROM utensilios
UNION ALL
SELECT 'Total Pedidos Registrados', COUNT(*) FROM pedidos
UNION ALL
SELECT 'Ofertas Activas de Prueba', COUNT(*) FROM ofertas_diarias WHERE porcentaje_descuento = 99.00;