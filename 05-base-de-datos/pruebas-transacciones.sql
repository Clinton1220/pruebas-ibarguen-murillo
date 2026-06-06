USE cocina_db;

-- Asegurar existencia de IDs para evitar fallos de llaves foráneas
SET @user_test = (SELECT MIN(id) FROM usuarios);
SET @utensilio_test = (SELECT MIN(id) FROM utensilios);

-- =====================================================================
-- ESCENARIO A: DEMOSTRACIÓN DE TRANSACCIÓN EXITOSA (COMMIT)
-- =====================================================================
SELECT COUNT(*) AS pedidos_antes_commit FROM pedidos;

START TRANSACTION;

-- Insertar un pedido de prueba
INSERT INTO pedidos (cliente_id, total, estado_pago, creado_at) 
VALUES (@user_test, 235000.00, 'PRUEBA_COMMIT_OK', NOW());

-- Verificar existencia temporal dentro de la sesión de la transacción
SELECT * FROM pedidos WHERE estado_pago = 'PRUEBA_COMMIT_OK';

COMMIT;

-- Confirmar persistencia permanente tras el COMMIT
SELECT COUNT(*) AS pedidos_despues_commit FROM pedidos;
SELECT * FROM pedidos WHERE estado_pago = 'PRUEBA_COMMIT_OK';


-- =====================================================================
-- ESCENARIO B: DEMOSTRACIÓN DE TRANSACCIÓN REVERTIDA (ROLLBACK)
-- =====================================================================
SELECT COUNT(*) AS pedidos_antes_rollback FROM pedidos;

START TRANSACTION;

-- Insertar un pedido simulado que fallará o se cancelará
INSERT INTO pedidos (cliente_id, total, estado_pago, creado_at) 
VALUES (@user_test, 999999.00, 'PRUEBA_ROLLBACK_ERR', NOW());

-- El registro existe temporalmente aquí
SELECT * FROM pedidos WHERE estado_pago = 'PRUEBA_ROLLBACK_ERR';

-- Detectamos una anomalía o cancelación simulada y revertimos todo
ROLLBACK;

-- Confirmar que el ROLLBACK eliminó el registro de la memoria física y dejó todo intacto
SELECT COUNT(*) AS pedidos_despues_rollback FROM pedidos;
SELECT * FROM pedidos WHERE estado_pago = 'PRUEBA_ROLLBACK_ERR';


-- =====================================================================
-- LIMPIEZA DE TRANSACCIONES DE EVALUACIÓN
-- =====================================================================
DELETE FROM pedidos WHERE estado_pago IN ('PRUEBA_COMMIT_OK', 'PRUEBA_ROLLBACK_ERR');