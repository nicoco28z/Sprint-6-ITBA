--Seleccionar las cuentas con saldo negativo
SELECT *
FROM cuenta
WHERE balance < 0;

--Seleccionar el nombre, apellido y edad de los clientes que tengan en el apellido la letra Z
SELECT
	customer_name,
	customer_surname,
	strftime('%Y-%m-%d',CURRENT_DATE) - strftime('%Y-%m-%d', dob) AS edad
FROM cliente
WHERE customer_surname LIKE 'Z%';

--Seleccionar el nombre, apellido, edad y nombre de sucursal de las personascuyo nombre sea “Brendan” y el resultado ordenarlo por nombre desucursa
SELECT
	cliente.customer_name,
	cliente.customer_surname,
	strftime('%Y-%m-%d',CURRENT_DATE) - strftime('%Y-%m-%d', cliente.dob) AS edad,
	sucursal.branch_name
FROM cliente
INNER JOIN sucursal ON cliente.branch_id = sucursal.branch_id
WHERE customer_name like 'Brendan'
ORDER BY sucursal.branch_name;

--Seleccionar de la tabla de préstamos, los préstamos con un importe mayora $80.000 y los préstamos prendarios utilizando la unión de tablas/consultas 
--(recordar que en las bases de datos la moneda se guardacomo integer, en este caso con 2 centavos)
SELECT *
FROM prestamo
WHERE loan_total / 100 > 80000 AND loan_type != 'PRENDARIO'
UNION
SELECT *
FROM prestamo
WHERE loan_type = 'PRENDARIO';

--Seleccionar los prestamos cuyo importe sea mayor que el importe medio detodos los prestamos
SELECT *
FROM prestamo
WHERE loan_total > (SELECT AVG(loan_total) FROM prestamo);

--Contar la cantidad de clientes menores a 50 años
SELECT count(*)
FROM vista_cliente
WHERE edad < 50;

--Seleccionar las primeras 5 cuentas con saldo mayor a 8.000$
SELECT *
FROM cuenta
WHERE balance > 8000
LIMIT 5;

--Seleccionar los préstamos que tengan fecha en abril, junio y agosto, ordenándolos por importe
SELECT *
FROM prestamo
WHERE strftime('%m',loan_date) IN ('04', '06', '08')
ORDER BY loan_total;

--Obtener el importe total de los prestamos agrupados por tipo de préstamos.Por cada tipo de préstamo de la tabla préstamo, calcular la suma de susimportes. 
--Renombrar la columna como loan_total_accu
SELECT
	loan_type,
	sum(loan_total) AS loan_total_accu
FROM prestamo
GROUP BY loan_type;
