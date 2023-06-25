create schema locadora;

set search_path to locadora;

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    telefone VARCHAR(12) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(200) NOT NULL
);

CREATE TABLE atores (
    id_ator SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE generos (
    id_genero SERIAL PRIMARY KEY,
    genero VARCHAR(30) NOT NULL
);

CREATE TABLE franquias (
    id_franquia SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE classificacao (
    id_classificacao SERIAL PRIMARY KEY,
    tarja_classificacao VARCHAR(20) NOT NULL,
    valor DECIMAL(8,2) NOT NULL,
    horas_expiracao INT NOT NULL
);
