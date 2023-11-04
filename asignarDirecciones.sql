--Cargamos las direcciones de los clientes y los empleados
--En el caso de coincidir, el empleado es a la vez cliente de banco

ALTER TABLE cliente ADD direccion_id INTEGER;

UPDATE cliente SET direccion_id=(
	SELECT id FROM direcciones WHERE (
    id = customer_id
    )
);

SELECT customer_id, direccion_id, provincia, ciudad, calle FROM cliente JOIN direcciones
WHERE customer_id = id;


ALTER TABLE empleado ADD direccion_id INTEGER;

UPDATE empleado SET direccion_id=(
	SELECT id FROM direcciones WHERE id = employee_id
);