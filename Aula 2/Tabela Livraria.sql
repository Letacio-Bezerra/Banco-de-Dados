
-- Inserindo 10 Autores
INSERT INTO Autores (Nome) VALUES ('J.K. Rowling');
INSERT INTO Autores (Nome) VALUES ('George Orwell');
INSERT INTO Autores (Nome) VALUES ('Harper Lee');
INSERT INTO Autores (Nome) VALUES ('F. Scott Fitzgerald');
INSERT INTO Autores (Nome) VALUES ('Gabriel García Márquez');
INSERT INTO Autores (Nome) VALUES ('Agatha Christie');
INSERT INTO Autores (Nome) VALUES ('J.R.R. Tolkien');
INSERT INTO Autores (Nome) VALUES ('Ernest Hemingway');
INSERT INTO Autores (Nome) VALUES ('Jane Austen');
INSERT INTO Autores (Nome) VALUES ('Mark Twain');

INSERT INTO Livros (Titulo, AutorID) VALUES ('Harry Potter and the Philosophers Stone', 1);
INSERT INTO Livros (Titulo, AutorID) VALUES ('1984', 2);
INSERT INTO Livros (Titulo, AutorID) VALUES ('To Kill a Mockingbird', 3);
INSERT INTO Livros (Titulo, AutorID) VALUES ('The Great Gatsby', NULL);
INSERT INTO Livros (Titulo, AutorID) VALUES ('One Hundred Years of Solitude', 5);
INSERT INTO Livros (Titulo, AutorID) VALUES ('Murder on the Orient Express', 6);
INSERT INTO Livros (Titulo, AutorID) VALUES ('The Lord of the Rings', 7);
INSERT INTO Livros (Titulo, AutorID) VALUES ('The Old Man and the Sea', 8);
INSERT INTO Livros (Titulo, AutorID) VALUES ('Pride and Prejudice', 9);
INSERT INTO Livros (Titulo, AutorID) VALUES ('The Adventures of Huckleberry Finn', NULL);

-- Inserindo 10 Membros
INSERT INTO Membros (Nome) VALUES ('Lucas Braga');
INSERT INTO Membros (Nome) VALUES ('Mariana Gomes');
INSERT INTO Membros (Nome) VALUES ('Nicolas Ferreira');
INSERT INTO Membros (Nome) VALUES ('Patrícia Almeida');
INSERT INTO Membros (Nome) VALUES ('Renato Barros');
INSERT INTO Membros (Nome) VALUES ('Sofia Moreira');
INSERT INTO Membros (Nome) VALUES ('Thiago Lima');
INSERT INTO Membros (Nome) VALUES ('Vanessa Duarte');
INSERT INTO Membros (Nome) VALUES ('Wagner Sousa');
INSERT INTO Membros (Nome) VALUES ('Yasmin Ribeiro');

-- Inserindo 10 Empréstimos, alguns com MembroID nulo
INSERT INTO Emprestimos (LivroID, MembroID, DataEmprestimo) VALUES (1, 1, '2024-01-10');
INSERT INTO Emprestimos (LivroID, MembroID, DataEmprestimo) VALUES (2, 2, '2024-02-15');
INSERT INTO Emprestimos (LivroID, MembroID, DataEmprestimo) VALUES (3, NULL, '2024-03-20');
INSERT INTO Emprestimos (LivroID, MembroID, DataEmprestimo) VALUES (4, 4, '2024-04-05');
INSERT INTO Emprestimos (LivroID, MembroID, DataEmprestimo) VALUES (5, 5, '2024-05-30');
INSERT INTO Emprestimos (LivroID, MembroID, DataEmprestimo) VALUES (6, 6, '2024-06-10');
INSERT INTO Emprestimos (LivroID, MembroID, DataEmprestimo) VALUES (NULL, 7, '2024-07-20');
INSERT INTO Emprestimos (LivroID, MembroID, DataEmprestimo) VALUES (8, NULL, '2024-08-25');
INSERT INTO Emprestimos (LivroID, MembroID, DataEmprestimo) VALUES (9, 9, '2024-09-30');
INSERT INTO Emprestimos (LivroID, MembroID, DataEmprestimo) VALUES (10, 10, '2024-10-10');