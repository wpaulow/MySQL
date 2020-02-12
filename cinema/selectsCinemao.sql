USE cinemao;

SELECT * FROM tbl_Diretor; 

SELECT * FROM tbl_Filme_e_Ator;

SELECT Nome_filme, Id_Filme FROM tbl_Filme;

SELECT Nome_ator, Id_Ator FROM tbl_Ator;

SELECT Nome_filme, Duracao FROM tbl_Filme WHERE Ano_lancamento > 2016;

SELECT Nome_filme, Duracao FROM tbl_Filme WHERE Duracao BETWEEN 150 AND 200;

SELECT Nome_filme FROM tbl_Filme WHERE nome_filme LIKE '% furiosos 8';

SELECT sum(duracao) from tbl_filme; #soma de determinado parâmetro
#em ambos selects, e talvez em mais, talvez em todos, o argumento do parâmetro count ou sum, por exemplo, precisam vir entre parênteses logo após o mesmo, sem espaço, se não dá erro.
SELECT count(Nome_Filme) from tbl_filme; #faz a conta de quantos filmes existem

SELECT count(ano_lancamento) from tbl_filme;
#Mostra que o count conta quantas células existem em determinada tabela. Quantos dados existem nela. Quantas vezes ela foi populada. Independentemente da coluna dessa tabela. 
SELECT count(*) from tbl_filme;

SELECT count(*) from tbl_ator Where dt_nascimento between '1980-01-01' and '2000-12-31';

SELECT sum(duracao) as soma_duracao from tbl_filme; #soma da duracao (as) pode apelidar um resultado

SELECT sum(duracao) as soma_duracao from tbl_filme WHERE ano_lancamento < 2000;# faz a soma dos registros onde for menor que 2000

SELECT min(ano_lancamento) from tbl_filme;

SELECT min(nome_diretor) from tbl_diretor;

SELECT max(duracao) from tbl_filme;

SELECT max(nome_ator) from tbl_ator;

SELECT avg(duracao) from tbl_filme;

SELECT avg(ano_lancamento) from tbl_filme;

SELECT * from tbl_filme order by ano_lancamento;

SELECT * from tbl_ator order by sexo, nome_ator;

SELECT count(*), sexo from tbl_ator group by sexo;

SELECT count(*), fk_id_diretor from tbl_filme group by fk_id_diretor;

SELECT count(*), ano_lancamento from tbl_filme Where ano_lancamento < 2000 group by ano_lancamento;

select tbl_filme.nome_filme, tbl_genero.genero from tbl_filme join tbl_genero on tbl_filme.FK_Id_genero = tbl_genero.Id_genero;

select a.nome_filme, b.genero from tbl_filme a join tbl_genero b on a.fk_id_genero = b.id_genero;

select a.nome_filme, b.nome_diretor from tbl_filme a join tbl_diretor b on a.fk_id_diretor = b.id_diretor;

select a.nome_filme, b.genero, c.nome_diretor from tbl_filme a join tbl_genero b on a.fk_id_genero = b.id_genero join tbl_diretor c on a.fk_id_diretor = c.id_diretor;

select * from tbl_filme; 

select * from tbl_genero;

select * from tbl_diretor;

select a.nome_ator, b.nome_filme from tbl_Filme_e_Ator c 
	join tbl_ator a on c.fk_id_ator = a.id_ator 
    join tbl_filme b on c.fk_id_filme = b.id_filme;

select a.nome_ator, b.nome_filme from tbl_Filme_e_Ator c 
	join tbl_ator a on c.fk_id_ator = a.id_ator 
	join tbl_filme b on c.fk_id_filme = b.id_filme 
	order by nome_ator;

select a.nome_ator, b.nome_filme from tbl_Filme_e_Ator c 
	join tbl_ator a on c.fk_id_ator = a.id_ator 
	join tbl_filme b on c.fk_id_filme = b.id_filme
	order by nome_ator, nome_filme;

select * from tbl_filme;

select a.nome_filme, b.hora, c.nome from tbl_exibicao d 
	join tbl_filme a on d.fk_id_filme = a.id_filme 
	join tbl_horario b on d.fk_id_horario = b.id_horario 
	join tbl_sala c on d.fk_id_sala = c.id_sala 
	order by nome_filme;

select a.nome_filme, b.hora from tbl_exibicao c
	join tbl_filme a on c.fk_id_filme = a.id_filme
	join tbl_horario b on c.fk_id_horario = b.id_horario
	where b.id_horario = 1;

select a.nome_filme, b.genero from tbl_exibicao c
	join tbl_filme a on c.fk_id_filme = a.id_filme 
	join tbl_genero b on a.fk_id_genero = b.id_genero;

select * from tbl_ator limit 0,10;

select * from tbl_ator where id_ator in (1,2); 

select nome_filme, duracao from tbl_filme where duracao > (select avg(duracao) from tbl_filme);
select avg(duracao) from tbl_filme; #sub-query

select * from tbl_genero where exists (select * from tbl_filme where tbl_filme.fk_id_genero = tbl_genero.id_genero); #só retorna gênero se houver vínculo com filme

select * from tbl_genero where !exists (select * from tbl_filme where tbl_filme.fk_id_genero = tbl_genero.id_genero); # só retorna gênero se não houver vínculo com filme

select * from tbl_filme having duracao < (select duracao from tbl_filme where id_filme = 6);

select * from tbl_ator where dt_nascimento > (now() - interval 30 year);




