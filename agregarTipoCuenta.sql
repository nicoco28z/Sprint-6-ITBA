--Agregamos el nuevo campo que va a poder hacer referencia a un determinado tipo de cuenta
--Por default, una cuenta al inicio es de tipo 1 (classic)
ALTER TABLE cuenta ADD tipo_cuenta INTEGER DEFAULT 1 NOT NULL