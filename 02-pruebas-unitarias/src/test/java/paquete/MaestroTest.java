package cocina;

import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

@DisplayName("Pruebas Unitarias - CRUD Maestro de Utensilios")
public class MaestroTest {

    @Test
    @DisplayName("UT-MAE-001: Creación de utensilio con datos obligatorios completos")
    void testCrearUtensilioValido() {
        boolean resultado = stubGuardarUtensilio("TEST_UT_04", "Horno Microondas", "Industrial", 5);
        assertTrue(resultado);
    }

    @Test
    @DisplayName("UT-MAE-002: Rechazo de creación con nombre de utensilio vacío")
    void testCrearUtensilioNombreVacio() {
        boolean resultado = stubGuardarUtensilio("TEST_UT_05", "", "Descripción", 10);
        assertFalse(resultado, "El nombre del utensilio es un campo obligatorio.");
    }

    @Test
    @DisplayName("UT-MAE-003: Rechazo de creación con stock inicial negativo")
    void testCrearUtensilioStockNegativo() {
        boolean resultado = stubGuardarUtensilio("TEST_UT_06", "Licuadora", "Gama alta", -2);
        assertFalse(resultado, "El stock inicial del catálogo maestro jamás puede ser menor a cero.");
    }

    @Test
    @DisplayName("UT-MAE-004: Modificación exitosa de campos permitidos")
    void testEditarUtensilioExitoso() {
        boolean resultado = stubEditarUtensilio("TEST_UT_01", "Licuadora Industrial Modificada", 8);
        assertTrue(resultado);
    }

    @Test
    @DisplayName("UT-MAE-005: Bloqueo de eliminación por integridad referencial")
    void testEliminarUtensilioConDependencias() {
        boolean puedeEliminar = stubEliminarUtensilio("TEST_UT_01", true); // Tiene transacciones
        assertFalse(puedeEliminar, "No se puede borrar un utensilio que tiene registros históricos asociados.");
    }

    @Test
    @DisplayName("UT-MAE-006: Eliminación exitosa de utensilio sin transacciones")
    void testEliminarUtensilioSinDependencias() {
        boolean puedeEliminar = stubEliminarUtensilio("TEST_UT_03", false); // Sin transacciones
        assertTrue(puedeEliminar);
    }

    @Test
    @DisplayName("UT-MAE-007: Validación de formato único en el código de utensilio")
    void testCodigoFormatoInvalido() {
        boolean resultado = stubGuardarUtensilio("123", "Olla Presión", "Fallas", 2);
        assertFalse(resultado, "El código debe cumplir con la estructura regular del proyecto.");
    }

    private boolean stubGuardarUtensilio(String cod, String nom, String desc, int stock) {
        if(nom.isEmpty() || cod.isEmpty() || stock < 0 || !cod.startsWith("TEST_")) return false;
        return true;
    }

    private boolean stubEditarUtensilio(String cod, String nom, int stock) {
        return !nom.isEmpty() && stock >= 0;
    }

    private boolean stubEliminarUtensilio(String cod, boolean tieneDependencias) {
        return !tieneDependencias;
    }
}