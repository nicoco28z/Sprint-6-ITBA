CREATE TABLE cuentas(
	nroCuenta INT primary key,
    tipo VARCHAR(30) not null,
    idCliente INT not null,
    saldo FLOAT not null,
    moneda ENUM("Peso", "Dolar") not null,
    foreign key (idCliente) references cliente(customer_id),
    foreign key (tipo) references tipo_cuentas(tipo)
);

CREATE TABLE tipo_cuentas(
	tipo VARCHAR(30) primary key
);

CREATE TABLE tipo_classic(
	id INT primary key,
	tarjeta_debito INT,
	retiros_realizados INT,
	chequera INT,
	tipo CHAR(10)
);

CREATE TABLE tipo_gold(
	id INT primary key,
	tarjeta_debito INT,
	retiros_realizados INT,
	chequera INT,
	tipo CHAR(10)
);

CREATE TABLE tipo_black(
	id INT primary key,
	tarjeta_debito INT,
	retiros_realizados INT,
	chequera INT,
	tipo CHAR(10)
);

CREATE TABLE bancos(
	nombre VARCHAR(25) primary key
);

CREATE TABLE tarjetas(
	nroTarjeta INT primary key,
	cvv INT not null,
    fechaVencimiento DATE not null,
    fechaEmision DATE not null,
    idCliente INT not null,
    banco VARCHAR(25) not null,
    tipo ENUM("Credito", "Debito") not null,
    foreign key (idCliente) references cliente(customer_id),
    foreign key (banco) references bancos(nombre)
);

CREATE TABLE direcciones(
	provincia VARCHAR(50),
    ciudad VARCHAR(50),
    calle VARCHAR(50),
    altura INT,
    primary key (provincia, ciudad, calle, altura)
)