CREATE DATABASE cinema;

/*DROP DATABASE cinema;*/

USE cinema;

CREATE TABLE tbl_Genero (Id_genero int primary key auto_increment,
						Genero varchar (45) not null);
                        
CREATE TABLE tbl_Diretor (Id_diretor int primary key auto_increment,
						Nome_diretor varchar (45) not null,
                        Nacionalidade varchar (10) not null,
                        Dt_nascimento date);
                        
CREATE TABLE tbl_Ator (Id_ator int primary key auto_increment,
						Nome_ator varchar (45) not null,
                        Sexo varchar (1),
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
                        
DROP TABLE tbl_Filme_e_Ator;
                        
CREATE TABLE tbl_Filme_has_tbl_Ator (FK_Id_filme int,
									FK_Id_ator int,
                                    PRIMARY KEY (FK_Id_filme, FK_Id_Ator),
                                    FOREIGN KEY (FK_Id_filme) REFERENCES tbl_Filme (Id_filme),
                                    FOREIGN KEY (FK_Id_ator) REFERENCES tbl_Ator (Id_ator));
                                    
ALTER TABLE tbl_Diretor ADD Sexo varchar (1) not null;

ALTER TABLE tbl_Diretor MODIFY Nacionalidade varchar (45) not null;

ALTER TABLE tbl_Filme DROP Nome_filme_EN;

ALTER TABLE tbl_Filme CHANGE Nome_filme_PT Nome_filme varchar (45) not null;

ALTER TABLE tbl_Filme_has_tbl_Ator RENAME tbl_Filme_e_Ator;

DESC tbl_Diretor;

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
                    
SELECT * FROM tbl_Diretor;                    
                    
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
                    
SELECT * FROM tbl_Ator; 

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
                    
SHOW TABLES;
                    
SELECT*FROM tbl_Filme;

SELECT Nome_filme, Duracao FROM tbl_Filme WHERE Ano_lancamento > 2016;

SELECT Nome_filme, Duracao FROM tbl_Filme WHERE Duracao BETWEEN 150 AND 200;

SELECT Nome_filme FROM tbl_Filme WHERE nome_filme LIKE '% furiosos 8';

/*UPDATE nome_Ator FROM tbl_Ator set dt_Nascimento = '0000-00-00'; JAMAIS FAZER UM update SEM O PARÂMETRO where */ 

INSERT INTO  tbl_Filme_e_Ator VALUES (1


                        