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


--Obtener el promedio de créditos otorgado por sucursal
SELECT sucursal.branch_name AS sucursales, AVG(prestamo.loan_total) AS promedio_creditos
FROM prestamo
INNER JOIN cliente ON prestamo.customer_id = cliente.customer_id
INNER JOIN sucursal ON cliente.branch_id = sucursal.branch_id
GROUP BY sucursal.branch_name;

--TRIGGER
CREATE TABLE "auditoria_cuenta" (
	"old_id"	INTEGER,
	"new_id"	INTEGER,
	"old_balance"	NUMERIC,
	"new_balance"	NUMERIC NOT NULL,
	"old_iban"	TEXT NOT NULL,
	"new_iban"	TEXT NOT NULL,
	"old_tipo_cuenta"	INTEGER NOT NULL,
	"new_tipo_cuenta"	INTEGER NOT NULL,
	"user_action"	INTEGER NOT NULL,
	"created_at"	DATETIME NOT NULL
);

DROP TRIGGER IF EXISTS CUENTAS_BU;
CREATE TRIGGER CUENTAS_BU
BEFORE UPDATE ON cuenta
FOR EACH ROW
WHEN NEW.balance != OLD.balance OR OLD.account_id != NEW.account_id OR NEW.iban != OLD.iban OR NEW.tipo_cuenta != OLD.tipo_cuenta
BEGIN
    INSERT INTO auditoria_cuenta (old_id, new_id, old_balance, new_balance, old_iban, 
new_iban, old_tipo_cuenta, new_tipo_cuenta, user_action, created_at )
	 VALUES (
	    OLD.account_id,
        NEW.account_id,
        OLD.balance,
        NEW.balance,
        OLD.iban,
        NEW.iban,
        OLD.tipo_cuenta,
        NEW.tipo_cuenta,
        'Update',
       	DATE("now")
    );
END;

UPDATE cuenta 
SET balance = balance - 100
WHERE account_id IN (10, 11, 12, 13, 14);


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