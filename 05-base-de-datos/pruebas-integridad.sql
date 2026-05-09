USE cocina_db;

/* Integridad referencial */
SELECT p.* FROM pedidos p LEFT JOIN usuarios u ON p.cliente_id = u.id WHERE u.id IS NULL;
SELECT d.* FROM detalles_pedido d LEFT JOIN utensilios u ON d.utensilio_id = u.id WHERE u.id IS NULL;

/* Unicidad */
SELECT email, COUNT(*) FROM usuarios GROUP BY email HAVING COUNT(*) > 1;
SELECT codigo, COUNT(*) FROM utensilios GROUP BY codigo HAVING COUNT(*) > 1;

/* Campos obligatorios */
SELECT * FROM usuarios WHERE nombre IS NULL OR nombre = '';
SELECT * FROM utensilios WHERE nombre IS NULL OR nombre = '';

/* Rangos */
SELECT * FROM pedidos WHERE monto_total <= 0;
SELECT * FROM facturas WHERE estado NOT IN ('pagada','pendiente','cancelada');

/* Resumen de integridad */
SELECT 'Total usuarios' as tipo, COUNT(*) FROM usuarios
UNION ALL
SELECT 'Usuarios activos', COUNT(*) FROM usuarios WHERE activo=1
UNION ALL
SELECT 'Utensilios registrados', COUNT(*) FROM utensilios
UNION ALL
SELECT 'Pedidos totales', COUNT(*) FROM pedidos
UNION ALL
SELECT 'Facturas totales', COUNT(*) FROM facturas;