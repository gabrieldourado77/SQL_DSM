CREATE DATABASE atividade10;
USE atividade10;


CREATE TABLE Departamento(
	IdDepto int PRIMARY KEY NOT NULL,
	NomeDepto varchar(15) NOT NULL,
	Gerente int NOT NULL,
	Divisao varchar(10) NOT NULL,
	Local varchar(15) NOT NULL
);

CREATE TABLE Empregado(
	IdEmpregado int PRIMARY KEY NOT NULL,
	NomeEmpregado varchar(20) NOT NULL,
	IdDepto int NULL,
	Cargo varchar(6) NOT NULL,
	Tempo_Emp int NULL,
	Salario decimal(10,2) NULL,
	Comissao decimal(10,2) NULL,
	FOREIGN KEY(IdDepto) REFERENCES Departamento(IdDepto)
);
