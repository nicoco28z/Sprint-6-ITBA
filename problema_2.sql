--vista
CREATE VIEW vista_cliente AS
SELECT
    customer_id,
    branch_id,
    customer_name as nombre,
    customer_surname as apellido,
    customer_dni as DNI,
    cast(strftime('%Y.%m%d', 'now') - strftime('%Y.%m%d', dob) as int) as edad
FROM cliente;

--Controlamos la vista creada
SELECT * from vista_cliente;


--Mostrar las columnas de los clientes, ordenadas por el DNI de menora mayor y cuya edad sea superior a 40 años
SELECT * from vista_cliente
WHERE edad > 40
ORDER BY dni ASC;


--Mostrar todos los clientes que se llaman “Anne” o “Tyler” ordenadospor edad de menor a mayor
SELECT * from vista_cliente
WHERE nombre = "Anne" OR nombre = "Tyler"
ORDER BY edad ASC;


--Cargamos los datos del JSON
INSERT INTO cliente (customer_name,customer_surname,customer_DNI,branch_id,dob)
VALUES
  ('Lois', 'Stout', 47730534, 80, '1984-07-07'),
  ('Hall', 'Mcconnell', 52055464, 45, '1968-04-30'),
  ('Hilel', 'Mclean', 43625213, 77, '1993-03-28'),
  ('Jin', 'Cooley', 21207908, 96, '1959-08-24'),
  ('Gabriel', 'Harmon', 57063950, 27, '1976-04-01');

--Verificamos que se hayan cargado correctamente buscando por el DNI
SELECT * FROM cliente
WHERE customer_DNI IN (47730534, 52055464, 43625213, 21207908, 57063950);

--Actualizar 5 clientes recientemente agregados en la base de datos dado quehubo un 
--error en el JSON que traía la información, la sucursal de todos esla 10
UPDATE cliente
SET branch_id = 10
WHERE customer_DNI IN (47730534, 52055464, 43625213, 21207908, 57063950);

--Eliminar el registro correspondiente a “Noel David” realizando la selecciónpor el nombre y apellido
--Nos aseguramos que lo que vamos a eliminar es lo que estamos indicando en la consulta
SELECT customer_name, customer_surname, customer_DNI FROM cliente
WHERE customer_name = 'Noel' AND customer_surname = 'David';

--Si concuerda con lo que queremos dar de baja, usamos la consulta DELETE
DELETE FROM cliente
WHERE customer_name = 'Noel' AND customer_surname = 'David';

--Consultar sobre cuál es el tipo de préstamo de mayor importe
--Usamos una subconsulta para saber cual es el mayor importe de todos los prestamos
--Ahora buscamos los tipos de prestamo que hayan 
SELECT loan_type from prestamo
WHERE loan_total = (SELECT MAX(loan_total) from prestamo);