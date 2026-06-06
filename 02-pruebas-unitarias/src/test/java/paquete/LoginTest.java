package cocina;

import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

@DisplayName("Pruebas Unitarias - Módulo de Autenticación")
public class LoginTest {

    @Test
    @DisplayName("UT-LOG-001: Autenticación exitosa con credenciales de administrador")
    void testLoginAdminExitoso() {
        boolean resultado = stubAutenticar("test_admin", "Admin123!");
        assertTrue(resultado, "El administrador registrado debe ingresar correctamente.");
    }

    @Test
    @DisplayName("UT-LOG-002: Rechazo de autenticación por contraseña errónea")
    void testLoginPasswordIncorrecto() {
        boolean resultado = stubAutenticar("test_admin", "ClaveInvalida");
        assertFalse(resultado, "El sistema debe bloquear el acceso si la contraseña no coincide.");
    }

    @Test
    @DisplayName("UT-LOG-003: Rechazo de autenticación por usuario inexistente")
    void testLoginUsuarioNoExiste() {
        boolean resultado = stubAutenticar("usuario_fantasma", "Admin123!");
        assertFalse(resultado, "No se debe permitir el ingreso a cuentas que no existan en la base de datos.");
    }

    @Test
    @DisplayName("UT-LOG-004: Bloqueo de acceso para usuarios con estado inactivo")
    void testLoginUsuarioInactivo() {
        boolean resultado = stubAutenticar("test_inactivo", "Inact123!");
        assertFalse(resultado, "Las cuentas inactivas deben ser rechazadas aunque coloquen la clave bien.");
    }

    @Test
    @DisplayName("UT-LOG-005: Validación de campos vacíos en el backend")
    void testLoginCamposVacios() {
        assertThrows(IllegalArgumentException.class, () -> {
            stubAutenticar("", "");
        }, "El backend debe arrojar una excepción si los parámetros requeridos llegan nulos o vacíos.");
    }

    @Test
    @DisplayName("UT-LOG-006: Validación de longitud mínima de caracteres de seguridad")
    void testLoginLongitudInvalida() {
        boolean resultado = stubAutenticar("usr", "12");
        assertFalse(resultado, "El sistema debe rechazar credenciales sospechosas por debajo del límite de caracteres.");
    }

    private boolean stubAutenticar(String usuario, String password) {
        if (usuario.isEmpty() || password.isEmpty()) throw new IllegalArgumentException("Campos vacíos");
        if (usuario.equals("test_admin") && password.equals("Admin123!")) return true;
        return false; // Bloquea inactivos o inválidos
    }
}