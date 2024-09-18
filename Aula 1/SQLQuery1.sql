SELECT * FROM Restaurantes

--Quantos restaurantes tem = 48
SELECT COUNT(*) FROM Restaurantes

--Quantos restaurantes tem com ValorMedio > 200
--AS cria um "apelido" para a coluna da contagem
SELECT COUNT(*) AS total
FROM Restaurantes
WHERE ValorMedio > 200

--Tipos diferentes de cozinhas
SELECT COUNT(DISTINCT TipoCozinhaID) AS total
FROM Restaurantes

--Quantas de cada tipo tem
SELECT COUNT(*) AS total, TipoCozinhaID
FROM Restaurantes
GROUP BY TipoCozinhaID



--Restaurantes com o ValorMedio entre 0 e 100
SELECT Nome, ValorMedio
FROM Restaurantes
WHERE ValorMedio BETWEEN 0 AND 100

--Pedidos feitos entre 2024-08-01 e 2024-08-31, n funciona nesse banco de dados pois é somente um exemplo
SELECT * FROM Restaurantes
WHERE data_pedido BETWEEN '2024-08-01' AND '2024-08-31'



--Todos que começam com c e %=qualquer coisa depois
SELECT * FROM Restaurantes
WHERE Nome LIKE 'c%'

--Todos que começam com % e r depois
SELECT * FROM Restaurantes
WHERE Nome LIKE '%r'

--Todos que tenha u no meio
SELECT * FROM Restaurantes
WHERE Nome LIKE '%u%'



SELECT * FROM Enderecos

SELECT COUNT(*) AS total, Bairro
FROM Enderecos
GROUP BY Bairro