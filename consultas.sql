DROP DATABASE IF EXISTS itbadb;
CREATE DATABASE itbabd;
USE itbabd;

CREATE TABLE sucursal(
	id INT primary key,
    nombre CHAR(50) not null,
    direccion VARCHAR(200) not null
);

CREATE TABLE cliente(
	id INT primary key,
    #En el enunciado indica que el DNI es de 10 caracteres
    dni CHAR(10) not null,
    nombre CHAR(30) not null,
    apellido CHAR(30) not null,
    banco_id INT not null,
    foreign key (banco_id) references sucursal(id)
)
