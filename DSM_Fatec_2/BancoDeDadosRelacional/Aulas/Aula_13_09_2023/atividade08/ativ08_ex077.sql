DROP FUNCTION dbo.f_ParImpar

CREATE FUNCTION dbo.f_ParImpar(@numero int)
RETURNS varchar(10)
AS
BEGIN
	DECLARE @resposta varchar(10) = ' '

	IF(@numero % 2 = 0)
		SET @resposta = 'Par'
	ELSE
		SET @resposta = 'Ímpar'

	RETURN @resposta
END

SELECT dbo.f_ParImpar(4)
