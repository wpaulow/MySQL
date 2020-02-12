use User;

SELECT sum(duracao) from tbl_filme; #soma 
SElect count(duracao) from tbl_filme; #faz a conta de quantos filmes existem
SElect count(ano_lancamento) from tbl_filme; # faz a conta dos anos de lancamento
SElect count(*) from tbl_filme; # indica qual coluna vai fazer a contagem
SELECT sum(duracao) as soma_duracao from tbl_filme; #soma da duracao (as) pode apelidar uma coluna
SELECT sum(duracao) as soma_duracao from tbl_filme WHERE ano_lancamento <2000;# faz a soma dos registros onde for menor que 2000