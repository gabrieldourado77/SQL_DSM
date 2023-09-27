CREATE DATABASE atividade09;
USE atividade09;


-- Exercício 82
CREATE TABLE Funcionarios(
	ID int PRIMARY KEY AUTO_INCREMENT,
	Nome varchar(50) NOT NULL,
	Cargo varchar(50) NULL,
	Salario decimal(10,2) NULL
);


-- Exercício 83
ALTER TABLE Funcionarios 
ADD Departamento int NOT NULL;


-- Exercício 84
CREATE TABLE Departamentos(
	ID_Departamento int PRIMARY KEY AUTO_INCREMENT,
	Nome_Departamento varchar(50) NOT NULL
);


-- Exercício 85
INSERT INTO Funcionarios(Nome, Cargo, Salario, Departamento) VALUES
('Jéssica', 'Gerente', 2500, 1);


-- Exercício 86
UPDATE Funcionarios 
SET Salario = 65000
WHERE ID = 1;


-- Exercício 87
DELETE FROM Funcionarios
WHERE Salario < 50000;


-- Exercício 88
SELECT Nome, Departamento FROM Funcionarios;

-- Exercício 89
CREATE TABLE Clientes(
	ID_Cliente int PRIMARY KEY AUTO_INCREMENT,
	Nome varchar(50) NOT NULL,
	Email varchar(50) NULL
);


-- Exercício 90
CREATE TABLE Pedidos(
	ID_Pedido int PRIMARY KEY AUTO_INCREMENT,
	ID_Cliente int NOT NULL,
	Data_Pedido date NULL,
	Total_Pedido decimal(10,2) NULL,
	FOREIGN KEY(ID_Cliente) REFERENCES Clientes(ID_Cliente)
);


-- Exercício 91
INSERT INTO Clientes(Nome, Email) VALUES
('Vanessa', 'vanessa@gmail.com');

INSERT INTO Clientes(Nome, Email) VALUES
('Claúdia', 'claudia@gmail.com');


-- Exercício 92
INSERT INTO Pedidos(ID_Cliente, Data_Pedido, Total_Pedido) VALUES
(1, '2023-09-27', 100);

INSERT INTO Pedidos(ID_Cliente, Data_Pedido, Total_Pedido) VALUES
(1, '2023-09-27', 50);

INSERT INTO Pedidos(ID_Cliente, Data_Pedido, Total_Pedido) VALUES
(2, '2023-09-27', 80);


-- Exercício 93
SELECT Clientes.Nome, Pedidos.ID_Pedido, Pedidos.Total_Pedido
FROM Pedidos
LEFT JOIN Clientes ON Clientes.ID_Cliente = Pedidos.ID_Cliente;


-- Exercício 94
UPDATE Clientes
SET Email = 'maria_new@example.com'
WHERE Nome = 'Maria Santos';


-- Exercício 95
DELETE FROM Pedidos
WHERE Total_Pedido < 80;
