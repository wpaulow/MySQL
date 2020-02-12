CREATE DATABASE cinemao;

/*DROP DATABASE cinemao;*/

USE cinemao;

CREATE TABLE tbl_Ator (Id_ator int primary key auto_increment,
						Nome_ator varchar (45) not null,
                        Sexo varchar (1),
                        Dt_nascimento date);
                        
CREATE TABLE tbl_Genero (Id_genero int primary key auto_increment,
						Genero varchar (45) not null);
                        
CREATE TABLE tbl_Diretor (Id_diretor int primary key auto_increment,
						Nome_diretor varchar (45) not null,
                        Nacionalidade varchar (10) not null,
                        Dt_nascimento date);
                        
CREATE TABLE tbl_Filme (Id_filme int primary key auto_increment,
						Nome_filme_PT varchar (45) not null,
                        Nome_filme_EN varchar (45),
                        Ano_lancamento int (4) not null,
                        Duracao int (3) not null,
                        FK_Id_genero int,
                        FOREIGN KEY (FK_Id_genero) REFERENCES tbl_Genero (Id_genero),
                        FK_Id_diretor int,
                        FOREIGN KEY (FK_Id_diretor) REFERENCES tbl_Diretor (Id_diretor));
                        
CREATE TABLE tbl_Filme_e_Ator (FK_Id_filme int,
								FK_Id_ator int,
								PRIMARY KEY (FK_Id_filme, FK_Id_Ator),
								FOREIGN KEY (FK_Id_filme) REFERENCES tbl_Filme (Id_filme),
								FOREIGN KEY (FK_Id_ator) REFERENCES tbl_Ator (Id_ator));
                                
ALTER TABLE tbl_Diretor ADD Sexo varchar (1) not null;

ALTER TABLE tbl_Diretor MODIFY Nacionalidade varchar (45) not null;

ALTER TABLE tbl_Filme DROP Nome_filme_EN;

ALTER TABLE tbl_Filme CHANGE Nome_filme_PT Nome_filme varchar (45) not null;

INSERT INTO tbl_Ator (Nome_ator, Sexo, Dt_nascimento) 
			VALUES ('Andrew Garfield', 'M', '1983/08/20'),
					('Sandra Bullock', 'F', '1964/06/26'),
                    ('Will Smith', 'M', '1968/09/25'),
                    ('Harrison Ford', 'M', '1942/07/13'),
                    ('Hugh Jackman', 'M', '1968/10/12'),
                    ('Angelina Jolie', 'F', '1975/06/04'),
                    ('Keanu Reeves', 'M', '1964/09/02'),
                    ('Jennifer Lawrence', 'F', '1990/08/15'),
                    ('Sylvester Stallone', 'M', '1946/07/06'),
                    ('James Mcavoy', 'M', '1979/04/21'),
					('Brad Pitt', 'M', '1963/12/18'),
					('Leonardo DiCaprio', 'M', '1974/11/11'),
                    ('Vin Diesel', 'M', '1967/07/18'),
                    ('Johnny Deep', 'M', '1963/06/09'),
                    ('Robin Williams', 'M', '1951/07/21'),
                    ('Robert Downey Jr.', 'M', '1965/04/04'),
                    ('Patrick Stewart', 'M', '1940/07/13'),
                    ('Jackie Chan', 'M', '1954/04/07'),
                    ('Jennifer Aniston', 'F', '1969/02/11'),
                    ('Jim Carrey', 'M', '1962/01/17'),
                    ('Scarlett Johansson', 'F', '1984/11/22'),
                    ('Megan Fox', 'F', '1986/05/16'),
                    ('Ben Stiller', 'M', '1965/11/30'),
                    ('Emma Stone', 'F', '1988/11/06');
                    
INSERT INTO tbl_Genero (Genero) VALUES ('Terror'),
										('Ação'),
                                        ('Comédia'),
                                        ('Drama'),
                                        ('Suspense'),
                                        ('Ficção'),
                                        ('Romance'),
                                        ('Animação');
                                        
