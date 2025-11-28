-- Active: 1764294937340@@127.0.0.1@3306@mysql
-- 1. Criação do Banco de Dados
CREATE DATABASE ClinicaPetSaude;
USE ClinicaPetSaude;

-- 2. Criação das Tabelas (DDL)

CREATE TABLE TUTOR (
    id_tutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(150)
);

CREATE TABLE VETERINARIO (
    id_veterinario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    especialidade VARCHAR(50),
    crmv VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE PROCEDIMENTO (
    id_procedimento INT AUTO_INCREMENT PRIMARY KEY,
    nome_procedimento VARCHAR(100) NOT NULL,
    valor_procedimento DECIMAL(10, 2) NOT NULL
);

CREATE TABLE ANIMAL (
    id_animal INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    raca VARCHAR(30),
    data_nascimento DATE,
    sexo CHAR(1),
    id_tutor INT,
    FOREIGN KEY (id_tutor) REFERENCES TUTOR(id_tutor)
);

CREATE TABLE CONSULTA (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    motivo_visita TEXT,
    diagnostico TEXT,
    id_animal INT,
    id_veterinario INT,
    FOREIGN KEY (id_animal) REFERENCES ANIMAL(id_animal),
    FOREIGN KEY (id_veterinario) REFERENCES VETERINARIO(id_veterinario)
);

CREATE TABLE EXAME (
    id_exame INT AUTO_INCREMENT PRIMARY KEY,
    tipo_exame VARCHAR(50) NOT NULL,
    data_realizacao DATE,
    resultado TEXT,
    id_consulta INT,
    FOREIGN KEY (id_consulta) REFERENCES CONSULTA(id_consulta)
);

CREATE TABLE ITEM_CONSULTA (
    id_consulta INT,
    id_procedimento INT,
    observacao_item VARCHAR(200),
    PRIMARY KEY (id_consulta, id_procedimento),
    FOREIGN KEY (id_consulta) REFERENCES CONSULTA(id_consulta),
    FOREIGN KEY (id_procedimento) REFERENCES PROCEDIMENTO(id_procedimento)
);