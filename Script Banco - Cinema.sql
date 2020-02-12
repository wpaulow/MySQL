DROP DATABASE Cinema; # Comando utilizado para fazer a exclusão do banco de dados. Lembrando que este comando "matará" todo o seu banco.

CREATE DATABASE Cinema; # Comando utilizado para criar um novo banco de dados.

USE Cinema; # Comando utilizado para colocar o banco em uso. Alem de criar o banco com o comando acima, é necessario utiliza-lo para que ele possa receber modificações.

# Os comando abaixo são utilizados para criar nossas tabelas. 
# Vale lembrar e se atentar que devemos seguir uma ordem hierarquica na construção do banco.
# AS TABELAS QUE RECEBEM CHAVES ESTRANGEIRAS DEVEM SER CRIADAS DEPOIS DAS TABELAS QUE CEDERÃO ESTAS CHAVES.
CREATE TABLE tbl_Ator (
  Id_ator INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  Nome_ator VARCHAR(45) NOT NULL,
  Sexo VARCHAR(1) NOT NULL,
  Dt_nascimento DATE NOT NULL
);

CREATE TABLE tbl_Genero (
  Id_genero INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Genero VARCHAR(45) NOT NULL
);

CREATE TABLE tbl_Diretor (
  Id_diretor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nome_diretor VARCHAR(45) NOT NULL,
  Nacionalidade VARCHAR(10) NOT NULL,
  Dt_nascimento DATE NOT NULL
);

# Nestas duas tabelas abaixo estamos criando as chaves estrangeiras. Para criar chaves estrangeiras devemos seguir algumas regras:
CREATE TABLE tbl_Filme (
    Id_filme INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome_filme_PT VARCHAR(45) NOT NULL,
    Nome_filme_EN VARCHAR(45) NULL,
    Ano_lancamento INT(4) NOT NULL,
    Duracao INT(3) NOT NULL,
    FK_Id_genero INT, #1° regra, criar uma coluna de maneira simples conforme vemos ao lado para que posteriormente esta coluna seja transformada numa FK.
    FK_Id_diretor INT, #1° regra, criar uma coluna de maneira simples conforme vemos ao lado para que posteriormente esta coluna seja transformada numa FK.
    FOREIGN KEY (FK_Id_genero) REFERENCES tbl_genero (Id_genero), #2° regra, as colunas que criamos acima devem ser refenciadas neste comando para que o SGBD saiba quem receberá o posto de FK.
    FOREIGN KEY (FK_Id_diretor) REFERENCES tbl_diretor (Id_diretor) #3° regra, DEVEMOS referenciar CORRETAMENTE o nome da tabela que cederá a FK e o nome da coluna que é a PK na "tabela-mãe".  
);

#Na tabela acima criamos apenas um vinculo de chaves estrangeiras. Ja no exemplo abaixo alem de ser uma FK as colunas tambem receberam restrições de PK.
CREATE TABLE tbl_Filme_has_tbl_Ator (
    FK_Id_filme INT NOT NULL, #Criamos novamente as colunas que receberão posteriormente a FK.
    FK_Id_ator INT NOT NULL, #Criamos novamente as colunas que receberão posteriormente a FK.
    PRIMARY KEY (FK_Id_filme , FK_Id_ator), #Aqui estamos transformando estas colunas em uma PK. Ou seja, o conjunto de informações inseridos nestas colunas nao podera se repetir.
    FOREIGN KEY (FK_Id_filme) REFERENCES tbl_Filme (Id_filme), #Apos adicionar as regras de PK nas colunas, agora adicionamos que elas serão tambem uma FK conforme explicado em aula.
    FOREIGN KEY (FK_Id_ator) REFERENCES tbl_Ator (Id_ator) #Desta forma, nao sera permitido que o conjunto de informações para estas duas colunas se repitam.
);

# Os comando abaixo fazem modificações nas estruturas das nossas tabelas.
# Conforme as explicações de aula, cada caso abaixo diz respeito a uma ação diferente.

