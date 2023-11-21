-- Inserção de dados na tabela Usuario
INSERT INTO Usuario (nome, telefone, email, localizacao, senha)
VALUES
    ('João da Silva', '(11) 9999-9999', 'joao@silva.com', 'Imperatriz, MA', '123456'),
    ('Maria Oliveira', '(21) 8888-8888', 'maria@email.com', 'Rio de Janeiro, RJ', 'senha123'),
    ('Carlos Santos', '(31) 7777-7777', 'carlos@email.com', 'Belo Horizonte, MG', 'senha456'),
    ('Ana Souza', '(41) 6666-6666', 'ana@email.com', 'Curitiba, PR', 'senha789'),
    ('Rafaela Lima', '(51) 5555-5555', 'rafaela@email.com', 'Porto Alegre, RS', 'senhaabc'),
    ('Pedro Rocha', '(61) 4444-4444', 'pedro@email.com', 'Brasília, DF', 'senhaxyz'),
    ('Camila Pereira', '(12) 3333-3333', 'camila@email.com', 'São Paulo, SP', 'senha321'),
    ('Lucas Oliveira', '(22) 2222-2222', 'lucas@email.com', 'Niterói, RJ', 'senha654'),
    ('Juliana Costa', '(32) 1111-1111', 'juliana@email.com', 'Juiz de Fora, MG', 'senha987'),
    ('Fernando Silva', '(42) 9999-9999', 'fernando@email.com', 'Maringá, PR', 'senhaxyz'),
    ('Isabela Santos', '(52) 8888-8888', 'isabela@email.com', 'Pelotas, RS', 'senhawww');

-- Inserção de dados na tabela Ingredientes (incluindo os ausentes)
INSERT INTO Ingredientes (Nome, Quantidade, UnidadeMedida, Calorias, Proteinas, Carboidratos, Gorduras)
VALUES 
    ('Arroz', 1000, 'g', 350, 6, 70, 10),
    ('Carne moída', 500, 'g', 250, 20, 25, 15),
    ('Batata', 500, 'g', 250, 4, 50, 0),
    ('Cenoura', 200, 'g', 80, 1, 15, 0),
    ('Tomate', 200, 'g', 20, 1, 4, 0),
    ('Pimentão', 100, 'g', 25, 1, 5, 0),
    ('Cheiro-verde', 100, 'g', 20, 2, 5, 0),
    ('Azeite', 100, 'ml', 800, 0, 0, 90),
    ('Sal', 10, 'g', 0, 0, 0, 0),
    ('Pimenta', 1, 'g', 0, 0, 0, 0),
    ('Macarrão', 100, 'g', 157, 5.76, 30.68, 0.92),
    ('Quinoa cozida', 150, 'g', 185, 8, 30, 3),
    ('Abóbora assada', 200, 'g', 50, 1, 12, 0),
    ('Lentilhas cozidas', 100, 'g', 116, 9, 20, 1),
    ('Queijo cottage', 100, 'g', 98, 11, 3, 5),
    ('Melancia', 300, 'g', 90, 2, 22, 0.5),
    ('Atum em água enlatado', 100, 'g', 109, 26, 0, 1),
    ('Mandioca cozida', 150, 'g', 159, 2, 38, 0.3),
    ('Castanha-do-Pará', 30, 'g', 200, 4, 4, 20),
    ('Quibe assado', 200, 'g', 350, 15, 45, 12),
    ('Couve-flor cozida', 150, 'g', 25, 2, 5, 0.3),
    ('Tofu grelhado', 150, 'g', 144, 16, 3, 8),
    ('Mel', 30, 'ml', 90, 0.1, 24, 0),
    ('Camarão cozido', 100, 'g', 100, 20, 0, 1.5),
    ('Alface', 100, 'g', 5, 1, 1, 0),
    ('Cacau em pó', 20, 'g', 12, 1, 3, 1),
    ('Aipo', 100, 'g', 16, 0.5, 3, 0)
