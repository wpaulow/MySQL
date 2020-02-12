#SIGA AS INSTRUÇÕES CONTIDAS NOS COMENTARIOS PARA REALIZAR AS TAREFAS DESTE EXERCICIO.

#POSSIVELMENTE DEVEM OCORRER ERROS AO EXECUTAR A CRIAÇÃO DAS TABELAS E INSERÇÃO DE DADOS NO BANCO,
#CASO VENHA A ACONTECER ERROS, ANALISE QUAL O ERRO EMITIDO E CORRIJA-O PARA DAR SEQUENCIA.
#APOS REALIZAR A CRIACAO DAS TABELAS E A INSERÇAO DOS DADOS NA PARTE FINAL DESTE SCRIPT HÁ ALGUMAS QUESTOES QUE VOCE DEVERÁ RESPONDER.
#LEIA ATENTAMENTE E SIGA TODAS AS INSTRUÇÕES.
#CASO ACHE NECESSARIO O MER ESTARA JUNTO PARA QUE POSSA SER CONSULTADO
#AO FINAL DA RESOLUÇÃO, COMUNIQUE O PROFESSOR PARA QUE POSSA COPIAR SEU ARQUIVO E ANALISA-LO POSTERIORMENTE.

# 1 - CRIE O BANCO DE DADOS COM O SEU NOME.
CREATE DATABASE SEUNOMEAQUI; 

# 2 - APOS CRIAR O BANCO, REALIZE A CRIAÇÃO DAS 7 TABELAS ABAIXO. CASO VENHA A ACONTECER ALGUM ERRO CORRIJA-O.
CREATE TABLE aluno (
  id_aluno int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome_aluno varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  nascimento date not null
); 

CREATE TABLE curso (
  id_curso int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome_curso varchar(100) NOT NULL,
  fk_id_professor int NOT NULL,
  FOREIGN KEY (fk_id_professor) REFERENCES professor (id_professor)
);

CREATE TABLE professor(
	id_professor int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_Professor varchar(100) NOT NULL,
    sexo CHAR NOT NULL
);

CREATE TABLE aluno_curso(
	id_aluno_curso int NOT NULL AUTO_INCREMENT,
	fk_id_aluno int NOT NULL,
	fk_id_curso int NOT NULL,
    PRIMARY KEY (id_aluno_curso,fk_id_aluno,fk_id_curso),
	FOREIGN KEY (fk_id_aluno) REFERENCES aluno (id_aluno),
    FOREIGN KEY (fk_id_curso) REFERENCES curso (id_curso)
);

CREATE TABLE secao (
  id_secao int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_id_curso int NOT NULL,
  titulo varchar(150) NOT NULL,
  explicacao text NOT NULL,
  FOREIGN KEY (fk_id_curso) REFERENCES curso (qualachave)
);
    
CREATE TABLE exercicio (
  id_exercicio int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_id_secao int NOT NULL,
  pergunta text NOT NULL,
  resposta_oficial text NOT NULL,
  FOREIGN KEY (fk_id_secao) REFERENCES secao (id_secao)
);

CREATE TABLE nota (
  id_nota int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fk_id_aluno_curso int NOT NULL,
  nota int,
  FOREIGN KEY (fk_id_aluno_curso) REFERENCES aluno_curso (id_aluno_curso)
);


#AGORA QUE VOCE CONSEGUIU REALIZAR O DDL DO SEU BANCO VAMOS AO DML.
# 3- INSIRA AS INFORMACOES ABAIXO CORRESPONDENTE A CADA UMA DAS TABELAS CRIADAS.
INSERT INTO aluno (nome_aluno, email, nascimento)
VALUES
	('João da Silva','joao@dasilva.com','1980/01/01'),
	('Frederico José','fred@jose.com','1981/12/24'),
	('Alberto Santos','alberto@santos.com','1991/03/20'),
	('Renata Alonso','renata@alonso.com','1986/07/18'),
	('Paulo da Silva','paulo@dasilva.com','1988/09/10'),
	('Hermelino Costa','hermelino@costa.com','1993/10/09'),
	('Claudensio Pereira','claudensio@pereira.com','2004/12/30'),
	('Maximiliano Alegre','maximiliano@alegre.com','1985/12/25'),
	('Fabiola Nunes','fabiola@nunes.com','1997/09/04'),
	('Pedro Souza','pedro@souza.com','2002/04/11'),
	('Ellen Bernard','ellen@bernard.com','2000/05/22'),
	('Ulisses Costa','ulisses@costa.com','1996/10/06'),
	('Felipe Silva','felipe@silva.com','1980/11/11'),
	('Veronica Santos','vernica@santos.com','1981/10/26'),
	('Mikaely Costa','mikaely@costa.com','1993/10/17'),
	('Almir Leon','almir@leon.com','2004/12/30'),
	('Franklin Senna','franklin@senna.com','1987/10/12'),
	('Carlos Nunes','carlos@nunes.com','1991/03/20'),
	('Carlos Adao','carlos@adao.com','1991/03/20');

