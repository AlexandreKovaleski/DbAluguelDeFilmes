set search_path to locadora;

--Consulta 1: selecionar alguns dados aonde o nome começa com "Let"
--e a duração seja maior ou igual a 126 minutos

SELECT	p.nome, 
		f.titulo, 
		f.duracao, 
		f.ano_lancamento, 
		z.nome, 
		g.genero, 
		c.tarja_classificacao, 
		c.valor, 
		c.horas_expiracao

FROM	filmes f 
		INNER JOIN atores_filmes a 
			ON(f.id_filme = a.id_filme)
		INNER JOIN personagens p 
			ON (a.id_ator = p.id_ator)
		INNER JOIN franquias z 
			ON (f.id_franquia = z.id_franquia)
		INNER JOIN generos g
			ON (f.id_genero = g.id_genero)
		INNER JOIN classificacao c
			ON (f.id_classificacao = c.id_classificacao)

WHERE 	p.nome ilike 'Let%'
  AND	f.duracao >= '126'

ORDER BY ano_lancamento desc 

----------------------------------------------------------
--Consulta 2: selecionar alguns dados, aonde o id do cliente seja 1
--e ordenar por data de aluguel
SELECT 	c.nome,
		c.sobrenome,
		c.cpf,
		
		x.num_cartao,
		x.cod_seguranca,

		z.tarja_classificacao,
		z.valor,
		z.horas_expiracao,
		
		a.data_aluguel,
		a.data_expiracao,
		
		f.titulo,
		f.ano_lancamento,
		f.duracao,
		
		g.genero,
		
		y.nome
		
FROM 	clientes c
		INNER JOIN cartao_credito x
			ON (c.id_cliente = x.id_cliente)
		INNER JOIN aluguel a
			ON (c.id_cliente = a.id_cliente)
		INNER JOIN filmes f
			ON (a.id_filme = f.id_filme)
		INNER JOIN generos g
			ON (f.id_genero = g.id_genero)
		INNER JOIN franquias y
			ON (f.id_franquia = y.id_franquia)
		INNER JOIN classificacao z
			ON (f.id_classificacao = z.id_classificacao)
			
WHERE 	c.id_cliente = '1'

ORDER BY data_aluguel
------------------------------------------------------------
--Consulta 3: Agrupar por gênero, os filmes que tiveram o lançamento em 2001.

SELECT 	g.genero, 
		f.ano_lancamento

FROM 	generos g
		INNER JOIN filmes f
			ON (g.id_genero = f.id_genero)
GROUP BY g.genero, f.ano_lancamento 
	HAVING f.ano_lancamento = '2001'
	
------------------------------------------------------------
--Consulta 4: Selecionar título do filme com duração >= 100 minutos

SELECT 	titulo, duracao

FROM 	filmes

WHERE 	duracao >= '100'
------------------------------------------------------------
--Consulta 5: Buscar nome do cliente que alugou o filme de id 2

SELECT 	c.nome, 
		a.data_aluguel, 
		f.id_filme

FROM clientes c
	INNER JOIN aluguel a
		ON (a.id_cliente = c.id_cliente)
	INNER JOIN filmes f
		ON (f.id_filme = a.id_filme)
		
WHERE f.id_filme = 2

------------------------------------------------------------
--Consulta 6: Nome da franquia com maior duração

SELECT 	k.nome, 
		MAX(f.duracao) AS maior_duracao

FROM franquias k
	INNER JOIN filmes f 
		ON (f.id_franquia = k.id_franquia)

GROUP BY k.nome

ORDER BY maior_duracao DESC

LIMIT 	1;

------------------------------------------------------------
--Consulta 7: Genero de cada filme cadastrado
SELECT 	g.genero, 
		f.titulo

FROM generos g
	INNER JOIN filmes f
		ON (g.id_genero = f.id_genero)

------------------------------------------------------------
--Consulta 8 : Inserção de dados do cliente
INSERT INTO clientes (nome,sobrenome,cpf, email, senha, telefone)
	VALUES('Jubiscleusa','Batista','19267345897', 'jubi@cleusa.com', '1231231231', '54851818192')

------------------------------------------------------------
--Consulta 9 : Título do filme com tarja >=10
SELECT 	f.titulo, 
		c.tarja_classificacao

FROM 	filmes f
		INNER JOIN classificacao c
			ON (f.id_classificacao = c.id_classificacao)

WHERE c.tarja_classificacao >= '10'

------------------------------------------------------------
--Consulta 10: Exclusão de nomes de atores
DELETE 	FROM atores
WHERE	id_ator = 2;

------------------------------------------------------------
-- Criando a VISAO
CREATE VIEW relatorio_locadora AS
	SELECT 	c.id_cliente, 
			c.nome, 
			c.cpf, 
			k.num_cartao, 
			k.cod_seguranca

	FROM	clientes c
		INNER JOIN cartao_credito k
			ON (c.id_cliente = k.id_cliente)

------------------------------------------------------------
-- Executando a VISAO

SELECT * 
FROM relatorio_locadora
