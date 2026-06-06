# Criterios de Aceptación del Sistema

## Módulo 1: Login
* **CA-001:** Dado un usuario cocinero registrado y activo, cuando ingresa sus credenciales correctas, entonces el sistema lo redirige al panel principal en menos de 3 segundos.
* **CA-002:** Dado un usuario con contraseña incorrecta, cuando intenta iniciar sesión, entonces el sistema muestra un mensaje de error genérico sin revelar cuál campo falló.
* **CA-003:** Dado un usuario administrador inactivo, cuando intenta autenticarse, entonces el sistema deniega el acceso y muestra un mensaje indicando que la cuenta está deshabilitada.
* **CA-004:** Dado el formulario de login, cuando se intenta enviar con los campos vacíos, entonces el sistema muestra una validación visual en el navegador y no envía la petición.
* **CA-005:** Dado un usuario que intenta ingresar caracteres especiales maliciosos en el campo de texto, cuando presiona ingresar, entonces el sistema sanitiza la entrada y bloquea la solicitud de inicio de sesión.
* **CA-006:** Dado un usuario autenticado, cuando hace clic en "Cerrar Sesión", entonces el sistema destruye el token o sesión activa y lo redirige al Login.

## Módulo 2: Maestro (CRUD Utensilios)
* **CA-007:** Dado el formulario de creación de utensilios, cuando se ingresan todos los campos obligatorios correctamente (nombre, código, stock), entonces el registro se guarda y aparece en el listado general.
* **CA-008:** Dado que se deja el campo "Nombre del Utensilio" vacío, cuando se intenta guardar el formulario, entonces el sistema muestra una alerta de campo obligatorio y bloquea el envío.
* **CA-009:** Dado un código de utensilio que ya existe en el sistema (ej. `TEST_001`), cuando se intenta registrar uno nuevo con ese mismo código, entonces el sistema muestra un error de duplicidad.
* **CA-010:** Dado un utensilio previamente guardado, cuando se modifican sus datos (ej. actualizar la cantidad de stock) y se guarda, entonces los cambios se reflejan inmediatamente en la base de datos y la interfaz.
* **CA-011:** Dado un utensilio sin transacciones ni movimientos asociados, cuando el usuario confirma su eliminación, entonces el registro se borra permanentemente del listado.
* **CA-012:** Dado un utensilio que ya ha sido prestado o movido en el módulo transaccional, cuando se intenta eliminar desde el módulo maestro, entonces el sistema impide la eliminación por integridad referencial y muestra un mensaje explicativo.
* **CA-013:** Dado el buscador del módulo maestro, cuando se ingresa el nombre de un utensilio existente, entonces el listado se filtra mostrando únicamente las coincidencias exactas o parciales.

## Módulo 3: Transaccional (Movimientos / Préstamos de Cocina)
* **CA-014:** Dado el formulario transaccional de préstamos completo con datos válidos, cuando se confirma la operación, entonces el sistema registra el movimiento con estado 'COMPLETADA' y actualiza el stock actual del utensilio.
* **CA-015:** Dado un registro de movimiento, cuando se ingresa una cantidad o monto negativo o igual a cero, entonces el sistema rechaza la transacción mostrando un mensaje de validación de rango.
* **CA-016:** Dado un préstamo de utensilio, cuando el stock disponible es menor a la cantidad solicitada, entonces el sistema bloquea el registro informando la falta de existencias.
* **CA-017:** Dado un usuario que no ha iniciado sesión, cuando intenta acceder al módulo transaccional escribiendo la URL directamente en el navegador, entonces el sistema lo redirige forzosamente a la pantalla de login.
* **CA-018:** Dado un movimiento registrado, cuando se verifica en la base de datos, entonces este debe contener obligatoriamente la fecha y hora exacta en la que se procesó (`NOW()`).
* **CA-019:** Dado un fallo inesperado en el servidor durante el procesamiento de un movimiento que afecta a varias tablas, cuando la operación se interrumpe, entonces el sistema debe aplicar un rollback completo manteniendo la base de datos intacta.
* **CA-020:** Dado el formulario de transacciones, cuando se asocia un ID de usuario inexistente o alterado, entonces la base de datos rechaza la inserción por fallo de clave foránea.