ALTER TABLE tbl_Diretor ADD Sexo varchar(1) not null; #Comando utilizado para adicionar uma nova coluna em um adeterminada tabela. Passamos os parametros que a mesma deve receber de acordo com o que queremos para ela.

ALTER TABLE tbl_Diretor MODIFY Nacionalidade varchar(45) not null; #Comando utilizado para alterar uma coluna ja existente em nossas tabelas, neste caso do "MODIFY" a tabela ja deve conter uma coluna chamada "Nacionalidade". 

ALTER TABLE tbl_Filme DROP Nome_Filme_EN; #Excluimos uma coluna na estrutura de nossa tabela.

ALTER TABLE tbl_Filme CHANGE Nome_filme_PT Nome_filme VARCHAR(45) not null; #Aqui estamos alterando o nome da COLUNA na tabela, onde passamos qual o antigo nome da coluno e na sequencia qual o nome que desejamos que ela receba.

ALTER TABLE tbl_Filme_has_tbl_Ator RENAME Filme_e_Ator; #Este comando renomeia A TABELA, diferentemente do comando anterior, este faz o renomeio da TABELA.

#Apos construir nossas estruturas de tabelas acima, podemos iniciar a inserção de informações.
#Vale ressaltar que foi demonstrado tres maneiras de inserção de informações durante a aula, esta abaixo é apenas uma das maneiras.

#OBS: Foram inseridos alguns ERROS propositais nos inserts abaixo. Caso voce necessite, procure analisar a mensagem de erro exibida pelo SGBD e corrija o erro. 
# LEMBRE-SE: Assim como temos hierarquia na constrção das tabelas por conta da FK, nas insercoes de dados isso tambem acontece. Se tentarmos inserir uma informação que depende de uma FK sem que esta FK exista sera gerado um erro.
#sendo assim, certifique-se de inserir as informacoes na ordem correta. 


#INSERT'S NA TABELA ATOR.
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Andrew Garfield", 'M','1983/08/20');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Sandra Bullock", 'F','1964/06/26');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Will Smith", 'M','1968/09/25');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Harrison Ford", 'M','1942/07/13');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Hugh Jackman", 'M','1968/10/12');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Angelina Jolie", 'F','1975/06/04');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Keanu Reeves", 'M','1964/09/02');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Jennifer Lawrence", 'F','1990/08/15');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Sylvester Stallone", 'M','1946/07/06');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES (1, "James Mcavoy", 'M','1979/04/21');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Brad Pitt", 'M','1963/12/18');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Leonardo Dicaprio", 'M','1974/11/11');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Vin Diesel", 'M','1967/07/18');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Johnny Depp", 'M','1963/06/09');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Robin Williams", 'M','1951/07/21');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Robert Downey Jr.", 'M','1965/04/04');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Patrick Stewart", 'M','1940/07/13');
INSERT INTO tbl_Ator(Nome_atro, Sexo, Dt_nascimento) VALUES ("Sandra Bullock", 'F','1964/07/26');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Jackie Chan", 'M','1954/04/07');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Jennifer Aniston", 'F','1969/02/11');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Jim Carrey", 'M','1962/01/17');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Scarlett Johansson", 'F','1984/11/22');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Megan Fox", 'F','1986/05/16');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Ben Stiller", 'M','1965/11/30');
INSERT INTO tbl_Ator(Nome_ator, Sexo, Dt_nascimento) VALUES ("Emma Stone", 'F','1988/11/06');


