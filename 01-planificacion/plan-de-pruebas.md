# Plan de Pruebas Formal — Sistema de Gestión de Utensilios de Cocina

### 1. Descripción General del Sistema
El sistema bajo prueba es una aplicación web destinada a la gestión, control de inventario y trazabilidad de utensilios de cocina profesionales. Permite el control de acceso de usuarios, la administración del catálogo de implementos y el registro de movimientos transaccionales de stock.

### 2. Tecnologías Utilizadas
* [cite_start]**Frontend:** HTML5, CSS3, JavaScript (Navegación basada en hashes `#`)[cite: 54].
* [cite_start]**Backend:** PHP 8.x (Arquitectura basada en Servicios/Controladores)[cite: 51].
* [cite_start]**Base de Datos:** MySQL 8.x[cite: 51, 54].
* [cite_start]**Servidor Web:** Apache (XAMPP / Localhost)[cite: 51].

### 3. Alcance de las Pruebas
* **Módulos Incluidos:**
  1. [cite_start]Autenticación (Login y control de sesiones)[cite: 20].
  2. [cite_start]Módulo Maestro (CRUD completo de Utensilios: Crear, Listar, Editar, Eliminar)[cite: 20].
  3. [cite_start]Módulo Transaccional (Registro de movimientos de inventario: Entradas, Salidas y Ajustes)[cite: 20].
* [cite_start]**Módulos Excluidos:** Rendimiento de carga bajo concurrencia extrema (JMeter es opcional) [cite: 35] y despliegue en servidores en la nube (producción).

### 4. Tipos de Prueba a Ejecutar
* [cite_start]Pruebas Unitarias del Backend (JUnit 5)[cite: 31, 34].
* [cite_start]Pruebas Funcionales de Caja Negra (Selenium IDE)[cite: 31, 34].
* [cite_start]Pruebas de API de Integración (Postman REST)[cite: 31, 34].
* [cite_start]Pruebas de Consistencia y Atomicidad de Base de Datos (MySQL Workbench)[cite: 31, 34].
* [cite_start]Pruebas de Seguridad de Caja Negra (OWASP ZAP)[cite: 31, 34].

### 5. Ambiente de Pruebas
* [cite_start]**Sistema Operativo:** Windows 10 / 11 de 64 bits[cite: 54].
* [cite_start]**Navegador Web:** Google Chrome (Versión estable más reciente)[cite: 54].
* [cite_start]**Entorno Java (para JUnit):** JDK 17 / 21[cite: 54].

### 6. Matriz de Riesgos y Mitigación
* **Riesgo 1 (Bypass de Seguridad):** Acceso directo a vistas internas a través de manipulación de la URL hash (`#`). 
  * *Mitigación:* Implementar un interceptor funcional en JavaScript y una validación de sesión activa en las API de PHP.
* **Riesgo 2 (Inconsistencia de Inventario):** Registro de transacciones concurrentes que provoquen stock negativo.
  * *Mitigación:* Validar a nivel de base de datos que el campo `stock` sea `>= 0` y envolver el flujo en transacciones ACID con bloqueos controlados.
