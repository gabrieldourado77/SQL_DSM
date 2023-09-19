-- Revis�o para a P1 - DML (Data Manipulation Language)
-- SELECT, Subconsultas, GROUP BY e HAVING 

-- Exibir todos os dados de uma tabela
SELECT * FROM nome_tabela;

-- Exibir os dados de colunas espec�ficas
SELECT nome FROM nome_tabela;

-- AS - Colocar um apelido para uma coluna
SELECT nome AS Nome_Funcionario FROM nome_tabela;


-- Fun��es de agrega��o

-- M�dia
SELECT AVG(salario) FROM nome_tabela;

-- Menor valor
SELECT MIN(salario) FROM nome_tabela;

-- Maior valor
SELECT MAX(salario) FROM nome_tabela;

-- Valores distintos (sem repeti��o)
SELECT DISTINCT(salario) FROM nome_tabela;

-- Substituir um valor nulo por zero
SELECT ISNULL(salario, 0) AS Salario FROM nome_tabela;


-- Operadores IS NULL, IS NOT NULL e IN
-- Exemplos:

-- IS NULL - Verifica se o valor � nulo
SELECT nome, salario FROM nome_tabela
WHERE salario IS NULL;

-- IS NOT NULL - Verifica se o valor n�o � nulo
SELECT nome, salario FROM nome_tabela
WHERE salario IS NOT NULL;

-- IN - Re�ne um conjunto de valores, para faciltar a consulta
SELECT nome, salario FROM nome_tabela
WHERE salario IN (1000, 2000, 3000);


-- Subconsultas - S�o consultas, que ficam dentro de outras consultas.
-- Exemplos:

-- Empregados, com s�larios maiores, do que a m�dia salarial de todos os empregados
SELECT nome, salario FROM empregado
WHERE salario > (SELECT AVG(salario) FROM empregado);


-- Fun��es de Agrupamento

-- GROUP BY - Ele agrupa um conjunto de registros e ajuda a fazer consultas mais precisas
-- Exemplo:

-- Empregados, com s�larios maiores, do que a m�dia salarial do seu departamento, 
-- separados por departamento.
SELECT nome, salario FROM empregado
WHERE salario > (SELECT AVG(salario) FROM empregado)
GROUP BY id_departamento;


-- O HAVING, � o "filtro" do GROUP BY e funciona quase igual ao WHERE.
-- Exemplo:

-- Funcion�rios, com s�larios maiores do que 2000 reais e que 
-- fazem parte dos departamentos, com os IDs 1 e 2
SELECT nome, salario FROM empregado
WHERE salario > 2000
GROUP BY id_departamento -- Agrupei pelo departamento
HAVING id_departamento IN (1, 2); -- Filtrei pelos IDs