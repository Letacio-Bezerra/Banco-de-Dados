SELECT Livros.Titulo, Autores.Nome
FROM Livros
INNER JOIN Autores
ON Livros.AutorID = Autores.AutorID


SELECT Livros.Titulo, Emprestimos.DataEmprestimo
FROM Emprestimos
RIGHT JOIN Livros
ON Livros.LivroID = Emprestimos.LivroID


SELECT Membros.Nome, Emprestimos.DataEmprestimo
FROM Emprestimos
RIGHT JOIN Membros
ON Membros.MembroID = Emprestimos.MembroID