ON DUPLICATE KEY UPDATE Nome = Nome; -- Para evitar erros de duplicação
-- Inserção de dados na tabela Receitas
INSERT INTO Receitas (nomeReceita, descricao, modoPreparo, porcoes, infoNutricionais, id_usuario)
VALUES 
    ('Arroz com feijão', 'Receita tradicional de arroz com feijão', 'Coloque o arroz e o feijão na panela e cozinhe de acordo com as instruções da embalagem.', 4, 'Calorias: 500 | Proteínas: 20g | Carboidratos: 80g | Gorduras: 10g', 1),
    ('Bife acebolado', 'Receita tradicional de bife acebolado', 'Tempere os bifes com sal e pimenta a gosto. Em uma frigideira, aqueça o azeite e frite os bifes de ambos os lados. Adicione a cebola e refogue até dourar.', 4, 'Calorias: 600 | Proteínas: 40g | Carboidratos: 20g | Gorduras: 30g', 1),
    ('Macarrão com molho de tomate', 'Receita clássica de macarrão com molho de tomate', 'Cozinhe o macarrão de acordo com as instruções da embalagem. Em uma panela, refogue a cebola, o alho e o tomate picado. Adicione o molho de tomate, o orégano e o sal a gosto. Cozinhe por cerca de 10 minutos.', 4, 'Calorias: 500 | Proteínas: 20g | Carboidratos: 70g | Gorduras: 20g', 1)
ON DUPLICATE KEY UPDATE nomeReceita = nomeReceita;
-- Correção da tabela de relacionamento Receitas_Ingredientes
UPDATE Receitas_Ingredientes
SET ID_Ingrediente = 
    CASE
        WHEN ID_Receita = 1 AND ID_Ingrediente = 1 THEN 1  -- Arroz com feijão: Arroz
        WHEN ID_Receita = 1 AND ID_Ingrediente = 10 THEN 9 -- Arroz com feijão: Sal
        WHEN ID_Receita = 1 AND ID_Ingrediente = 9 THEN 10 -- Arroz com feijão: Pimenta
        WHEN ID_Receita = 1 AND ID_Ingrediente = 5 THEN 5  -- Arroz com feijão: Tomate
        WHEN ID_Receita = 1 AND ID_Ingrediente = 7 THEN 7  -- Arroz com feijão: Cheiro-verde
        WHEN ID_Receita = 1 AND ID_Ingrediente = 6 THEN 6  -- Arroz com feijão: Pimentão
        WHEN ID_Receita = 1 AND ID_Ingrediente = 8 THEN 8  -- Arroz com feijão: Azeite
        WHEN ID_Receita = 2 AND ID_Ingrediente = 2 THEN 2  -- Bife acebolado: Carne moída
        WHEN ID_Receita = 2 AND ID_Ingrediente = 10 THEN 9 -- Bife acebolado: Sal
        WHEN ID_Receita = 2 AND ID_Ingrediente = 9 THEN 10 -- Bife acebolado: Pimenta
        WHEN ID_Receita = 2 AND ID_Ingrediente = 7 THEN 7  -- Bife acebolado: Cheiro-verde
        WHEN ID_Receita = 2 AND ID_Ingrediente = 8 THEN 8  -- Bife acebolado: Azeite
        WHEN ID_Receita = 3 AND ID_Ingrediente = 11 THEN 11  -- Macarrão com molho de tomate: Macarrão
        WHEN ID_Receita = 3 AND ID_Ingrediente = 10 THEN 9 -- Macarrão com molho de tomate: Sal
        WHEN ID_Receita = 3 AND ID_Ingrediente = 9 THEN 10 -- Macarrão com molho de tomate: Pimenta
        WHEN ID_Receita = 3 AND ID_Ingrediente = 5 THEN 5  -- Macarrão com molho de tomate: Tomate
        WHEN ID_Receita = 3 AND ID_Ingrediente = 7 THEN 7  -- Macarrão com molho de tomate: Cheiro-verde
        WHEN ID_Receita = 3 AND ID_Ingrediente = 8 THEN 8  -- Macarrão com molho de tomate: Azeite
    END;

