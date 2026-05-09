USE cocina_db;

-- PRUEBA DE COMMIT
SELECT COUNT(*) AS antes FROM pedidos;
START TRANSACTION;
INSERT INTO pedidos (numero_pedido, cliente_id, monto_total, estado, metodo_pago, direccion_entrega, notas)
VALUES ('PRUEBA_COMMIT', 1, 99.99, 'pendiente', 'efectivo', 'Calle pruebas', 'PRUEBA_COMMIT');
SELECT * FROM pedidos WHERE numero_pedido = 'PRUEBA_COMMIT';
COMMIT;
SELECT COUNT(*) AS despues FROM pedidos;

-- PRUEBA DE ROLLBACK
SELECT COUNT(*) AS antes FROM pedidos;
START TRANSACTION;
INSERT INTO pedidos (numero_pedido, cliente_id, monto_total, estado, metodo_pago, direccion_entrega, notas)
VALUES ('PRUEBA_ROLLBACK', 1, 55.55, 'pendiente', 'efectivo', 'Calle pruebas', 'PRUEBA_ROLLBACK');
SELECT * FROM pedidos WHERE numero_pedido = 'PRUEBA_ROLLBACK';
ROLLBACK;
SELECT COUNT(*) AS despues FROM pedidos;

-- Limpieza final
DELETE FROM pedidos WHERE numero_pedido IN ('PRUEBA_COMMIT','PRUEBA_ROLLBACK');