#INSERT'S NA TABELA ATOR.
INSERT INTO tbl_Direto (Nome_direto, Nacionalidade, Dt_nascimento, Sexo) VALUES ("Steven Spielberg",	"Estados Unidos",	'1946/12/18',	'M');
INSERT INTO tbl_Direto (Nome_direto, Nacionalidade, Dt_nascimento, Sexo) VALUES ("James Cameron",	"Canada",	'1954/08/16',	'M');
INSERT INTO tbl_Direto (Nome_direto, Nacionalidade, Dt_nascimento, Sexo) VALUES ("José Padilha",	"Brasil",	'1967/08/01',	'M');
INSERT INTO tbl_Direto (Nome_direto, Nacionalidade, Dt_nascimento, Sexo) VALUES ("George Lucas",	"Estados Unidos",	'1944/05/14',	'M');
INSERT INTO tbl_Direto (Nome_direto, Nacionalidade, Dt_nascimento, Sexo) VALUES ("Alan Rickman",	"Inglaterra",	'1946/02/21',	'M');
INSERT INTO tbl_Direto (Nome_direto, Nacionalidade, Dt_nascimento, Sexo) VALUES ("Fernando Meirelles",	"Brasil",	'1965/11/09',	'M');


#INSERT'S NA TABELA FILME.
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Viva: A Vida é Uma Festa",	2017,	105,	8,	5);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Logan",	2017,	137,	2,	1);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Um Sonho de Liberdade",	1995,	142,	4,	5);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Matrix",	1999,	150,	6,	1);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Jumanji",	1996,	104,	3,	6);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Cidade de Deus",	2002,	135,	2,	3);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("O Resgate do Soldado Ryan",	1998,	170,	2,	6);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Extraordinário",	2017,	113,	4,	5);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("O Poderoso Chefão",	1972,	178,	2,	2);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Forrest Gump",	1994,	142,	7,	1);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Truque de Mestre",	2013,	125,	2,	4);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Fragmentado",	2017,	117,	4,	6);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Avatar",	2009,	162,	6,	2);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("O Preço do Amanhã",	2011,	109,	2,	3);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("O Senhor dos Anéis: O Retorno do Rei",	2003,	200,	6,	5);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Toy Story",	1995,	141,	8,	2);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Star Wars: Os Últimos Jedi",	2017,	152,	6,	4);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("O Menino do Pijama Listrado",	2008,	94,	4,	1);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("O Lobo de Wall Street",	2013,	181,	4,	6);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("A Hora do Rush",	1998,	98,	3,	5);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Piratas do Caribe - Maldição do Perola Negra",	2003,	143,	2,	4);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Passengeiros",	2016,	116,	2,	1);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Beleza Oculta",		2016,	97,	4,	2);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("It - A Coisa",	2017,	134,	1,	3);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Rocky V",	1990,	111,	4,	4);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Titanic",	1997,	195,	7,	4);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Vingadores 4",	2019,	150,	2,	2);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Velozes e Furiosos 8",	2017,	136,	2,	6);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Transformers",	2007,	150,	2,	4);
INSERT INTO tbl_Filme (Nome_filme, Ano_lancamento, Duracao, FK_Id_genero, FK_Id_diretor) VALUES ("Ilha do Medo",	2010,	139,	5,	1);


#INSERT'S NA TABELA GENERO.
INSERT INTO tbl_Genero (Genero) VALUES ("Terror");
INSERT INTO tbl_Genero (Genero) VALUES ("Ação");
INSERT INTO tbl_Genero (Genero) VALUES ("Comedia");
INSERT INTO tbl_Genero (Genero) VALUES ("Drama");
INSERT INTO tbl_Genero (Genero) VALUES ("Suspense");
INSERT INTO tbl_Genero (Genero) VALUES ("Ficção");
INSERT INTO tbl_Genero (Genero) VALUES ("Romance");
INSERT INTO tbl_Genero (Genero) VALUES ("Animação");

#######################################################################################################3

SHOW TABLES; # O comando ao lado serve para exibir quais tabelas existem em seu banco de dados.
 
DESC tbl_ator; # O comando ao lado descreve a estrutura de uma determinada tabela, mostrando suas caracteristicas.

#Conforme dito em aula, segue abaixo algumas maneiras (Ainda simples) de fazer select, pois o foco atual é que possam entender os parametros da clausula WHERE e suas possibilidades.