-- Inserção de novos ingredientes para as receitas na tabela Receitas_Ingredientes (caso necessário)
INSERT INTO Receitas_Ingredientes (ID_Receita, ID_Ingrediente, Quantidade)
VALUES
    (1, 1, 500), -- Arroz com feijão: Arroz
    (1, 10, 1),  -- Arroz com feijão: Sal
    (1, 9, 1),   -- Arroz com feijão: Pimenta
    (1, 5, 200), -- Arroz com feijão: Tomate
    (1, 7, 100), -- Arroz com feijão: Cheiro-verde
    (1, 6, 100), -- Arroz com feijão: Pimentão
    (1, 8, 100), -- Arroz com feijão: Azeite
    
    (2, 2, 500), -- Bife acebolado: Carne moída
    (2, 10, 1),  -- Bife acebolado: Sal
    (2, 9, 1),   -- Bife acebolado: Pimenta
    (2, 7, 100), -- Bife acebolado: Cheiro-verde
    (2, 8, 100), -- Bife acebolado: Azeite
    
    (3, 11, 500), -- Macarrão com molho de tomate: Macarrão
    (3, 10, 1),  -- Macarrão com molho de tomate: Sal
    (3, 9, 1),   -- Macarrão com molho de tomate: Pimenta
    (3, 5, 200), -- Macarrão com molho de tomate: Tomate
    (3, 7, 100), -- Macarrão com molho de tomate: Cheiro-verde
    (3, 8, 100); -- Macarrão com molho de tomate: Azeite

    
-- Inserção de dados na tabela LocalDeCompra
INSERT INTO LocalDeCompra (pais, estado, cidade, logradouro, cep)
VALUES 
    ('Brasil', 'Maranhão', 'Imperatriz', 'Av. Getúlio Vargas', '65900-000'),
    ('Brasil', 'São Paulo', 'São Paulo', 'Rua Augusta', '01305-100'),
    ('Brasil', 'Rio de Janeiro', 'Rio de Janeiro', 'Av. Atlântica', '22010-000'),
    ('Brasil', 'Minas Gerais', 'Belo Horizonte', 'Av. Afonso Pena', '30130-007'),
    ('Brasil', 'Paraná', 'Curitiba', 'R. 24 Horas', '80010-030'),
    ('Brasil', 'Bahia', 'Salvador', 'Largo do Pelourinho', '40026-010'),
    ('Brasil', 'Rio Grande do Sul', 'Porto Alegre', 'Mercado Público', '90020-123'),
    ('Brasil', 'Santa Catarina', 'Florianópolis', 'Rua das Palmeiras', '88020-500'),
    ('Brasil', 'Ceará', 'Fortaleza', 'Av. Beira Mar', '60165-121'),
    ('Brasil', 'Pernambuco', 'Recife', 'Rua do Bom Jesus', '50030-000'),
    ('Brasil', 'Amazonas', 'Manaus', 'Boulevard Álvaro Maia', '69005-040'),
    ('Brasil', 'Maranhão', 'Imperatriz', 'Av. Dorgival Pinheiro de Sousa', '65915-100'),
    ('Brasil', 'São Paulo', 'Campinas', 'Rua Barão de Jaguara', '13015-001'),
    ('Brasil', 'Minas Gerais', 'Uberlândia', 'Av. Rondon Pacheco', '38400-328'),
    ('Brasil', 'Bahia', 'Feira de Santana', 'Av. Getúlio Vargas', '44001-288'),
    ('Brasil', 'Paraná', 'Londrina', 'Rua Sergipe', '86010-020');

-- Inserção de dados na tabela ListaDeCompras
INSERT INTO ListaDeCompras (nomeLista, id_usuario, id_receita)
VALUES ('Lista de compras do dia', 1, 1);

-- Alteração para adicionar os ingredientes na coluna Ingredientes da tabela Receitas
UPDATE Receitas r
JOIN (
    SELECT ri.ID_Receita, GROUP_CONCAT(i.Nome SEPARATOR ', ') AS Ingredientes
    FROM Receitas_Ingredientes ri
    JOIN Ingredientes i ON ri.ID_Ingrediente = i.ID
    GROUP BY ri.ID_Receita
) AS sub ON r.ID = sub.ID_Receita
SET r.Ingredientes = sub.Ingredientes;

-- Seleção de dados
SELECT * FROM usuario;
SELECT * FROM receitas;
SELECT * FROM localdecompra;
SELECT * FROM listadecompras;
SELECT * FROM ingredientes;
 
-- Pesquisa com base em palavras-chave,
SELECT * FROM receitas WHERE NomeReceita LIKE '%Arroz%';
SELECT * FROM ingredientes WHERE Nome LIKE '%Arroz%';

-- Retorna receitas que contenham o ingrediente pesquisado pelo usuário.
SELECT r.*
FROM Receitas r
JOIN Receitas_Ingredientes ri ON r.ID = ri.ID_Receita
JOIN Ingredientes i ON ri.ID_Ingrediente = i.ID
WHERE i.Nome = 'Arroz';