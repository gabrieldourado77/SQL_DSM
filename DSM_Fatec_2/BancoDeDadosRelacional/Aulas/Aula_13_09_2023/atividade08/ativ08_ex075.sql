DROP FUNCTION dbo.f_MesExtenso

CREATE FUNCTION dbo.f_MesExtenso(@mes int)
RETURNS varchar(20)
AS
BEGIN
	DECLARE @mesExtenso varchar(20) = ' '

	IF(@mes < 1 OR @mes > 12)
		SET @mesExtenso = 'Mês Inválido!'
	ELSE IF(@mes = 1)
		SET @mesExtenso = '1 = Janeiro'
	ELSE IF(@mes = 2)
		SET @mesExtenso = '2 = Fevereiro'
	ELSE IF(@mes = 3)
		SET @mesExtenso = '3 = Março'
	ELSE IF(@mes = 4)
		SET @mesExtenso = '4 = Abril'
	ELSE IF(@mes = 5)
		SET @mesExtenso = '5 = Maio'
	ELSE IF(@mes = 6)
		SET @mesExtenso = '6 = Junho'
	ELSE IF(@mes = 7)
		SET @mesExtenso = '7 = Julho'
	ELSE IF(@mes = 8)
		SET @mesExtenso = '8 = Agosto'
	ELSE IF(@mes = 9)
		SET @mesExtenso = '9 = Setembro'
	ELSE IF(@mes = 10)
		SET @mesExtenso = '10 = Outubro'
	ELSE IF(@mes = 11)
		SET @mesExtenso = '11 = Novembro'
	ELSE IF(@mes = 12)
		SET @mesExtenso = '12 = Dezembro'

	RETURN @mesExtenso
END

SELECT dbo.f_MesExtenso(7)
