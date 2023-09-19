-- Revis�o para a P1 - DDL (Data Definition Language)
-- Fun��o Escalar

-- Criar uma fun��o
CREATE FUNCTION dbo.funcao(@nome varchar(50)) -- Essa fun��o recebe um nome, como par�metro
RETURNS varchar(50) -- Tipo de valor do retorno
AS
BEGIN -- In�cio
	-- Comandos da fun��o
	RETURN @nome -- Comando para retornar o nome
END -- Fim

-- Chamar uma fun��o
SELECT dbo.funcao('J�ssica');

-- Excluir uma fun��o
DROP FUNCTION dbo.funcao;