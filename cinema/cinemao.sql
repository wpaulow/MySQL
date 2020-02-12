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
                                
CREATE TABLE tbl_Horario (Id_Horario int primary key auto_increment, 
							Hora time not null);

CREATE TABLE tbl_Sala (Id_Sala int primary key auto_increment, 
						Nome varchar(45) not null, 
                        Capacidade int(3) not null);

CREATE TABLE tbl_Exibicao (Id_Exibicao int auto_increment,
							FK_Id_filme int,
							FK_Id_Horario int,
                            FK_Id_Sala int,
							PRIMARY KEY (Id_Exibicao, FK_Id_filme, FK_Id_Horario, FK_Id_Sala), #aqui o MySQL reclamou um pouco, dizendo que não poderia ter mais de uma declaração de pk assim e que travesti não era bagunça. Daí tive que declarar todas em um único ponto. Mas o engraçado é que em momentos anteriores já rolou isso e ele não falou nada.
							FOREIGN KEY (FK_Id_filme) REFERENCES tbl_Filme (Id_filme),
							FOREIGN KEY (FK_Id_Horario) REFERENCES tbl_Horario (Id_Horario),
                            FOREIGN KEY (FK_Id_Sala) REFERENCES tbl_Sala (Id_Sala));
                                
ALTER TABLE tbl_Diretor ADD Sexo varchar (1) not null;

ALTER TABLE tbl_Diretor MODIFY Nacionalidade varchar (45) not null;

ALTER TABLE tbl_Filme DROP Nome_filme_EN;

ALTER TABLE tbl_Filme CHANGE Nome_filme_PT Nome_filme varchar (45) not null;
                                                         
ALTER TABLE tbl_filme ADD Cartaz BOOLEAN;

UPDATE tbl_filme SET Cartaz = true WHERE ano_lancamento>2004; 
UPDATE tbl_filme SET Cartaz = false WHERE cartaz is null;

ALTER TABLE tbl_ator ADD Status_ator ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';
ALTER TABLE tbl_genero ADD Status_genero ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';
ALTER TABLE tbl_diretor ADD Status_diretor ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';
ALTER TABLE tbl_filme ADD Status_filme ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';
ALTER TABLE tbl_filme_e_ator ADD Status_filme_e_ator ENUM ('ATIVO','INATIVO') DEFAULT 'ATIVO';

DESC tbl_Diretor;


