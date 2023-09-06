-- Atividade 06 - Exercício 68

CREATE DATABASE gerenciamento_biblioteca;
USE gerenciamento_biblioteca;

CREATE TABLE editora(
	id_editora int NOT NULL,
	nome_editora varchar(50) NOT NULL,
	localizacao varchar(50) NOT NULL,
	PRIMARY KEY(id_editora)
);

CREATE TABLE livro(
	cd_livro int NOT NULL,
	nome_livro varchar(50) NOT NULL,
	genero varchar(50) NOT NULL,
	id_editora int NOT NULL,
	data_lancamento date NOT NULL,
	quant_paginas int NOT NULL,
	preco_livro decimal(8,2),
	PRIMARY KEY(cd_livro),
	FOREIGN KEY(id_editora) REFERENCES editora(id_editora)
);

CREATE TABLE autor(
	cd_autor int NOT NULL,
	nome_autor varchar(50) NOT NULL,
	genero varchar(50) NOT NULL,
	data_nascimento date NOT NULL,
	PRIMARY KEY(cd_autor)
);

CREATE TABLE livro_autor(
	cd_livro_autor int NOT NULL,
	cd_livro int NOT NULL,
	cd_autor int NOT NULL,
	PRIMARY KEY(cd_livro_autor),
	FOREIGN KEY(cd_livro) REFERENCES livro(cd_livro),
	FOREIGN KEY(cd_autor) REFERENCES autor(cd_autor)
);
