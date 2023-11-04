ALTER TABLE sucursal DROP COLUMN branch_address_id;

ALTER TABLE sucursal
ADD id_direccion INTEGER;

ALTER TABLE sucursal
ADD CONSTRAINT fk_direccion FOREIGN KEY (id_direccion) REFERENCES direcciones(id);