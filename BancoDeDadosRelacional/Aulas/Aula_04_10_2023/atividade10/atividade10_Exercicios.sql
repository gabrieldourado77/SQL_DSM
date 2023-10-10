USE atividade10;


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

GO

EXECUTE sp_DepartamentoUpdate 1, 'ADM', 1, 'Sudeste', 'São Paulo'


-- Exercício 83

CREATE PROCEDURE sp_DepartamentoDelete(
	@IdDepto int,
	@TotalDepartamentos int OUTPUT)
AS
	DELETE FROM Departamento
	WHERE 
		IdDepto = @IdDepto

	SELECT @TotalDepartamentos = COUNT(*) FROM Departamento

GO

DECLARE @TotalDepartamentos int 
EXECUTE sp_DepartamentoDelete 1, @TotalDepartamentos OUTPUT

SELECT @TotalDepartamentos AS 'Quant. de Departamentos'


-- Exercício 84

CREATE PROCEDURE sp_EmpregadoInsert(
	@IdEmpregado int, @NomeEmpregado varchar(20), 
	@IdDepto int, @Cargo varchar(6),
	@Tempo_Emp int, @Salario decimal(10,2),
	@Comissao decimal(10,2),
	@TotalEmpregados int OUTPUT)
AS
	INSERT INTO Empregado
	VALUES
		(@IdEmpregado, @NomeEmpregado, 
		@IdDepto, @Cargo, @Tempo_Emp, 
		@Salario, @Comissao)

	SELECT @TotalEmpregados = COUNT(*) FROM Empregado

GO

DECLARE @TotalEmpregados int 
EXECUTE sp_EmpregadoInsert 1, 'Jéssica', 1, 'Cont', 4, 3000, 500, 
	@TotalEmpregados OUTPUT

SELECT @TotalEmpregados AS 'Quant. de Empregados'


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

GO

EXECUTE sp_EmpregadoUpdate 1, 'Vanessa', 1, 'Cont', 2, 2500, 500


-- Exercício 86

CREATE PROCEDURE sp_EmpregadoDelete(
	@IdEmpregado int,
	@TotalEmpregados int OUTPUT)
AS
	DELETE FROM Empregado
	WHERE 
		IdEmpregado = @IdEmpregado

	SELECT @TotalEmpregados = COUNT(*) FROM Empregado

GO

DECLARE @TotalEmpregados int 
EXECUTE sp_EmpregadoDelete 1, @TotalEmpregados OUTPUT

SELECT @TotalEmpregados AS 'Quant. de Empregados'


-- Exercício 87

CREATE PROCEDURE sp_EmpregadoSelect
AS
	SELECT * FROM Empregado

GO

EXECUTE sp_EmpregadoSelect
