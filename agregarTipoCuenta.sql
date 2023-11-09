--Agregamos el nuevo campo que va a poder hacer referencia a un determinado tipo de cuenta
--Por default, una cuenta al inicio es de tipo 1 (classic)

CREATE TABLE tipo_cuenta (
	id INTEGER primary key,
  tarjeta_debito BOOLEAN,
  retiros_realizados INTEGER,
  chequera INTEGER,
  tipo TEXT CHECK (tipo IN ('Tipo_Black', 'Tipo_Classic', 'Tipo_Gold'))
)

ALTER TABLE cuenta ADD tipo_cuenta INTEGER DEFAULT 1 NOT NULL