set search_path to locadora;

CREATE TABLE cartao_credito (
    num_cartao CHAR(16) NOT NULL,
    cod_seguranca INT NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_cliente, num_cartao),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

CREATE TABLE filmes (
    id_filme SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    duracao INT NOT NULL,
    ano_lancamento INT NOT NULL,
    IMDb DECIMAL(2,1),
    id_genero INT NOT NULL,
    id_franquia INT NOT NULL,
    id_classificacao INT NOT NULL,
    FOREIGN KEY (id_genero) REFERENCES generos (id_genero),
    FOREIGN KEY (id_franquia) REFERENCES franquias (id_franquia),
    FOREIGN KEY (id_classificacao) REFERENCES classificacao (id_classificacao)
);

CREATE TABLE personagens (
	id_personagem SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	id_ator INT NOT NULL,
	FOREIGN KEY (id_ator) REFERENCES atores (id_ator)
);

CREATE TABLE atores_filmes (
    id_ator INT NOT NULL,
    id_filme INT NOT NULL,
	id_personagem INT NOT NULL,
    PRIMARY KEY (id_ator, id_filme, id_personagem),
    FOREIGN KEY (id_ator) REFERENCES atores(id_ator),
    FOREIGN KEY (id_filme) REFERENCES filmes(id_filme),
	FOREIGN KEY (id_personagem) REFERENCES personagens(id_personagem)
);

CREATE TABLE aluguel (
    id_aluguel SERIAL PRIMARY KEY,
    data_aluguel DATE NOT NULL,
    data_expiracao DATE NOT NULL,
	id_cliente INT NOT NULL,
    id_filme INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_filme) REFERENCES filmes (id_filme)
);
