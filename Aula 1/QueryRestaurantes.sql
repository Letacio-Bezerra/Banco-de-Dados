-- Criar o banco de dados
CREATE DATABASE RestaurantesSP;
GO

-- Usar o banco de dados criado
USE RestaurantesSP;
GO

-- Criar tabela para zonas de SP
CREATE TABLE ZonasSP (
    ZonaID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(50) NOT NULL
);
GO

-- Criar tabela para os endereços (com Bairro e ZonaID)
CREATE TABLE Enderecos (
    EnderecoID INT PRIMARY KEY IDENTITY(1,1),
    Rua NVARCHAR(100) NOT NULL,
    Numero NVARCHAR(10),
    Bairro NVARCHAR(100) NOT NULL,
    ZonaID INT,
    Cidade NVARCHAR(100) NOT NULL DEFAULT 'São Paulo',
    Estado NVARCHAR(2) NOT NULL DEFAULT 'SP',
    CEP NVARCHAR(9),
    CONSTRAINT FK_ZonaSP FOREIGN KEY (ZonaID) REFERENCES ZonasSP(ZonaID)
);
GO

-- Criar tabela para os tipos de cozinha
CREATE TABLE TiposCozinha (
    TipoCozinhaID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL
);
GO

-- Criar tabela para os restaurantes (com ValorMedio em reais e HorarioFuncionamento)
CREATE TABLE Restaurantes (
    RestauranteID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    Descricao NVARCHAR(255),
    Telefone NVARCHAR(20),
    Website NVARCHAR(100),
    TipoCozinhaID INT,
    EnderecoID INT,
    ValorMedio DECIMAL(10, 2), -- Valor médio em reais
    HorarioFuncionamento NVARCHAR(100),  -- Ex: "10:00-22:00"
    CONSTRAINT FK_TipoCozinha FOREIGN KEY (TipoCozinhaID) REFERENCES TiposCozinha(TipoCozinhaID),
    CONSTRAINT FK_Endereco FOREIGN KEY (EnderecoID) REFERENCES Enderecos(EnderecoID)
);
GO

-- Criar tabela para avaliações dos restaurantes
CREATE TABLE Avaliacoes (
    AvaliacaoID INT PRIMARY KEY IDENTITY(1,1),
    RestauranteID INT,
    ClienteNome NVARCHAR(100),
    Nota INT CHECK (Nota >= 1 AND Nota <= 5),
    Comentario NVARCHAR(255),
    DataAvaliacao DATE DEFAULT GETDATE(),
    CONSTRAINT FK_Restaurante FOREIGN KEY (RestauranteID) REFERENCES Restaurantes(RestauranteID)
);
GO

-- Inserir zonas de São Paulo (exemplo)
INSERT INTO ZonasSP (Nome) VALUES
('Zona Norte'),
('Zona Sul'),
('Zona Leste'),
('Zona Oeste'),
('Centro');
GO

-- Inserir tipos de cozinha iniciais
INSERT INTO TiposCozinha (Nome) VALUES 
('Italiana'),
('Japonesa'),
('Brasileira'),
('Mexicana'),
('Francesa'),
('Chinesa'),
('Indiana');
GO

