CREATE DATABASE atividade10;
USE atividade10;


CREATE TABLE Departamento(
	IdDepto int PRIMARY KEY IDENTITY(1,1),
	NomeDepto varchar(15) NOT NULL,
	Gerente int NOT NULL,
	Divisao varchar(10) NOT NULL,
	Local varchar(15) NOT NULL
);

CREATE TABLE Empregado(
	IdEmpregado int PRIMARY KEY IDENTITY(1,1),
	NomeEmpregado varchar(20) NOT NULL,
	IdDepto int NULL,
	Cargo varchar(6) NOT NULL,
	Tempo_Emp int NULL,
	Salario decimal(10,2) NULL,
	Comissao decimal(10,2) NULL,
	FOREIGN KEY(IdDepto) REFERENCES Departamento(IdDepto)
);


-- Exercício 82

CREATE PROCEDURE sp_DepartamentoUpdate(
	@IdDepto int, @NomeDepto varchar(15), 
	@Gerente int, @Divisao varchar(10),
	@Local varchar(15))
AS
	UPDATE Departamento
	SET
		IdDepto = @IdDepto,
		NomeDepto = @NomeDepto, 
		Gerente = @Gerente,
		Divisao = @Divisao,
		Local = @Local
	WHERE
		IdDepto = @IdDepto


-- Exercício 83

CREATE PROCEDURE sp_DepartamentoDelete(
	@IdDepto int)
AS
	DELETE FROM Departamento
	WHERE 
		IdDepto = @IdDepto


-- Exercício 84

CREATE PROCEDURE sp_EmpregadoInsert(
	@IdEmpregado int, @NomeEmpregado varchar(20), 
	@IdDepto int, @Cargo varchar(6),
	@Tempo_Emp int, @Salario decimal(10,2),
	@Comissao decimal(10,2))
AS
	INSERT INTO Empregado
	VALUES
		(@IdEmpregado, @NomeEmpregado, 
		@IdDepto, @Cargo, @Tempo_Emp, 
		@Salario, @Comissao)


-- Exercício 85

CREATE PROCEDURE sp_EmpregadoUpdate(
	@IdEmpregado int, @NomeEmpregado varchar(20), 
	@IdDepto int, @Cargo varchar(6),
	@Tempo_Emp int, @Salario decimal(10,2),
	@Comissao decimal(10,2))
AS
	UPDATE Empregado
	SET
		IdEmpregado = @IdEmpregado, 
		NomeEmpregado = @NomeEmpregado, 
		IdDepto = @IdDepto, 
		Cargo = @Cargo, 
		Tempo_Emp = @Tempo_Emp, 
		Salario = @Salario, 
		Comissao = @Comissao
	WHERE
		IdEmpregado = @IdEmpregado


-- Exercício 86

CREATE PROCEDURE sp_EmpregadoDelete(
	@IdEmpregado int)
AS
	DELETE FROM Empregado
	WHERE 
		IdEmpregado = @IdEmpregado


-- Exercício 87

CREATE PROCEDURE sp_EmpregadoSelect
AS
	SELECT * FROM Empregado
