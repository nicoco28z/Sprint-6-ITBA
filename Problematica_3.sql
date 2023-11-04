SELECT *
FROM cuenta
WHERE balance < 0;

SELECT
	customer_name,
	customer_surname,
	strftime('%Y-%m-%d',CURRENT_DATE) - strftime('%Y-%m-%d', dob) AS edad
FROM cliente
WHERE customer_surname LIKE 'Z%';

SELECT
	cliente.customer_name,
	cliente.customer_surname,
	strftime('%Y-%m-%d',CURRENT_DATE) - strftime('%Y-%m-%d', cliente.dob) AS edad,
	sucursal.branch_name
FROM cliente
INNER JOIN sucursal ON cliente.branch_id = sucursal.branch_id
WHERE customer_name like 'Brendan'
ORDER BY sucursal.branch_name;

--Revisar
SELECT *
FROM prestamo
WHERE loan_total / 100 > 80000;

--Revisar
SELECT *
FROM prestamo;

SELECT count(*) as clientes_menores_de_50_años
FROM cliente
WHERE strftime('%Y-%m-%d',CURRENT_DATE) - strftime('%Y-%m-%d', cliente.dob) < 50;

SELECT *
FROM cuenta
WHERE balance > 8000
LIMIT 5;

SELECT *
FROM prestamo
WHERE strftime('%m',loan_date) IN ('04', '06', '08')
ORDER BY loan_total;

SELECT
	loan_type,
	sum(loan_total) AS loan_total_accu
FROM prestamo
GROUP BY loan_type;
