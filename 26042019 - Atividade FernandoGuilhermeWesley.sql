Drop database Atividade1;
CREATE DATABASE Atividade1;
USE Atividade1;

CREATE TABLE Fornecedor(
	IdFornecedor integer primary key auto_increment,
    Nome VARCHAR(45) not null,
    Cnpj VARCHAR(45) not null,
    Email VARCHAR(45) not null
);

CREATE TABLE Produto(
	IdProduto integer auto_increment primary key,
    NomeProduto VARCHAR(45) not null,
    Valor VARCHAR(45) not null,
    Fornecedor_IdFornecedor integer, 
    foreign key(Fornecedor_IdFornecedor) REFERENCES Fornecedor (IdFornecedor)
);

CREATE TABLE Cliente(
	IdCliente integer primary key auto_increment,
    NomeCliente VARCHAR(45) not null,
    RG VARCHAR(45) not null
);

CREATE TABLE Vendas(
	IdVendas integer primary key auto_increment,
    Data DATE not null,
    Produto_IdProduto integer,
    Cliente_IdCliente integer,
    foreign key(Produto_IdProduto) REFERENCES Produto (IdProduto),
    foreign key(Cliente_IdCliente) REFERENCES Cliente (IdCliente)        
    
);

INSERT INTO Fornecedor(Nome, Cnpj, Email) 
	VALUES  ('Americanas', '47.654.974/0001-98', 'americanas@loja.com'),
			('Submarino', '14.684.014/0008-52', 'submarino@loja.com'),
			('Saraiva', '35.790.082/8580-00', 'saraiva@loja.com'),
			('Padaria do Zé', '96.325.874/0001-01', 'padaze@loja.com');
            


INSERT INTO Produto(NomeProduto, Valor, Fornecedor_IdFornecedor) 
	VALUES  ('Celular', '800.00', 1),
			('Notebook', '1500,00', 2),
			('Livro', '29,99', 3),
			('Nescau', '8,50', 4);
            
INSERT INTO Cliente (NomeCliente, RG)
	VALUES ('Zimbertino Terto','42.954.985-7'),
			('Cleubelia Amaral','75.321.479-0'),
            ('Aluzinia Souza','96.325.874-1'),
            ('Carnabrando Pedreso','98.765.432-1');
            
INSERT INTO Vendas (Data, Produto_IdProduto, Cliente_IdCliente)
	VALUES ('2018/04/26', 1, 1),
			('2019/01/17', 1, 2),
            ('2011/05/03', 2, 2),
            ('2015/09/07', 3, 3);

Alter table Fornecedor Rename tbl_Fornecedor;
Alter table Produto rename tbl_Produto;
Alter table Cliente rename tbl_Cliente;
Alter table Vendas rename tbl_Vendas;

Alter table tbl_Fornecedor modify Email VARCHAR(100) not null;
Alter table tbl_Fornecedor change Nome NomeFornecedor VARCHAR(45) not null;
Alter table tbl_Produto modify Valor Decimal(7,2) not null;
select*from tbl_Produto;
desc tbl_Produto;
Alter table tbl_Cliente change RG CPF VARCHAR(45) not null;
UPDATE tbl_Cliente SET CPF = '256.456.459-72' where IdCliente = 1;
UPDATE tbl_Cliente SET CPF = '456.256.899-82' where IdCliente = 2;
UPDATE tbl_Cliente SET CPF = '326.456.459-72' where IdCliente = 3;
UPDATE tbl_Cliente SET CPF = '256.488.459-22' where IdCliente = 4;
select*from tbl_Cliente;
DELETE from tbl_Cliente where IdCliente = 4;
Alter table tbl_Vendas modify Data datetime default now();

SELECT * FROM tbl_Produto WHERE NomeProduto LIKE "N%";
SELECT (NomeCliente) FROM tbl_Cliente WHERE NomeCliente LIKE "%A%"; 
SELECT count(*) as VendasPorCliente, Produto_IdProduto FROM tbl_Vendas group by Cliente_IdCliente;


