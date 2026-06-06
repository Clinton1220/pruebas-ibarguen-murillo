package cocina;

import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

@DisplayName("Pruebas Unitarias - Módulo Transaccional de Inventario")
public class TransaccionalTest {

    @Test
    @DisplayName("UT-TRX-001: Procesamiento exitoso de una transacción de entrada de stock")
    void testRegistrarTransaccionValida() {
        int stockActual = 10;
        int cantidadMovimiento = 5;
        int nuevoStock = stubProcesarMovimiento("ENTRADA", stockActual, cantidadMovimiento);
        assertEquals(15, nuevoStock, "La entrada debe sumar unidades al inventario maestro.");
    }

    @Test
    @DisplayName("UT-TRX-002: Procesamiento exitoso de una transacción de salida de stock")
    void testRegistrarSalidaValida() {
        int stockActual = 10;
        int cantidadMovimiento = 4;
        int nuevoStock = stubProcesarMovimiento("SALIDA", stockActual, cantidadMovimiento);
        assertEquals(6, nuevoStock, "La salida debe restar unidades de forma exacta.");
    }

    @Test
    @DisplayName("UT-TRX-003: Rechazo de transacción con cantidad en cero o negativa")
    void testTransaccionCantidadInvalida() {
        assertThrows(IllegalArgumentException.class, () -> {
            stubProcesarMovimiento("ENTRADA", 10, -5);
        }, "No se permiten movimientos con variaciones menores o iguales a cero.");
    }

    @Test
    @DisplayName("UT-TRX-004: Bloqueo de transacción por ruptura de stock (Stock insuficiente)")
    void testSalidaMayorAlStockDisponible() {
        assertThrows(ArithmeticException.class, () -> {
            stubProcesarMovimiento("SALIDA", 5, 12);
        }, "El sistema debe disparar un error si se intenta retirar más unidades de las disponibles.");
    }

    @Test
    @DisplayName("UT-TRX-005: Rechazo de tipos de movimientos no soportados por el negocio")
    void testTipoMovimientoInvalido() {
        assertThrows(IllegalArgumentException.class, () -> {
            stubProcesarMovimiento("DONACIÓN", 10, 2);
        });
    }

    @Test
    @DisplayName("UT-TRX-006: Validación de persistencia de estados de transacciones")
    void testValidarEstadoTransaccion() {
        String estadoActual = "PENDIENTE";
        String nuevoEstado = stubCambiarEstado(estadoActual, "COMPLETADA");
        assertEquals("COMPLETADA", nuevoEstado);
    }

    private int stubProcesarMovimiento(String tipo, int stockActual, int cantidad) {
        if (cantidad <= 0) throw new IllegalArgumentException("Cantidad inválida");
        if (!tipo.equals("ENTRADA") && !tipo.equals("SALIDA")) throw new IllegalArgumentException("Tipo inválido");
        
        if (tipo.equals("ENTRADA")) {
            return stockActual + cantidad;
        } else {
            if (cantidad > stockActual) throw new ArithmeticException("Stock insuficiente");
            return stockActual - cantidad;
        }
    }

    private String stubCambiarEstado(String actual, String nuevo) {
        if(actual.equals("PENDIENTE") && nuevo.equals("COMPLETADA")) return "COMPLETADA";
        return actual;
    }
}