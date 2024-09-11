SELECT * FROM Restaurantes

--Selecionando os restaurantes com ValorMedio maior que R$100,00
SELECT * FROM Restaurantes
WHERE ValorMedio > 100

--Selecionando o restaurante com ValorMedio menor. Resposta: Café da Vila
SELECT * FROM Restaurantes
ORDER BY ValorMedio ASC

--Selecionando o HorarioFuncionamento do Restaurante Italiano Paulista
SELECT Nome, HorarioFuncionamento FROM Restaurantes
WHERE Nome = 'Restaurante Italiano Paulista'

--Selecionando o restaurante com ValorMedio maior de comida japonesa. Resposta: Oscar Freire
SELECT * FROM TiposCozinha
SELECT Nome, Descricao, ValorMedio FROM Restaurantes
WHERE TipoCozinhaID = 2
ORDER BY ValorMedio DESC




SELECT * FROM Enderecos

--Contando quantos restaurantes estão na Mooca. = 6
SELECT COUNT(*) Bairro FROM Enderecos
WHERE Bairro = 'Mooca'
--Confirmando que são 6
SELECT * FROM Enderecos
WHERE Bairro = 'Mooca'