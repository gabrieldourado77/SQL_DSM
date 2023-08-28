# Criação do banco de dados e das tabelas.

CREATE DATABASE atividade01;
USE atividade01;

CREATE TABLE Departamento(
  IdDepto int NOT NULL,
  NomeDepto varchar(15) NOT NULL,
  Gerente int NOT NULL,
  Divisao varchar(10) NOT NULL,
  Local varchar(15) NOT NULL,
  PRIMARY KEY(IdDepto)
);

CREATE TABLE Empregado(
  IdEmpregado int NOT NULL,
  NomeEmpregado varchar(20) NOT NULL,
  IdDepto int NOT NULL,
  Cargo varchar(6) NOT NULL,
  Tempo_Emp int NULL,
  Salario decimal(10,2) NULL,
  Comissao decimal(10,2) NULL,
  PRIMARY KEY(IdEmpregado),
  FOREIGN KEY(IdDepto) REFERENCES Departamento(IdDepto)
);

# Inserção de um registro, em cada tabela.

INSERT INTO Departamento VALUES
(1, 'Administração', 3, 'Finanças', 'Andar 1');

INSERT INTO Empregado VALUES
(1, 'Gabriel', 1, 'ADM', 4, 2500.00, 200.00);

# Consultas pedidas nos exercícios.

SELECT NomeEmpregado, Salario FROM Empregado;

SELECT NomeDepto, Local FROM Departamento;

SELECT NomeEmpregado, Salario, Comissao FROM Empregado 
WHERE Salario > 1800;

SELECT NomeDepto, Divisao, Local FROM Departamento
WHERE Divisao = 'Sul';

SELECT NomeEmpregado, IdDepto, Salario, Cargo FROM Empregado
WHERE Cargo = 'GER' AND Salario < 2000;

SELECT * FROM Empregado 
WHERE Cargo = 'ATEND' OR Salario BETWEEN 1800 AND 2000;

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) AS Remuneracao_Total FROM Empregado;

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) AS Remuneracao_Total FROM Empregado
WHERE Salario > 2000 OR Comissao > 700;

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) AS Remuneracao_Total FROM Empregado
WHERE Salario + Comissao < 1800;

SELECT NomeEmpregado, Cargo FROM Empregado
WHERE NomeEmpregado LIKE 'D%';

SELECT NomeEmpregado, Cargo FROM Empregado
WHERE NomeEmpregado LIKE '__n%';

SELECT NomeEmpregado, Cargo FROM Empregado
WHERE NomeEmpregado LIKE '__N%' OR '__n%';

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) AS Remuneracao_Total FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY NomeEmpregado;

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) AS Remuneracao_Total FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY Salario ASC;

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) AS Remuneracao_Total FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY Salario DESC;

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) AS Remuneracao_Total FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY Salario + Comissao ASC;

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) AS Remuneracao_Total FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY IdDepto ASC, Salario DESC;

SELECT MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, 
AVG(Salario) AS Media_Salarios FROM Empregado;

SELECT MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, 
AVG(Salario) AS Media_Salarios, COUNT(IdEmpregado) AS Quant_Empregados FROM Empregado
WHERE Cargo IN ('GER', 'VENDAS');

SELECT Cargo, MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, 
AVG(Salario) AS Media_Salarios, COUNT(IdEmpregado) AS Quant_Empregados FROM Empregado
GROUP BY Cargo;

SELECT IdDepto, MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, 
AVG(Salario) AS Media_Salarios, COUNT(IdEmpregado) AS Quant_Empregados FROM Empregado
GROUP BY IdDepto;

SELECT IdDepto, MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, 
AVG(Salario) AS Media_Salarios, COUNT(IdEmpregado) AS Quant_Empregados FROM Empregado
WHERE Salario > 1800
GROUP BY IdDepto;

SELECT IdDepto, Cargo, MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, 
AVG(Salario) AS Media_Salarios, COUNT(IdEmpregado) AS Quant_Empregados FROM Empregado
GROUP BY Cargo, IdDepto;

SELECT IdDepto, MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, 
AVG(Salario) AS Media_Salarios, COUNT(IdEmpregado) AS Quant_Empregados FROM Empregado
GROUP BY IdDepto
HAVING COUNT(IdEmpregado) >= 5;

SELECT IdDepto, MAX(Salario) AS Maior_Salario, MIN(Salario) AS Menor_Salario, 
AVG(Salario) AS Media_Salarios, COUNT(IdEmpregado) AS Quant_Empregados FROM Empregado
WHERE Salario > 1400
GROUP BY IdDepto
HAVING COUNT(IdEmpregado) >= 3;

SELECT * FROM Empregado 
WHERE Comissao IS NULL;

SELECT NomeEmpregado, Salario FROM Empregado
WHERE Salario < (SELECT AVG(Salario) FROM Empregado);

SELECT DISTINCT IdDepto FROM Empregado
WHERE Salario > (SELECT AVG(Salario) FROM Empregado);

SELECT NomeEmpregado, Salario FROM Empregado
WHERE Salario = (SELECT MIN(Salario) FROM Empregado GROUP BY IdDepto);

SELECT COUNT(IdEmpregado) AS Quant_Empregados FROM Empregado
WHERE Salario > (SELECT AVG(Salario) FROM Empregado)
GROUP BY IdDepto;