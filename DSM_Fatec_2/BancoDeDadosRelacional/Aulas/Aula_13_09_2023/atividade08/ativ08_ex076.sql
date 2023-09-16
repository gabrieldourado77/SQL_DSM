DROP FUNCTION dbo.f_DiaSemanaExtenso

CREATE FUNCTION dbo.f_DiaSemanaExtenso(@dia int)
RETURNS varchar(20)
AS
BEGIN
	DECLARE @diaExtenso varchar(20) = ' '
	IF(@dia < 1 OR @dia > 7)
		SET @diaExtenso = 'Dia Inválido!'
	ELSE IF(@dia = 1)
		SET @diaExtenso = '1 = Domingo'
	ELSE IF(@dia = 2)
		SET @diaExtenso = '2 = Segunda'
	ELSE IF(@dia = 3)
		SET @diaExtenso = '3 = Terça'
	ELSE IF(@dia = 4)
		SET @diaExtenso = '4 = Quarta'
	ELSE IF(@dia = 5)
		SET @diaExtenso = '5 = Quinta'
	ELSE IF(@dia = 6)
		SET @diaExtenso = '6 = Sexta'
	ELSE IF(@dia = 7)
		SET @diaExtenso = '7 = Sábado'
	RETURN @diaExtenso
END

SELECT dbo.f_DiaSemanaExtenso(4)
