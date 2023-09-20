DROP FUNCTION dbo.f_UltimoNome

CREATE FUNCTION dbo.f_UltimoNome(@nome varchar(200))
RETURNS varchar(200)
AS
BEGIN
	DECLARE @ultimoNome varchar(200) = ' '

	SET @nome = LTRIM(RTRIM(@nome))

	DECLARE @ultimoEspaco int
	SET @ultimoEspaco = CHARINDEX(' ', REVERSE(@nome))

	IF(@ultimoEspaco > 0)
		SET @ultimoNome = RIGHT(@nome, @ultimoEspaco - 1)
	ELSE
		SET @ultimoNome = 'Não foi encontrado'

	RETURN @ultimoNome
END

SELECT dbo.f_UltimoNome('Gabriel Dourado dos Santos') AS 'Último_Nome'