INSERT INTO curso (nome_curso, fk_id_professor)
VALUES
	('SQL e banco de dados',1),
	('Desenvolvimento web',2),
	('Mobilidade',3),
	('PHP',4),
    ('Python',7);
    
INSERT INTO professor (nome_professor, sexo)
VALUES
	('Luis Felipe','M'),
	('Cristiano','M'),
	('Aline','F'),
	('Marcos','M'),
    ('Diego','M'),
	('Aline','F');

#SE OCORRER ERRO NOS INSERTS ABAIXO, VERIFIQUE SE A SINTAXE ESTA CORRETA, SE A ORDEM HIERARQUICA ESTA CORRETA E SE SUA TABELA DE CURSOS CONTEM OS INDICE DE CHAVE MENCIONADOS.    
INSERT INTO tabela_seção (fk_id_curso, titulo, explicacao)
VALUES
	(1,'Aprendendo o SELECT','explicacao do capitulo Aprendendo o SELECT'),
	(1,'Aprendendo o UPDATE','explicacao do capitulo Aprendendo o UPDATE'),
	(1,'Aprendendo o DELETE','explicacao do capitulo Aprendendo o DELETE'),
	(1,'Aprendendo o INSERT','explicacao do capitulo Aprendendo o INSERT'),
	(2,'O que é a Web?','explicacao do capitulo O que é a Web?'),
	(2,'Entendendo o MVC','explicacao do capitulo Entendendo o MVC'),
	(2,'O objeto Result','explicacao do capitulo O objeto Result'),
	(2,'Interceptor','explicacao do capitulo Interceptor'),
	(3,'Planejando a iteração','explicacao do capitulo Planejando a iteração'),
	(3,'Retrospectivas','explicacao do capitulo Retrospectivas'),
	(3,'Reunião Diária','explicacao do capitulo Reunião Diária'),
	(3,'Kanban e XP','explicacao do capitulo Kanban e XP'),
	(4,'Introdução a Web','explicacao do capitulo Introdução a Web'),
	(4,'O servidor Apache','explicacao do capitulo O servidor Apache'),
	(4,'Lidando com o MySql','explicacao do capitulo Lidando com o MySql'),
	(4,'Instalando a aplicação','explicacao do capitulo Instalando a aplicação');
    
INSERT INTO exercicio (fk_id_secao, pergunta, resposta_oficial)
VALUES
	(1,'O que é um select?','Uma consulta que devolve resultados'),
	(1,'Como funciona um select?','select campos from tabela'),
	(2,'O que é um update?','serve pra alterar dados'),
	(2,'Perigos do update?','Nao pode esquecer de colocar where'),
	(3,'O que é um delete?','deleta uma linha do banco de dados'),
	(3,'Cuidados com ele?','nao pode esquecer do where'),
	(4,'o que eh um insert?','serve para inserir um dado no banco'),
	(4,'como funciona?','insert into (coluna1, coluna2) values (v1, v2)'),
	(5,'Como funciona a web?','requisicao e resposta'),
	(5,'Que linguagens posso ajudar?','varias, java, php, c#, etc'),
	(6,'O que eh MVC?','model view controller'),
	(6,'Frameworks que usam?','vraptor, spring mvc, struts, etc'),
	(7,'O que é a classe Result?','serve para lidar com o resultado'),
	(8,'O que é um interceptor?','eh como se fosse um filtro que eh executado antes'),
	(8,'quando usar?','tratamento de excecoes, conexao com o banco de dados'),
	(9,'o que eh iteracao','tempo que vc tem pra agregar valor'),
	(9,'qual tamanho bom?','de 2 a 4 semanas, segundo o scrum guide antigo'),
	(10,'o que sao retrospectiva?','reunioes onde a ideia eh melhorar o processo'),
	(10,'quando devemos fazer?','geralmente a cada iteracao'),
	(11,'o que eh a reuniao diaria?','uma pequena reuniao para informar a equipe sobre o andamento da iteracao'),
	(11,'quando fazemos?','uma vez por dia, em um horario fixo e pre definido'),
	(12,'o que eh kanban?','um metodo agil tb'),
	(12,'o que eh xp?','outro metodo agil'),
	(12,'tem outros?','lean, crystal, fdd'),
	(13,'o que eh a web?','eh a internet, ue'),
	(13,'como funciona a web?','requisicao e resposta'),
	(14,'o que eh o apache?','servidor que sabe trabalhar com HTTP'),
	(14,'java funciona?','sim, quando colocamos o tomcat junto com ele'),
	(15,'o que eh mysql','essa voce sabe, certo? :)'),
	(16,'o que eh deploy?','eh o processo de colocarmos a aplicacao no ar'),
	(16,'como faz?','em php, basta copiar os arquivos php, em java, basta copiar o jar');