-- Inserção de restaurantes com valor médio e horário de funcionamento
INSERT INTO Enderecos (Rua, Numero, Bairro, ZonaID, CEP) VALUES 
('Av. Paulista', '1000', 'Bela Vista', 5, '01310-100'),
('Rua Augusta', '300', 'Consolação', 5, '01305-000'),
('Rua dos Trilhos', '450', 'Mooca', 3, '03181-020'),
('Rua Vergueiro', '1200', 'Vila Mariana', 5, '04101-000'),
('Rua Haddock Lobo', '123', 'Jardins', 5, '01414-001'),
('Av. Ipiranga', '500', 'República', 5, '01046-010'),
('Rua das Flores', '25', 'Pinheiros', 4, '05411-000'),
('Rua São Bento', '101', 'Centro', 5, '01011-000'),
('Av. Braz Leme', '455', 'Santana', 1, '02022-000'),
('Rua Apinajés', '672', 'Perdizes', 4, '05017-001'),
('Rua Pedroso de Moraes', '800', 'Pinheiros', 4, '05419-001'),
('Av. Brigadeiro Faria Lima', '3000', 'Itaim Bibi', 4, '04538-000'),
('Rua Cardoso de Almeida', '400', 'Perdizes', 4, '05013-000'),
('Rua do Oratório', '890', 'Vila Prudente', 3, '03220-000'),
('Rua Padre Manuel', '150', 'Saúde', 5, '04159-001'),
('Av. Lins de Vasconcelos', '1345', 'Cambuci', 5, '01537-000'),
('Rua dos Estudantes', '231', 'Liberdade', 5, '01505-001'),
('Rua Francisco Morato', '940', 'Butantã', 4, '05510-001'),
('Av. São João', '100', 'Centro', 5, '01035-000'),
('Rua Clélia', '400', 'Lapa', 4, '05042-001'),
('Rua Álvares Penteado', '120', 'Centro', 5, '01012-000'),
('Rua da Consolação', '1111', 'Consolação', 5, '01301-000'),
('Av. Guarapiranga', '1777', 'Socorro', 2, '04764-003'),
('Rua Heitor Penteado', '299', 'Sumaré', 4, '05438-000'),
('Rua José Maria Lisboa', '500', 'Jardins', 5, '01423-000'),
('Rua Oscar Freire', '1020', 'Jardins', 5, '01426-001'),
('Av. Rebouças', '1550', 'Pinheiros', 4, '05402-000'),
('Av. Pompéia', '2100', 'Vila Pompéia', 4, '05022-000'),
('Rua da Mooca', '1200', 'Mooca', 3, '03104-000'),
('Rua Amélia de Almeida', '300', 'Vila Mariana', 5, '04109-010'),
('Rua Joaquim Floriano', '900', 'Itaim Bibi', 4, '04534-003'),
('Rua Funchal', '551', 'Vila Olímpia', 4, '04551-060'),
('Rua Leopoldo Couto de Magalhães', '700', 'Itaim Bibi', 4, '04542-000'),
('Rua Bandeira Paulista', '234', 'Itaim Bibi', 4, '04532-000'),
('Rua Ramos Batista', '570', 'Vila Olímpia', 4, '04552-020'),
('Rua do Horto', '550', 'Horto Florestal', 1, '02377-000'),
('Rua Carneiro da Cunha', '1340', 'Saúde', 5, '04144-004'),
('Rua Bela Cintra', '1225', 'Consolação', 5, '01415-001'),
('Rua do Acre', '470', 'Santo Amaro', 2, '04752-060'),
('Rua Cunha Gago', '188', 'Pinheiros', 4, '05421-001'),
('Rua dos Três Irmãos', '550', 'Butantã', 4, '05513-001'),
('Rua Turiassu', '1500', 'Perdizes', 4, '05005-001'),
('Rua dos Timbiras', '300', 'República', 5, '01208-010'),
('Rua Lopes de Oliveira', '222', 'Barra Funda', 4, '01152-000'),
('Av. Angélica', '2500', 'Santa Cecília', 5, '01227-000'),
('Rua Teodoro Sampaio', '2211', 'Pinheiros', 4, '05406-200'),
('Rua Cel. Lisboa', '120', 'Vila Mariana', 5, '04101-050'),
('Rua Tomás Carvalhal', '350', 'Paraíso', 5, '04006-001');
GO

