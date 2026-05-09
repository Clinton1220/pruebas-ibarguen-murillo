# Plan de Pruebas - Cocina

## Nombre del sistema y descripción breve
Cocina: Plataforma web para administración y venta de utensilios de cocina. Módulos: login/usuario, CRUD de utensilios (maestro), compras transaccionales y pedidos.

## Tecnologías usadas
- Backend: PHP 8.2
- Frontend: HTML/CSS/JavaScript
- Base de datos: MariaDB 10.4 (cocina_db)
- Servidor web: Apache 2.4 sobre Windows 10

## Alcance
**Se prueba:** login, gestión de usuarios, utensilios, pedidos, facturación, recuperación de contraseña, ofertas diarias.  
**No se prueba:** integración PayPal (mockeada), chatbot experimental.

## Tipos de prueba
- Unitarias (lógica PHP)
- Funcionales (flujos completos)
- API (REST, Postman)
- Base de datos
- Seguridad (ZAP)

## Ambiente de prueba
- Windows 10
- Chrome 124
- PHP 8.2.x
- MariaDB 10.4.x

## Riesgos y mitigación
- Desincronización backend/base: tests por commit y scripts SQL
- Permisos mal gestionados: validaciones roles
- Datos corruptos: ambientes separados