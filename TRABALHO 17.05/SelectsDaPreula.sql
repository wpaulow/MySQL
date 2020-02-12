use Biblioteca;

/*1-	UTILIZANDO O RECURSO "IN", SELECIONAR TODAS AS INFORMACOES DOS AUTORES "JK ROWLING" E "STEPHAN KING":*/

Select * from tbl_autor where codigo_autor in (9,10);

/*2-	UTILIZANDO O RECURSO "IN", SELECIONAR O NOME E A CATEGORIA DE TODOS OS LIVROS DAS CATEGORIAS "CONTOS", "POESIA" E "AVENTURA":*/

Select  a.nome_livro as a, b.nome_categoria as b from tbl_livros a 
	join tbl_categoria b on a.fk_categoria = b.codigo_categoria 
		where codigo_categoria in (1,4,14);
        
Select  a.nome_livro as a, b.nome_categoria as b from tbl_livros a 
	join tbl_categoria b on a.fk_categoria = b.codigo_categoria 
		where nome_categoria in ("Aventura","Contos","Poesia");
        
/*3-	EXIBIR QUAL CATEGORIA DE LIVROS, NAO TEM NENHUM LIVRO VINICULADO A ELA.*/
        
select nome_categoria as a from tbl_categoria where !exists (select * from tbl_livros where tbl_livros.fk_categoria = tbl_categoria.codigo_categoria);

/*4-	Exibir o nome dos livros cadastrados, juntamente com suas categorias e nome das editoras que o produziram.*/

select a.nome_livro as a, b.nome_categoria as b, c.nome_editora as c from tbl_livros a
	join tbl_categoria b on a.fk_categoria = b.codigo_categoria
	join tbl_editora c on a.fk_editora = c.codigo_editora;
    
/*5-	Exibir os autores que produziram livros da categoria de romance e quantos livros cada um produziu.*/

select a.nome_autor as a, count(*) as total from autor_livro b
	join tbl_autor a on a.codigo_autor = b.fk_autor
    join tbl_livros c on c.codigo_livro = b.fk_livro
    join tbl_categoria d on d.codigo_categoria = c.fk_categoria
		where nome_categoria in ("Romance") 
			group by codigo_autor;

/*6-	Exibir os nomes dos autores e o nome dos seus livros.*/

select a.nome_autor as a, b.nome_livro as b from autor_livro c
	join tbl_autor a on a.codigo_autor = c.fk_autor
    join tbl_livros b on b.codigo_livro = c.fk_livro;
    
/*7-	Exibir os nomes dos autores e quantos livros cada um produziu em ordem do que mais tem livros para o que menos tem livros.*/

select a.nome_autor as a, count(*) as total_livros from autor_livro c
	join tbl_autor a on a.codigo_autor = c.fk_autor
    join tbl_livros b on b.codigo_livro = c.fk_livro
		group by codigo_autor order by total_livros desc;
        
select b.nome_livro as a, count(*) as total_autores from autor_livro c
	join tbl_autor a on a.codigo_autor = c.fk_autor
    join tbl_livros b on b.codigo_livro = c.fk_livro
		group by codigo_livro order by total_autores desc;
        
/*8-	EXIBIR APENAS O NOME E VALOR_UNITARIO PARA TODOS OS LIVROS QUE O VALOR UNITARIO FOR SUPERIOR A MEDIA DOS PREÇOS. 
ORDENAR A BUSCA DO MENOR VALOR PARA O MAIOR. # DICA: UTILIZE SUBQUERY E ORDER BY.*/

select nome_livro, valor_unitario from tbl_livros
	where valor_unitario > (select avg(valor_unitario) from tbl_livros)
		order by valor_unitario;
    
/* 9-	EXIBIR O NOME DO LIVRO, A QUANTIDADE DE PAGINAS E O NOME DA CATEGORIA PARA TODOS OS LIVROS QUE O NUMERO DE PAGINAS SEJA MENOR QUE A MEDIA DAS PAGINAS. 
ORDERNAR A BUSCA DO MAIOR PARA O MENOR VALOR.*/

select a.nome_livro as a, a.paginas as b,  c.nome_categoria from tbl_livros a
	join tbl_categoria c on a.fk_categoria = c.codigo_categoria
		where a.paginas < (select avg(paginas) from tbl_livros)
			order by paginas desc;

/*10-	EXIBIR O NOME DE TODOS OS LIVROS E SUAS EDITORAS PARA AQUELES LIVROS QUE FORAM EMPRESTADOS NOS ULTIMOS 6 MESES. 
MOSTRAR OS RESULTADOS ORGANIZADOS POR DATA DE EMPRESTIMO.*/

select a.nome_livro as a, b.nome_editora as b, c.retirada as c from livro_emprestimo d
	join tbl_emprestimo c on c.codigo_emprestimo = d.fk_emprestimo
    join tbl_livros a on a.codigo_livro = d.fk_livro
    join tbl_editora b on b.codigo_editora = a.fk_editora
		where c.retirada >= (now() - interval 6 month) order by c.retirada desc;
	
    
#### LEFT JOIN

select * from tbl_livros a
	left join tbl_categoria b on b.codigo_categoria = a.fk_categoria;
    
### VARIAÇÃO DO LEFT JOIN

select a.nome_categoria from tbl_categoria a 
	left join tbl_livros b on a.codigo_categoria = b.fk_categoria 
		where b.fk_categoria is null;

### RIGHT JOIN

select * from tbl_livros a
	right join tbl_categoria b on b.codigo_categoria = a.fk_categoria;
    
### VARIAÇÃO DO RIGHT JOIN 

select b.nome_categoria from tbl_livros a 
	right join tbl_categoria b on b.codigo_categoria = a.fk_categoria
		where a.fk_categoria is null;
        
### FULL JOIN

select nome_cliente a, nome_bibliotecario b from tbl_emprestimo c
	left join tbl_cliente a on a.codigo_cliente = c.fk_cliente
    left join tbl_bibliotecario b on b.codigo_bibliotecario = c.fk_bibliotecario
union
select nome_cliente a, nome_bibliotecario b from tbl_emprestimo c
	right join tbl_cliente a on a.codigo_cliente = c.fk_cliente
    right join tbl_bibliotecario b on b.codigo_bibliotecario = c.fk_bibliotecario;