-- Inserir 50 registros na tabela Restaurantes
INSERT INTO Restaurantes (Nome, Descricao, Telefone, Website, TipoCozinhaID, EnderecoID, ValorMedio, HorarioFuncionamento) VALUES 
('Restaurante Italiano Paulista', 'Culinária italiana moderna', '(11) 1234-5678', 'www.italianopaulista.com.br', 1, 1, 120.50, '12:00-23:00'),
('Sushi Augusta', 'Sushi bar tradicional', '(11) 9876-5432', 'www.sushiaugusta.com.br', 2, 2, 80.00, '11:00-22:00'),
('Churrascaria da Mooca', 'Churrascaria brasileira clássica', '(11) 3333-2222', 'www.churrascariamooca.com.br', 3, 3, 150.00, '12:00-23:00'),
('Pizza Vergueiro', 'Pizzaria famosa na Vila Mariana', '(11) 4444-5555', 'www.pizzavergueiro.com.br', 1, 4, 60.00, '18:00-00:00'),
('Bistro Haddock Lobo', 'Bistrô francês aconchegante', '(11) 8888-7777', 'www.bistrohaddock.com.br', 5, 5, 110.00, '12:00-23:00'),
('Cantina Paulista', 'Cantina italiana familiar', '(11) 7777-6666', 'www.cantinapaulista.com.br', 1, 6, 95.00, '12:00-22:00'),
('Restaurante Chino Flores', 'Culinária chinesa autêntica', '(11) 9999-8888', 'www.restaurantechino.com.br', 6, 7, 70.00, '11:30-21:00'),
('Restaurante Vegano São Bento', 'Opções veganas e vegetarianas', '(11) 1111-2222', 'www.veganosbento.com.br', 3, 8, 65.00, '11:30-21:00'),
('Restaurante Árabe Santana', 'Comida árabe autêntica', '(11) 1234-1111', 'www.arabesantana.com.br', 4, 9, 85.00, '12:00-22:30'),
('Restaurante Brasileiro Perdizes', 'Comida brasileira caseira', '(11) 5656-4343', 'www.brasileiroperdizes.com.br', 3, 10, 50.00, '11:00-15:00'),
('Liberdade Sushi', 'Sushi tradicional no coração da Liberdade', '(11) 9090-8080', 'www.liberdadesushi.com.br', 2, 11, 100.00, '11:00-23:00'),
('Pinheiros Bar & Grill', 'Bar e churrasco', '(11) 6565-4747', 'www.pinheirosbar.com.br', 3, 12, 120.00, '12:00-02:00'),
('Faria Lima Gourmet', 'Alta gastronomia contemporânea', '(11) 5656-6767', 'www.farialimagourmet.com.br', 5, 13, 180.00, '12:00-00:00'),
('Café da Vila', 'Cafeteria charmosa', '(11) 3232-5454', 'www.cafedavila.com.br', 3, 14, 30.00, '08:00-18:00'),
('Churrascaria Vila Prudente', 'Churrasco brasileiro em um ambiente descontraído', '(11) 6767-7878', 'www.churrascariavilaprudente.com.br', 3, 15, 150.00, '12:00-23:00'),
('Restaurante Italiano Padre Manuel', 'Restaurante de massas e vinhos', '(11) 2323-5656', 'www.italianopadremanuel.com.br', 1, 16, 90.00, '12:00-22:30'),
('Cambuci Bistrô', 'Bistrô elegante no Cambuci', '(11) 4545-7676', 'www.cambucibistro.com.br', 5, 17, 110.00, '12:00-23:00'),
('Sakura Liberdade', 'Culinária japonesa clássica', '(11) 3434-6767', 'www.sakuraliberdade.com.br', 2, 18, 130.00, '12:00-23:30'),
('Butantã Gourmet', 'Restaurante contemporâneo com foco em ingredientes locais', '(11) 9898-7878', 'www.butantagourmet.com.br', 5, 19, 200.00, '12:00-22:00'),
('Restaurante São João', 'Comida brasileira tradicional', '(11) 2323-4545', 'www.restaurantesaojoao.com.br', 3, 20, 70.00, '12:00-23:00'),
('Lapa Grill', 'Churrasco e grelhados', '(11) 1212-2323', 'www.lapagrill.com.br', 3, 21, 140.00, '12:00-23:00'),
('Restaurante Ávila', 'Gastronomia contemporânea com pratos gourmet', '(11) 6767-2323', 'www.restauranteavila.com.br', 5, 22, 180.00, '12:00-23:30'),
('Bar do Sumaré', 'Bar descontraído com petiscos e drinks', '(11) 5454-8787', 'www.bardosumare.com.br', 3, 23, 45.00, '17:00-02:00'),
('Restaurante Jardins', 'Restaurante elegante com culinária francesa', '(11) 7878-6767', 'www.restaurantejardins.com.br', 5, 24, 250.00, '12:00-23:00'),
('Oscar Freire Sushi', 'Sushi moderno em ambiente sofisticado', '(11) 8989-6767', 'www.oscarfreiresushi.com.br', 2, 25, 180.00, '12:00-23:30'),
('Restaurante Brasileiro Rebouças', 'Comida brasileira com toque contemporâneo', '(11) 9898-3434', 'www.brasileiroreboucas.com.br', 3, 26, 90.00, '12:00-22:00'),
('Churrascaria Pompéia', 'Tradicional churrascaria com variedade de carnes', '(11) 3232-8989', 'www.churrascariapompeia.com.br', 3, 27, 160.00, '12:00-23:00'),
('Pizzaria Mooca', 'Pizzas artesanais com ingredientes de alta qualidade', '(11) 5656-6767', 'www.pizzariamooca.com.br', 1, 28, 85.00, '18:00-00:00'),
('Vila Mariana Trattoria', 'Trattoria italiana tradicional', '(11) 7676-6767', 'www.trattoriavilamariana.com.br', 1, 29, 120.00, '12:00-23:00'),
('Itaim Sushi Bar', 'Sushi contemporâneo com toque autoral', '(11) 5454-1212', 'www.itamsushibar.com.br', 2, 30, 170.00, '12:00-23:00'),
('Vila Olímpia Churrascaria', 'Churrasco brasileiro com opções premium', '(11) 8989-3434', 'www.vilaolimpiachurrascaria.com.br', 3, 31, 180.00, '12:00-23:30'),
('Restaurante Chique Leopoldo', 'Restaurante de alta gastronomia com pratos sofisticados', '(11) 6565-7878', 'www.restauranteleopoldo.com.br', 5, 32, 250.00, '12:00-00:00'),
('Restaurante Bandeira Paulista', 'Culinária internacional com pratos clássicos', '(11) 9898-4545', 'www.restaurantebandeirapaulista.com.br', 5, 33, 190.00, '12:00-23:30'),
('Restaurante do Horto', 'Restaurante ao ar livre com culinária brasileira', '(11) 8989-5656', 'www.restaurantedohorto.com.br', 3, 34, 100.00, '12:00-22:00'),
('Saúde Natural', 'Comida saudável e vegetariana', '(11) 6767-2323', 'www.saudenatural.com.br', 3, 35, 60.00, '11:00-20:00'),
('Restaurante da Consolação', 'Restaurante tradicional com foco em massas', '(11) 7878-2323', 'www.restaurantedaconsolacao.com.br', 1, 36, 110.00, '12:00-23:00'),
('Churrascaria do Acre', 'Churrascaria famosa em Santo Amaro', '(11) 2323-6767', 'www.churrascariadoacre.com.br', 3, 37, 160.00, '12:00-23:00'),
('Pinheiros Gourmet', 'Alta gastronomia com toque brasileiro', '(11) 8989-8787', 'www.pinheirosgourmet.com.br', 5, 38, 230.00, '12:00-23:00'),
('Restaurante dos Irmãos', 'Restaurante familiar com pratos caseiros', '(11) 2323-5656', 'www.restaurantedosirmaos.com.br', 3, 39, 70.00, '12:00-22:00'),
('Restaurante Perdizes', 'Comida brasileira regional', '(11) 5656-2323', 'www.restauranteperdizes.com.br', 3, 40, 90.00, '12:00-23:00'),
('República Gourmet', 'Culinária contemporânea com pratos refinados', '(11) 3434-5656', 'www.republicagourmet.com.br', 5, 41, 200.00, '12:00-22:00'),
('Tian Gastronomia', 'Experiência gastronômica única', '(11) 4444-5555', 'www.tiangastronomia.com.br', 5, 42, 240.00, '12:00-23:00'),
('Pampa Grill', 'Churrascaria com estilo uruguaio', '(11) 5656-7878', 'www.pampagrill.com.br', 3, 43, 170.00, '12:00-22:30'),
('Boteco do Jorge', 'Bar tradicional com petiscos', '(11) 6767-8989', 'www.botecodojorge.com.br', 3, 44, 40.00, '17:00-02:00'),
('Café Gourmet Paulista', 'Cafeteria com opções gourmet', '(11) 7878-5454', 'www.cafegourmetpaulista.com.br', 1, 45, 35.00, '08:00-18:00'),
('Cantinho da Vovó', 'Comida caseira e acolhedora', '(11) 3434-7676', 'www.cantinhodavovo.com.br', 3, 46, 55.00, '12:00-20:00'),
('Sabor do Nordeste', 'Culinária nordestina', '(11) 4545-8989', 'www.sabordonordeste.com.br', 3, 47, 75.00, '12:00-22:00'),
('Gastronomia Paulistana', 'Restaurante de alta gastronomia', '(11) 5656-3434', 'www.gastronomiapaulistana.com.br', 5, 48, 210.00, '12:00-23:00')
GO

SELECT * FROM Restaurantes