select*from tbl_filme; # O comando tras todas as informações sobre uma determinada tabela.
select nome_filme, duracao from tbl_filme; # Neste caso o parametro (*) foi substituido por algumas colunas expecificas. Onde o (*) representava "tudo" e agora ao inves de selecionar tudo, a select exibira apenas algumas colunas especificas.
select nome_filme, duracao from tbl_filme where ano_lancamento > 2016; #Podemos usar a clausula WHERE para filtrar ainda mais nossas buscas, onde com o WHERE podemos especificar o que querermos receber. Neste caso em especifico, o WHERE esta determinando que devem retornoas apenas os dados onde a data de lancamento seja superior a 2016.
select nome_filme, duracao, ano_lancamento from tbl_filme where ano_lancamento > 2000 OR duracao > 200; #Podemos usar operadores logicos (AND e OR) em nossas clausulas WHERE.  
select nome_filme, duracao from tbl_filme where duracao > 150 AND duracao < 200; #Aqui é exemplo de como utilizar o AND. 
select nome_filme, duracao from tbl_filme where duracao BETWEEN 150 AND 200; #Outra maneira de fazer buscar entre determinados valores é com o parametro BETWEEN, onde este parametro representa no caso do exemplo uma busca entre(incluindo) os valor de 150 e 200.
select * from tbl_ator where dt_nascimento between '1990-01-01' AND '1999-12-31'; #O comando BETWEEN tambem pode ser usado para datas.
select nome_filme, duracao from tbl_filme where nome_filme = 'Logan'; #Podemos solicitar buscas atraves de texto. Mas desta maneira devemos passar o valor exatamente igual ao que consta no banco.
select nome_filme, duracao from tbl_filme where nome_filme LIKE 'Loga%'; #Uma maneira de contornar isso é o uso do LIKE que serve como uma especie de coringa. Com o LIKE temos a opção de pegar apenas uma parte do texto de busca e com o simbolo de % conforme no exemplo o SGBD completa a busca trazendo tudo o que contiver o texto passado com algo a mais depois.
select nome_filme, duracao from tbl_filme where nome_filme LIKE '%furiosos 8'; #No entanto o "coringa" do LIKE nao se restringe somente ao final de uma String de busca, ele tambem pode ser utilizado no inicio de uma string.
select nome_filme, duracao from tbl_filme where nome_filme LIKE '% do %'; #Ou ate mesmo tanto no inicio como tambem no final dela.
# FAÇA OS TESTES E VERIFIQUE AS VARIAÇÕES.

#UTILIZANDO O COMANDO UPDATE E DELETE.
#Vimos em aula que podemos passar os comandos de update e delete COM e SEM a clausula where. 
#No entanto, a nao utilização de where pode trazer consequencias nao desejadas. E por conta disso vimos que nosso SGBD "bloqueia" o uso destes comandos indevidos. Sendo assim devemos desabilitar a segurança para que possamos utilizar os comandos de Update e Delete sem Where.
#LEMBRE-SE, O USO DESTES COMANDO SEM A CLAUSULA WHERER MODIFICARA OU DELETARA TODOS OS REGISTROS DA SUA TABELA.
# Podemos utilizar diversas combinações de WHERE conforme vimos em sala e exemplificados nos comando de SELECT acima.
update tbl_ator set dt_nascimento = '2000-12-25' WHERE id_ator = 1; #Exemplo de update com where.
update tbl_ator set dt_nascimento = '2000-12-25'; #Exemplo de update sem where.
delete from tbl_ator WHERE id_ator = 1; #Exemplo de delete com where.
delete from tbl_ator; #Exemplo de delete sem where.

#Podemos desabilitar o auto-commit e em um eventual erro de DML podemos utilizar o comando ROLLBACK. Este comando nos possibilida retornar nossas alterações ate o ultimo ponto de COMMIT feito.
ROLLBACK;

#Temos tambem o comando COMMIT que por padrao ja vem ativo, porem, se o mesmo for desabilitado o auto-commit devemos executar este comando para que ele de fato salve nossas modificações no banco;
COMMIT;