CREATE DATABASE IF NOT EXISTS App_Alimentacao;

USE App_Alimentacao;

-- Foi utilizado o AUTO_INCREMENT para que não haja necessidade de inserção manual do ID. Também foi utilizado o NOT NULL em informações que não podem ser nulas.
CREATE TABLE IF NOT EXISTS Usuario (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Nome VARCHAR(255) NOT NULL, 
    Telefone VARCHAR(15),
    Email VARCHAR(255),
    Localizacao VARCHAR(255),
    Senha VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Ingredientes (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Quantidade DECIMAL(10, 2),
    UnidadeMedida VARCHAR(50),
    Calorias DECIMAL(10, 2),
    Proteinas DECIMAL(10, 2),
    Carboidratos DECIMAL(10, 2),
    Gorduras DECIMAL(10, 2)
);
CREATE TABLE IF NOT EXISTS LocalDeCompra (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Pais VARCHAR(100),
    Estado VARCHAR(100),
    Cidade VARCHAR(100),
    Logradouro VARCHAR(255),
    CEP VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Receitas (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeReceita VARCHAR(255) NOT NULL,
    Descricao TEXT,
    ModoPreparo TEXT,
    Porcoes INT,
    InfoNutricionais TEXT,
    ID_Usuario INT,
    Ingredientes TEXT, -- Nova coluna para lista de ingredientes
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID)
);

CREATE TABLE IF NOT EXISTS ListaDeCompras (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomeLista VARCHAR(255) NOT NULL,
    ID_Usuario INT,
    ID_Receita INT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID),
    FOREIGN KEY (ID_Receita) REFERENCES Receitas(ID)
);

-- Tabela Usuario_Ingredientes para relacionar os ingredientes que cada usuário possui
CREATE TABLE IF NOT EXISTS Usuario_Ingredientes (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT,
    ID_Ingrediente INT,
    Quantidade DECIMAL(10, 2),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID),
    FOREIGN KEY (ID_Ingrediente) REFERENCES Ingredientes(ID)
);

-- Tabela Usuario_Ingredientes para relacionar os ingredientes que cada usuário possui
CREATE TABLE IF NOT EXISTS Receitas_Ingredientes (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Receita INT NOT NULL,
    ID_Ingrediente INT NOT NULL,
    Quantidade DECIMAL(10, 2),
    FOREIGN KEY (ID_Receita) REFERENCES Receitas(ID),
    FOREIGN KEY (ID_Ingrediente) REFERENCES Ingredientes(ID)
);

-- Tabela Usuario_LocalDeCompra para relacionar os locais de compra que cada usuário utiliza
CREATE TABLE IF NOT EXISTS Usuario_LocalDeCompra (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT,
    ID_LocalDeCompra INT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID),
    FOREIGN KEY (ID_LocalDeCompra) REFERENCES LocalDeCompra(ID)
);







