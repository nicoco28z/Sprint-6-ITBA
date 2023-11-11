# Sprint-6-ITBA:

## Descripción
Este repositorio contiene el desarrollo y las soluciones implementadas para abordar las problemáticas planteadas en el Sprint-6. El objetivo principal fue ampliar el modelo de datos, involucrando la integración de nuevas entidades generadas por el homebanking y la resolución de requerimientos de consulta y manipulación de datos.

## Problemáticas Abordadas

### Problemática 1: Ampliación del Modelo de Datos
**Detalles:**
- Desarrollo de nuevas entidades y campos en la base de datos ITBANK, relacionadas con el home banking.
  
**Acciones Realizadas:**
- Creación de tipos de cliente, cuenta y marcas de tarjeta.
- Definición de atributos para la entidad ```tarjeta``` considerando requisitos de operación del home banking.
- Establecimiento de relaciones entre tarjetas, marcas de tarjeta y clientes.
- Inserción de 500 tarjetas de crédito aleatorias asociadas a clientes.
- Ampliación de la entidad ```direcciones``` para su uso por clientes, empleados y sucursales.
- Asignación aleatoria de direcciones a empleados, clientes y sucursales.
- Ampliación del alcance de la entidad ```cuenta``` para identificar el tipo de cuenta.
- Corrección del campo ```employee_hire_date``` en la tabla de empleados.

### Problemática 2: Requerimientos de Consulta Frecuente
**Acciones Realizadas:**
- Creación de vistas y consultas para:
  - Obtener información específica de clientes (nombre, apellido, DNI, edad).
  - Inserción de 5 nuevos clientes desde un archivo JSON.
  - Actualización de clientes por corrección en datos.
  - Eliminación de registro específico por nombre y apellido.
  - Consultas sobre tipos de préstamos y su importe.

### Problemática 3: Consultas Específicas
**Acciones Realizadas:**
- Selección de cuentas con saldo negativo.
- Consultas por criterios de nombre, apellido, edad y sucursal.
- Consultas sobre importes de préstamos.
- Análisis de la edad de clientes y conteo de clientes menores a 50 años.
- Consultas sobre préstamos con fechas específicas.
- Cálculo del importe total de préstamos por tipo.

### Problemática 4: Optimización y Funcionalidades Adicionales
**Acciones Realizadas:**
- Implementación de consultas para obtener datos críticos.
- Creación de una tabla de auditoría para movimientos de cuentas.
- Creación de un trigger para registrar cambios en la tabla ```cuentas```.
- Uso de índices para mejorar la búsqueda de clientes por DNI.
- Creación de la tabla ```movimientos``` y realización de transacciones.

## Instrucciones de Uso
No hace falta ejecutar las querys de inserción de datos ya que la base de datos completa se encuentra en ```new_db```.

## Requerimientos
Contar con un motor de base de datos SQLite, o utilizar un motor online, por ejemplo: https://sqliteonline.com/ .
