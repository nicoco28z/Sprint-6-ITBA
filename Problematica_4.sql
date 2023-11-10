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
	

--Obtener la cantidad de tarjetas de crédito por tipo por sucursal
SELECT cant_credito, cant_debito, Sucursal_1 AS Sucursal FROM 
  	   (SELECT COUNT(*) AS cant_credito, branch_id as Sucursal_1 
       FROM tarjetas INNER JOIN cliente ON idcliente=customer_id
       WHERE tipo="Credito"
       GROUP BY branch_id) as cons_credito
FULL OUTER JOIN
  (SELECT COUNT(*) AS cant_debito, branch_id as Sucursal_2
       FROM tarjetas INNER JOIN cliente ON idcliente=customer_id
       WHERE tipo="Debito"
       GROUP BY branch_id) as cons_debito
ON Sucursal_2 = Sucursal_1

--Creamos un índice para hacer más eficiente la busqueda de clientes a traves del DNI
CREATE INDEX IF NOT EXISTS busqueda_dni on cliente (customer_dni);

--Creamos la tabla de Movimientos
CREATE TABLE movimientos(
	id INTEGER,
  	nro_cuenta INTEGER,
  	monto REAL,
  	tipo_operacion TEXT,
  	hora DATETIME,
  	FOREIGN KEY (nro_cuenta) REFERENCES cuenta(account_id),
  	PRIMARY KEY (id AUTOINCREMENT)
);

--Mediante el uso de transacciones, hacer una transferencia de 1000$ desde la cuenta 200 a la cuenta 400
BEGIN TRANSACTION;
UPDATE cuenta SET balance = (balance - 1000)
WHERE account_id = 200;

UPDATE cuenta SET balance = (balance + 1000)
WHERE account_id = 400;

--Registrar el movimiento en la tabla movimientos
INSERT INTO movimientos(nro_cuenta, monto, tipo_operacion, hora)
VALUES
	(200, 1000, "Transferencia-salida", DATETIME("now")),
    (400, 1000, "Transferencia-entrada", DATETIME("now"));

--Realizamos el COMMIT para persistir los cambios y nuevos registros agregados
COMMIT;

--En caso de no poder realizar la operación de forma completa, realizarun ROLLBACK
ROLLBACK;