# PLAN DE PRUEBAS FORMAL

## Sistema de Gestión de Utensilios de Cocina

---

# 1. Información General

## 1.1 Nombre del Proyecto

**Sistema de Gestión de Utensilios de Cocina**

## 1.2 Objetivo del Plan de Pruebas

Definir la estrategia, alcance, recursos, criterios y procedimientos necesarios para verificar y validar el correcto funcionamiento del Sistema de Gestión de Utensilios de Cocina, garantizando la calidad del software, la integridad de la información y el cumplimiento de los requisitos funcionales y no funcionales establecidos.

## 1.3 Descripción del Sistema

El sistema es una aplicación web diseñada para la administración, control y trazabilidad de utensilios de cocina profesionales. Permite gestionar usuarios, controlar inventarios, registrar movimientos de entrada y salida de implementos, así como mantener la integridad y disponibilidad de la información operativa.

---

# 2. Arquitectura Tecnológica

| Componente    | Tecnología                 |
| ------------- | -------------------------- |
| Frontend      | HTML5, CSS3, JavaScript    |
| Navegación    | Routing basado en Hash (#) |
| Backend       | PHP 8.x                    |
| Arquitectura  | Servicios y Controladores  |
| Base de Datos | MySQL 8.x                  |
| Servidor Web  | Apache (XAMPP / Localhost) |
| APIs          | RESTful JSON               |

---

# 3. Objetivos de las Pruebas

### Objetivo General

Verificar que todas las funcionalidades del sistema operen de acuerdo con los requisitos definidos, garantizando seguridad, confiabilidad, integridad de datos y estabilidad operativa.

### Objetivos Específicos

* Validar el proceso de autenticación y control de sesiones.
* Verificar las operaciones CRUD del módulo de utensilios.
* Comprobar la correcta gestión de movimientos de inventario.
* Evaluar la integridad de la información almacenada.
* Detectar vulnerabilidades de seguridad.
* Validar la interacción entre frontend, backend y base de datos.

---

# 4. Alcance de las Pruebas

## 4.1 Módulos Incluidos

### Módulo de Autenticación

* Inicio de sesión.
* Validación de credenciales.
* Gestión de sesiones.
* Cierre de sesión.
* Restricción de acceso a usuarios no autenticados.

### Módulo Maestro de Utensilios

* Registro de utensilios.
* Consulta de utensilios.
* Edición de registros.
* Eliminación de utensilios.
* Búsquedas y filtrados.

### Módulo Transaccional de Inventario

* Registro de entradas.
* Registro de salidas.
* Ajustes de inventario.
* Actualización automática de stock.
* Historial de movimientos.

## 4.2 Módulos Excluidos

Las siguientes actividades no forman parte del alcance actual:

* Pruebas de carga masiva bajo alta concurrencia.
* Pruebas de estrés en infraestructura.
* Despliegue y validación en ambientes productivos o nube.
* Pruebas de compatibilidad móvil avanzada.

---

# 5. Estrategia de Pruebas

## 5.1 Pruebas Unitarias

**Objetivo:** Validar el funcionamiento individual de métodos y servicios del backend.

### Herramienta

* JUnit 5

### Cobertura

* Servicios de autenticación.
* Servicios de inventario.
* Validaciones de negocio.
* Controladores principales.

---

## 5.2 Pruebas Funcionales

**Objetivo:** Validar que cada requisito funcional opere correctamente desde la perspectiva del usuario.

### Herramienta

* Selenium IDE

### Casos Principales

* Inicio de sesión exitoso.
* Inicio de sesión fallido.
* Creación de utensilios.
* Edición de utensilios.
* Eliminación de utensilios.
* Registro de movimientos de inventario.

---

## 5.3 Pruebas de Integración API

**Objetivo:** Verificar la correcta comunicación entre frontend, backend y base de datos.

### Herramienta

* Postman

### Validaciones

* Códigos HTTP.
* Estructura JSON.
* Manejo de errores.
* Validación de autenticación.
* Consistencia de datos.

---

## 5.4 Pruebas de Base de Datos

**Objetivo:** Garantizar la integridad, consistencia y atomicidad de las transacciones.

### Herramienta

* MySQL Workbench

### Validaciones

* Restricciones de integridad.
* Llaves primarias y foráneas.
* Transacciones ACID.
* Validación de stock.
* Consistencia de registros históricos.

---

## 5.5 Pruebas de Seguridad

**Objetivo:** Identificar vulnerabilidades explotables desde el exterior del sistema.

### Herramienta

* OWASP ZAP

### Escenarios

* Inyección SQL.
* Cross Site Scripting (XSS).
* Manipulación de sesiones.
* Acceso no autorizado.
* Exposición de información sensible.
* Validación de endpoints protegidos.

---

# 6. Ambiente de Pruebas

| Elemento          | Configuración                                     |
| ----------------- | ------------------------------------------------- |
| Sistema Operativo | Windows 10 / Windows 11 (64 bits)                 |
| Navegador         | Google Chrome (Última versión estable)            |
| Backend           | PHP 8.x                                           |
| Servidor Web      | Apache (XAMPP)                                    |
| Base de Datos     | MySQL 8.x                                         |
| Java              | JDK 17 o JDK 21                                   |
| Herramientas QA   | Selenium IDE, Postman, OWASP ZAP, MySQL Workbench |

---

# 7. Criterios de Aceptación

Se considerará que el sistema supera la fase de pruebas cuando:

* El 100% de los casos críticos sean aprobados.
* No existan defectos de severidad alta o crítica abiertos.
* La integridad del inventario se mantenga en todos los escenarios.
* No se detecten vulnerabilidades críticas de seguridad.
* Todas las APIs respondan correctamente según especificación.

---

# 8. Matriz de Riesgos

| ID   | Riesgo                                                     | Impacto | Probabilidad | Nivel   | Mitigación                                         |
| ---- | ---------------------------------------------------------- | ------- | ------------ | ------- | -------------------------------------------------- |
| R-01 | Acceso no autorizado mediante manipulación de URL Hash (#) | Alto    | Media        | Alto    | Validación de sesión activa en frontend y backend  |
| R-02 | Inconsistencia de inventario por transacciones simultáneas | Crítico | Media        | Crítico | Uso de transacciones ACID y restricciones de stock |
| R-03 | Eliminación accidental de registros                        | Medio   | Baja         | Medio   | Confirmaciones y auditoría de cambios              |
| R-04 | Inyección SQL en formularios                               | Alto    | Media        | Alto    | Consultas preparadas y validación de entradas      |
| R-05 | Pérdida de sesión por expiración incorrecta                | Medio   | Baja         | Medio   | Gestión adecuada de tokens y sesiones              |

---

# 9. Entregables

Al finalizar la ejecución se generarán los siguientes documentos:

1. Plan de Pruebas.
2. Casos de Prueba.
3. Evidencias de Ejecución.
4. Registro de Defectos (Bug Reports).
5. Informe Final de Resultados.
6. Matriz de Trazabilidad de Requisitos.
7. Acta de Aceptación de Pruebas.

---

# 10. Conclusión

La ejecución de este Plan de Pruebas permitirá validar la calidad funcional, técnica y de seguridad del Sistema de Gestión de Utensilios de Cocina, asegurando que los procesos de administración de inventario, control de acceso y trazabilidad operen de manera confiable, segura y conforme a los requisitos definidos para el proyecto.
