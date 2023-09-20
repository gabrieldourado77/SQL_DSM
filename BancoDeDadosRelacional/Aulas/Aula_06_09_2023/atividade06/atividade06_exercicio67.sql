-- Atividade 06 - Exercício 67

CREATE DATABASE gerenciamento_eventos;
USE gerenciamento_eventos;

CREATE TABLE evento(
	id_evento int NOT NULL,
	nome_evento varchar(50) NOT NULL,
	localizacao varchar(50) NOT NULL,
	data_evento date NOT NULL,
	PRIMARY KEY(id_evento)
);

CREATE TABLE participante(
	id_participante int NOT NULL,
	nome_participante varchar(30) NOT NULL,
	email_participante varchar(50) NOT NULL,
	id_evento int NOT NULL,
	PRIMARY KEY(id_participante),
	FOREIGN KEY(id_evento) REFERENCES evento(id_evento)
);

CREATE TABLE evento_participante(
	id_evento_participante int NOT NULL,
	id_evento int NOT NULL,
	id_participante int NOT NULL,
	PRIMARY KEY(id_evento_participante),
	FOREIGN KEY(id_evento) REFERENCES evento(id_evento),
	FOREIGN KEY(id_participante) REFERENCES participante(id_participante)
);
