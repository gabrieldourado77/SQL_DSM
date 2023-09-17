DROP FUNCTION dbo.f_Percentual

CREATE FUNCTION dbo.f_Percentual(@valor decimal(10,2), @perc decimal(5,2))
RETURNS decimal(10,2)
AS
BEGIN
	DECLARE @resultado decimal(10,2) = 0.00

	SET @resultado = @valor * (@perc / 100)

	RETURN @resultado
END

SELECT dbo.f_Percentual(250, 77.5)