INSERT INTO aluno_curso (fk_id_aluno, fk_id_curso)
VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(5,1),
	(6,2),
	(7,3),
	(8,4),
	(9,1),
	(10,2),
	(11,3),
	(12,4),
	(13,1),
	(14,2),
	(15,3),
	(16,4),
	(17,1),
	(18,2),
	(19,3);    

INSERT INTO nota (fk_id_aluno_curso, nota)
VALUES
	(1,7),
	(2,5),
	(3,9),
	(4,5),
	(5,7),
	(6,2),
	(7,9),
	(8,7),
	(9,6),
	(10,7),
	(11,9),
	(12,2),
	(13,10),
	(14,7),
	(15,9),
	(16,4),
	(17,6),
	(18,7),
	(19,8),
	(1,9),
	(2,10),
	(3,5),
	(4,4),
	(5,6),
	(6,7),
	(7,8),
	(8,9),
	(9,10),
	(10,6),
	(11,4),
	(12,2),
	(13,9),
	(14,7),
	(15,9),
	(16,10),
	(17,6),
	(18,7),
	(19,9),
	(1,10),
	(2,4),
	(3,6),
	(4,8),
	(5,7),
	(6,9),
	(7,4),
	(8,6),
	(9,8),
	(10,10),
	(11,7),
	(12,9),
	(13,8),
	(14,8),
	(15,8),
	(16,9),
	(17,4),
	(18,7),
	(19,9); 


############### EXERCICIOS ######################

# 1 - A PROFESSORA ALINE FOI INSERIDA DUAS VEZES NA TABELA. ALTERE O "SEGUNDO" REGISTRO DELA PARA "FRANCISCO", NAO SE ESQUECA DE VERIFICAR SE OS SEXOS ESTÃO CORRESPONDENTES. 
# DEIXE O CODIGO ABAIXO:



# 2 - O CURSO DE PYTHON NAO ESTA MAIS DISPONIVEL NA ESCOLA. EXCLUA ESTE REGISTO DAS INFORMAÇÕES DO BANCO. DEIXE O CODIGO ABAIXO:



# 3 - SELECIONE O NOME DE TODOS OS ALUNOS QUE CONTEREM "SILVA" EM SEU NOME OU SOBRENOME ORGANIZANDO EM ORDEM ALFABETICA DO "ULTIMO PARA O PRIMEIRO". DEIXE O CODIGO ABAIXO:



# 4 - SELECIONAR QUANTOS ALUNOS NASCERAM ENTRE OS ANOS 1990 E 2000 E RENOMEIE A COLUNA DO SELECT PARA "TOTAL_ALUNOS". DEIXE O CODIGO ABAIXO:



# 5 - SELECIONAR QUANTOS ALUNOS ESTÃO INSCRITOS EM CADA UM DOS CURSOS E RENOMEIE AS COLUNAS DO SELECT. DEIXE O CODIGO ABAIXO:



# 6 - SELECIONAR QUAL A SOMA, A MEDIA, A MENOR NOTA TIRADA E A MAIOR NOTA TIRADA DENTRE TODAS AS NOTAS DOS ALUNOS E RENOMEIE AS COLUNAS DO SELECT. DEIXE O CODIGO ABAIXO:



# 7 - EXIBIR QUAIS OS TITULOS E AS EXPLICACÕES PARA OS TOPICOS DO CURSO DE "BANCO DE DADOS".



# 8 - EXIBIR TODAS AS INFORMAÇÕES SOBRE OS ALUNOS QUE NASCERAM ANTES DOS ANOS 2000, ORGANIZANDO DO MAIS NOVO PARA O MAIS VELHO E DEPOIS EM ORDEM ALFABETICA.




