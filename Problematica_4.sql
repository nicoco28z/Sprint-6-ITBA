SELECT 
	sucursal.branch_name AS sucursal,
	count(*) AS cantidad_empleados
FROM empleado
INNER JOIN sucursal ON empleado.branch_id = sucursal.branch_id
GROUP BY sucursal.branch_name
ORDER BY sucursal.branch_name;

SELECT 
	sucursal.branch_name AS sucursal,
	CAST(count(*) AS REAL)/(SELECT count(*)
							FROM cliente
							INNER JOIN empleado ON empleado.branch_id = cliente.branch_id) AS Cantidad
FROM empleado
INNER JOIN sucursal ON empleado.branch_id = sucursal.branch_id
GROUP BY sucursal.branch_name
ORDER BY sucursal.branch_name;
	
