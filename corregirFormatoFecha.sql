--Actualizamos el campo employee_hire_date
--Usamos funciones propias de SQLite, e invertimos el formato DD-MM-YYYY a YYYY-MM-DD
UPDATE empleado SET employee_hire_date = substr(employee_hire_date, 7, 4) || '-' || substr(employee_hire_date, 4,2) || '-' || substr(employee_hire_date, 1,2);

--Controlamos que se haya actuallizado correctamente
SELECT employee_hire_date from empleado limit 10