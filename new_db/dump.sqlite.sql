-- TABLE
CREATE TABLE bancos(
	nombre VARCHAR(25) primary key
);
CREATE TABLE "cliente" (
	"customer_id"	INTEGER NOT NULL,
	"customer_name"	TEXT NOT NULL,
	"customer_surname"	NUMERIC NOT NULL,
	"customer_DNI"	TEXT NOT NULL,
	"dob"	TEXT,
	"branch_id"	INTEGER NOT NULL,
	PRIMARY KEY("customer_id" AUTOINCREMENT)
);
CREATE TABLE "cuenta" (
	"account_id"	INTEGER NOT NULL,
	"customer_id"	INTEGER NOT NULL,
	"balance"	INTEGER NOT NULL,
	"iban"	TEXT NOT NULL,
	PRIMARY KEY("account_id" AUTOINCREMENT)
);
CREATE TABLE `direcciones` (
 `id` INTEGER primary key AUTOINCREMENT,
  `provincia` varchar(255),
  `ciudad` varchar(255),
  `calle` varchar(255)
);
CREATE TABLE "empleado" (
	"employee_id"	INTEGER NOT NULL,
	"employee_name"	TEXT NOT NULL,
	"employee_surname"	TEXT NOT NULL,
	"employee_hire_date"	TEXT NOT NULL,
	"employee_DNI"	TEXT NOT NULL,
	"branch_id"	INTEGER NOT NULL,
	PRIMARY KEY("employee_id" AUTOINCREMENT)
);
CREATE TABLE "prestamo" (
	"loan_id"	INTEGER NOT NULL,
	"loan_type"	TEXT NOT NULL,
	"loan_date"	TEXT NOT NULL,
	"loan_total"	INTEGER NOT NULL,
	"customer_id"	INTEGER NOT NULL,
	PRIMARY KEY("loan_id" AUTOINCREMENT)
);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE "sucursal" (
	"branch_id"	INTEGER NOT NULL,
	"branch_number"	BLOB NOT NULL,
	"branch_name"	TEXT NOT NULL, id_direccion INTEGER,
	PRIMARY KEY("branch_id" AUTOINCREMENT)
);
CREATE TABLE "tarjetas" (
  `nroTarjeta` varchar(255) PRIMARY KEY,
  `cvv` varchar(255),
  `fechaEmision` varchar(255),
  `fechaVencimiento` varchar(255),
  `idCliente` mediumint NOT NULL,
  `banco` varchar(255) NOT NULL,
  `tipo` varchar(255) not NULL,
  foreign key (idcliente) REFERENCES cliente(customer_id),
  FOREIGN KEY (banco) REFERENCES bancos(nombre)
);
CREATE TABLE tipo_black(
	id INT primary key,
	tarjeta_debito INT,
	retiros_realizados INT,
	chequera INT,
	tipo CHAR(10)
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
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
