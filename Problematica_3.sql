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

SELECT *
FROM prestamo
WHERE loan_total / 100 > 80000 AND loan_type != 'PRENDARIO'
UNION
SELECT *
FROM prestamo
WHERE loan_type = 'PRENDARIO';

SELECT *
FROM prestamo
WHERE loan_total > (SELECT AVG(loan_total) FROM prestamo);

SELECT count(*)
FROM vista_cliente
WHERE edad < 50;

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
