# Criterios de Aceptación

| ID     | Módulo         | Criterio de aceptación |
|--------|----------------|------------------------------------------------------------------------------------------------------------------|
| CA-001 | Login          | Dado un usuario registrado y activo, cuando ingresa credenciales correctas, entonces accede al sistema.           |
| CA-002 | Login          | Dado un usuario con contraseña incorrecta, cuando intenta ingresar, entonces el sistema muestra mensaje genérico. |
| CA-003 | Login          | Dado un usuario inactivo, cuando intenta ingresar, entonces el sistema rechaza el acceso.                         |
| CA-004 | Usuario        | Dado el formulario de creación, cuando se ingresan todos los campos obligatorios, el usuario es creado.           |
| CA-005 | Usuario        | Dado un email repetido, cuando se intenta crear, entonces rechaza la acción.                                     |
| CA-006 | Maestro        | Dado el formulario correcto, cuando envía, el utensilio queda en base de datos y se muestra listado.              |
| CA-007 | Maestro        | Dado un campo obligatorio vacío, valida en tiempo real y no envía.                                               |
| CA-008 | Maestro        | Cuando edita un utensilio y guarda, se reflejan los cambios en DB y pantalla.                                    |
| CA-009 | Maestro        | Si intenta eliminar un utensilio usado en pedidos, rechaza la eliminación.                                       |
| CA-010 | Maestro        | Cuando desactiva un utensilio, deja de aparecer en ventas.                                                        |
| CA-011 | Transaccional  | Al registrar pedido con datos correctos, crea pedido, detalles y factura.                                        |
| CA-012 | Transaccional  | Pedido con monto 0 o negativo es rechazado y muestra error.                                                      |
| CA-013 | Transaccional  | Si usuario invita manipular URL, sin login, es redirigido a login.                                               |
| CA-014 | Transaccional  | Solo usuarios activos pueden generar pedidos.                                                                    |
| CA-015 | Ofertas        | Descuentos activos solo se aplican a utensilios con oferta vigente en día/DB.                                    |
| CA-016 | Facturación    | Factura se genera automáticamente al confirmar pedido.                                                           |
| CA-017 | Seguridad      | Tras 5 intentos fallidos login, usuario es bloqueado.                                                            |
| CA-018 | Seguridad      | Solicitud de reseteo de contraseña expira a los 10 minutos.                                                      |
| CA-019 | Usuario        | Email de confirmación se envía al crear usuario nuevo.                                                           |
| CA-020 | Maestro        | Solo administradores pueden agregar, editar o eliminar utensilios.                                               |