INSERT INTO tbl_Diretor (Nome_diretor, Nacionalidade, Dt_nascimento, Sexo)
			VALUES ('Steven Spielberg', 'Estados Unidos', '1946/12/18', 'M'),
					('James Cameron', 'Canada', '1954/08/16', 'M'),
					('José Padilha', 'Brasil', '1967/08/01', 'M'),
                    ('George Lucas', 'Estados Unidos', '1944/05/14', 'M'),
                    ('Alan Rickman', 'Inglaterra', '1946/02/21', 'M'),
                    ('Fernando Meirelles', 'Brasil', '1965/11/09', 'M');
                    
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor)
			VALUES ('Viva: A Vida é Uma Festa', '2017',	'105', '8', '5'),
					('Logan', '2017', '137', '2', '1'),
					('Um Sonho de Liberdade', '1995', '142', '4', '5'),
					('Matrix', '1999', '150', '6', '1'),
					('Jumanji',	'1996',	'104', '3', '6'),
					('Cidade de Deus', '2002', '135', '2', '3'),
					('O Resgate do Soldado Ryan', '1998', '170', '2', '6'),
					('Extraordinário','2017', '113', '4', '5'),
					('O Poderoso Chefão','1972', '178', '2', '2'),
					('Forrest Gump', '1994', '142', '7', '1'),
					('Truque de Mestre', '2013', '125', '2', '4'),
					('Fragmentado', '2017',	'117', '4', '6'),
					('Avatar', '2009', '162', '6', '2'),
					('O Preço do Amanhã', '2011', '109', '2', '3'),
					('O Senhor dos Anéis: O Retorno do Rei', '2003', '200', '6', '5'),
					('Toy Story', '1995', '141', '8', '2'),
					('Star Wars: Os Últimos Jedi', '2017', '152', '6', '4'),
					('O Menino do Pijama Listrado', '2008',	'94', '4', '1'),
					('O Lobo de Wall Street', '2013', '181', '4', '6'),
					('A Hora do Rush', '1998', '98', '3', '5'),
					('Piratas do Caribe A Maldição do Perola Negra', '2003', '143', '2', '4'),
					('Passageiros', '2016', '116', '2', '1'),
					('Beleza Oculta', '2016', '97', '4', '2'),
					('It - A Coisa', '2017', '134', '1', '3'),
					('Rocky V', '1990',	'111', '4', '4'),
					('Titanic', '1997',	'195', '7', '4'),
					('Vingadores 4', '2019', '150', '2', '2'),
					('Velozes e Furiosos 8', '2017', '136', '2', '6'),
					('Transformers', '2007', '150', '2', '4'),
					('Ilha do Medo', '2010', '139', '5', '1');
                    
DESC tbl_Diretor;

SELECT * FROM tbl_Diretor; 

SELECT * FROM tbl_Filme_e_Ator;

SELECT Nome_filme, Id_Filme FROM tbl_Filme;

SELECT Nome_ator, Id_Ator FROM tbl_Ator;

SHOW TABLES;

SELECT Nome_filme, Duracao FROM tbl_Filme WHERE Ano_lancamento > 2016;

SELECT Nome_filme, Duracao FROM tbl_Filme WHERE Duracao BETWEEN 150 AND 200;

SELECT Nome_filme FROM tbl_Filme WHERE nome_filme LIKE '% furiosos 8';

COMMIT;

INSERT INTO  tbl_Filme_e_Ator VALUES ('1','1'),
										('2','2'),
										('3','3'),
										('4','4'),
										('5','5'),
										('6','6'),
										('7','7'),
										('8','8'),
										('9','9'),
										('10','10'),
										('11','11'),
										('12','12'),
										('13','13'),
										('14','14'),
										('15','15'),
										('16','16'),
										('17','17'),
										('18','18'),
										('19','19'),
										('20','20'),
										('21','21'),
										('22','22'),
										('23','23'),
										('24','24'),
										('25','24'),
										('26','23'),
										('27','22'),
										('28','21'),
										('29','20'),
										('30','19'),
										('1','18'),
										('2','17'),
										('3','16'),
										('4','15'),
										('5','14'),
										('6','13'),
										('7','12'),
										('8','11'),
										('9','10'),
										('10','9'),
										('11','8'),
										('12','7'),
										('13','6'),
										('14','5'),
										('15','4'),
										('16','3'),
										('17','2'),
										('18','1'),
										('19','3'),
										('20','5'),
										('21','7'),
										('22','8'),
										('23','9'),
										('24','10'),
										('25','12'),
										('26','13'),
										('27','16'),
										('28','2'),
										('29','14'),
										('30','16');
                                        
CREATE TABLE tbl_Horario (Id_Horario int primary key auto_increment, Hora time not null);

CREATE TABLE tbl_Sala (Id_Sala int primary key auto_increment, Nome varchar(45) not null, Capacidade int(3) not null);

CREATE TABLE tbl_Exibicao (Id_Exibicao int auto_increment,
							FK_Id_filme int,
							FK_Id_Horario int,
                            FK_Id_Sala int,
							PRIMARY KEY (Id_Exibicao, FK_Id_filme, FK_Id_Horario, FK_Id_Sala), #aqui o MySQL reclamou um pouco, dizendo que não poderia ter mais de uma declaração de pk assim e que travesti não era bagunça. Daí tive que declarar todas em um único ponto. Mas o engraçado é que em momentos anteriores já rolou isso e ele não falou nada.
							FOREIGN KEY (FK_Id_filme) REFERENCES tbl_Filme (Id_filme),
							FOREIGN KEY (FK_Id_Horario) REFERENCES tbl_Horario (Id_Horario),
                            FOREIGN KEY (FK_Id_Sala) REFERENCES tbl_Sala (Id_Sala));
                                        
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

ALTER TABLE tbl_filme ADD Cartaz BOOLEAN;

ALTER TABLE tbl_ator ADD Status_ator ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';
ALTER TABLE tbl_genero ADD Status_genero ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';
ALTER TABLE tbl_diretor ADD Status_diretor ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';
ALTER TABLE tbl_filme ADD Status_filme ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';
ALTER TABLE tbl_filme_e_ator ADD Status_filme_e_ator ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';

UPDATE tbl_filme SET Cartaz = true WHERE ano_lancamento>2004;
UPDATE tbl_filme SET Cartaz = false WHERE cartaz is null;

/******************************** EXERCÍCIOS *****************************************/

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
