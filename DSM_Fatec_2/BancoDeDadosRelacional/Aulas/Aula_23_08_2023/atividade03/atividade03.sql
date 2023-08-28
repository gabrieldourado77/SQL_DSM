# Criação do banco de dados e das tabelas.

CREATE DATABASE atividade03;
USE atividade03;

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
    PRIMARY KEY(IdEmpregado)
);

# Inserção de dois registros, em cada tabela.

INSERT INTO Departamento VALUES
(1, 'Administração', 3, 'Leste', 'Santo André');

INSERT INTO Departamento VALUES
(2, 'Finanças', 5, 'Centro', 'São Paulo');

INSERT INTO Empregado VALUES
(1, 'Gabriel', 1, 'ADM', 4, 2500.00, 200.00);

INSERT INTO Empregado VALUES
(2, 'Vanessa', 2, 'CONT', 4, NULL, 200.00);

# Consultas pedidas nos exercícios.

SELECT Divisao AS 'Divisões' 
FROM Departamento;

SELECT DISTINCT Divisao AS 'Divisões' 
FROM Departamento;

SELECT CONCAT(Divisao, ' - ', Local) AS 'Divisão + Local' 
FROM Departamento;

SELECT NomeEmpregado AS 'Nome', 
Salario AS 'Salário', 
Salario * 1.1 AS 'Salário Mais 10%', 
Salario * 1.2 AS 'Salário Mais 20%', 
Salario * 0.9 AS 'Salário Menos 10%', 
Salario * 0.8 AS 'Salário Menos 20%'
FROM Empregado;

SELECT NomeEmpregado AS 'Nome',
COALESCE(Salario, 0) AS 'Salário',
COALESCE(Salario + Comissao, 0) AS 'Salário Total',
COALESCE((Salario + Comissao) * 12, 0) AS 'Salário Total Anual',
COALESCE((Salario + Comissao) * 0.05, 0) AS 'Valor Desconto Imposto de Renda',
COALESCE((Salario + Comissao) * 0.02, 0) AS 'Valor Desconto Plano de Saúde',
COALESCE((Salario + Comissao) * 0.015, 0) AS 'Valor Desconto Alimentação',
COALESCE((Salario + Comissao) - ((Salario + Comissao) * (0.05 + 0.02 + 0.015)), 0) AS 'Salário Líquido',
COALESCE(Salario / 30, 0) AS 'Salário Diário',
COALESCE(Salario / 30 / 8, 0) AS 'Salário por Hora',
COALESCE(Salario / 30 / 8 / 60, 0) AS 'Salário por Minuto',
COALESCE(Salario / 30 / 8 / 60 / 60, 0) AS 'Salário por Segundo'
FROM Empregado;