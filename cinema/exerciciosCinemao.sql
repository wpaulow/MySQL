USE cinemao;

# 1- Criar o campo "Status" para cada uma de nossas tabelas e setar como valor default o valor ativo.

/*ALTER TABLE tbl_ator ADD Status_ator ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';
ALTER TABLE tbl_genero ADD Status_genero ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';
ALTER TABLE tbl_diretor ADD Status_diretor ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';
ALTER TABLE tbl_filme ADD Status_filme ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';
ALTER TABLE tbl_filme_e_ator ADD Status_filme_e_ator ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';*/

# 2- Selecionar a maior duracao dos filmes cadastrados. 

# SELECT max(duracao) from tbl_filme;

# 3- Selecionar a menor duracao dos filmes lancado entre os anos 2000 e 2010. 

SELECT min(duracao) from tbl_filme WHERE ano_lancamento between '2000-01-01' and '2010-12-31';

# 4- Selecionar os filmes exibibindo apenas aqueles que pertencerem ao genero "Ação".

SELECT nome_filme, fk_id_genero from tbl_filme WHERE fk_id_genero = 2;

# 5- Selecionar os filmes exibindo aqueles que pertecerem ao gênero "Drama" e que tenham sido lançados apos o ano 2010.

SELECT nome_filme, ano_lancamento, fk_id_genero as filme_drama_2016 from tbl_filme WHERE fk_id_genero = 4 AND Ano_lancamento > 2016;

#6- Exibir todos os filmes e seus anos de lancamentos organizando da seguinte maneira (ordem de ano do mais novo para o mais velho e nome do filme em ordem alfabetica).

SELECT nome_filme, ano_lancamento from tbl_filme order by ano_lancamento, nome_filme asc;

# 7- Exibir a soma da duracao de todos os filmes que foram lançados entre 2010 e 2018 e pertecerem ao genero "ficçao"

SELECT sum(duracao) as soma_duracao from tbl_filme WHERE fk_id_genero = 6 AND ano_lancamento between '2010/01/01' and '2018/12/31';

# 8- Exibir quantos filmes foram lancados antes do ano 2000.

SELECT count(Nome_Filme) from tbl_filme WHERE ano_lancamento < '2000-01-01';

# 9- Exibir qual a média de duracao dos filmes lançados após o ano 2000.

SELECT avg(duracao) from tbl_filme WHERE ano_lancamento > '2000-01-01';

# 10- Quantos filmes pertecem a cada um dos generos.

SELECT count(*), fk_id_genero as genero_filmes from tbl_filme group by fk_id_genero;

# 11- Exibir em ordem alfabetica quais atores e em quais anos nasceram entre 1960 e 1980.

SELECT nome_ator, dt_nascimento from tbl_ator where dt_nascimento between '1960/01/01' and '1980-12-31' order by nome_ator;

# 12- Exibir todas informações sobre os atores do mais jovem para o mais velho.

SELECT * from tbl_ator order by dt_nascimento desc;

# 13- Selecionar em quantos filmes o ator numero 1 trabalhou.

SELECT count(FK_id_filme) as participacao_em_filmes, fk_id_ator from tbl_filme_e_ator where fk_id_ator = 1;

# 14- Selecionar quantos atores trabalharam no filme numero 1.

SELECT count(Fk_id_ator) as atores_em_filme, fk_id_filme from tbl_filme_e_ator where fk_id_filme = 1;

# 15- Selecionar quantos filmes foram lancados em cada um dos anos.

SELECT count(*), ano_lancamento from tbl_filme group by ano_lancamento;

# 16- Exibir quantos diretores pertencem a cada pais.

SELECT count(*), Nacionalidade from tbl_diretor group by Nacionalidade;

/*17- exibir o total de filmes, a soma das durações e a media das duracoes para cada um 
dos generos de filmes organizando da menor media para a maior.*/

SELECT count(*), fk_id_genero, sum(duracao), avg(duracao) from tbl_filme group by fk_id_genero order by avg(duracao) asc;
