CREATE DATABASE imobiliariacerrado;
/* Lógico_1: */
USE imobiliariacerrado;
CREATE TABLE Usuario_Login (
    ID INT PRIMARY KEY auto_increment,
    CPF INT,
    RG INT,
    Nome VARCHAR (80),
    Data_De_Nascimento DATE,
    Nome_Fantasia VARCHAR (80),
    CNPJ INT,
    Usuario_TIPO INT,
    Email VARCHAR (80),
    Senha VARCHAR (32),
    fk_Nivel_Usuario_ID INT,
    Telefone INT
);

CREATE TABLE Anuncio_Imovel (
    ID INT PRIMARY KEY auto_increment,
    Descricao_Imovel VARCHAR(300),
    Data_Anuncio INT,
    Tipo_De_Contrato INT,
    Valor DECIMAL(10,2),
    Contato_Anunciante INT,
    fk_Usuario_Login_ID INT,
    Qnt_Quarto INT,
    Qnt_Banheiro INT,
    Qnt_Sala INT,
    Qnt_Cozinha INT,
    Tipo_Imovel INT,
    Area_Construida INT,
    Qnt_Vaga_Estacionamento INT,
    Area_Total INT,
    Permite_Pet BOOLEAN,
    Cidade VARCHAR (80),
    NumCasa INT,
    CEP INT,
    Endereco VARCHAR (80), 
    UF VARCHAR (80),
    Rua VARCHAR (80)
);

CREATE TABLE Historico_de_Pesquisa (
    ID INT PRIMARY KEY,
    Data_Acesso DATE,
    fk_Usuario_Login_ID INT,
    Favorito BOOLEAN
);

CREATE TABLE Comentarios (
    ID INT PRIMARY KEY auto_increment,
    Texto_Comentado VARCHAR(300),
    Curtidas INT,
    fk_Anuncio_Imovel_ID INT
);

CREATE TABLE Agenda_De_Visitas (
    ID INT PRIMARY KEY auto_increment,
    Nome_Corretor VARCHAR (80),
    Data DATETIME,
    fk_Anuncio_Imovel_ID INT
);

CREATE TABLE Area_Privativa (
    ID INT PRIMARY KEY auto_increment,
    Nome VARCHAR (80),
    fk_Anuncio_Imovel_ID INT
);

CREATE TABLE Fotos (
    ID INT PRIMARY KEY auto_increment,
    Tipo VARCHAR(10),
    Nome VARCHAR(90),
    Url VARCHAR(90),
    fk_Anuncio_Imovel_ID INT
);

CREATE TABLE Nivel_Usuario (
    ID INT PRIMARY KEY,
    Nivel INT
);

CREATE TABLE Favoritar (
    fk_Anuncio_Imovel_ID INT,
    fk_Historico_de_Pesquisa_ID INT
);
 
ALTER TABLE Usuario_Login ADD CONSTRAINT FK_Usuario_Login_2
    FOREIGN KEY (fk_Nivel_Usuario_ID)
    REFERENCES Nivel_Usuario (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Anuncio_Imovel ADD CONSTRAINT FK_Anuncio_Imovel_2
    FOREIGN KEY (fk_Usuario_Login_ID)
    REFERENCES Usuario_Login (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Historico_de_Pesquisa ADD CONSTRAINT FK_Historico_de_Pesquisa_2
    FOREIGN KEY (fk_Usuario_Login_ID)
    REFERENCES Usuario_Login (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Comentarios ADD CONSTRAINT FK_Comentarios_2
    FOREIGN KEY (fk_Anuncio_Imovel_ID)
    REFERENCES Anuncio_Imovel (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Agenda_De_Visitas ADD CONSTRAINT FK_Agenda_De_Visitas_2
    FOREIGN KEY (fk_Anuncio_Imovel_ID)
    REFERENCES Anuncio_Imovel (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Area_Privativa ADD CONSTRAINT FK_Area_Privativa_2
    FOREIGN KEY (fk_Anuncio_Imovel_ID)
    REFERENCES Anuncio_Imovel (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Fotos ADD CONSTRAINT FK_Fotos_2
    FOREIGN KEY (fk_Anuncio_Imovel_ID)
    REFERENCES Anuncio_Imovel (ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Favoritar ADD CONSTRAINT FK_Favoritar_1
    FOREIGN KEY (fk_Anuncio_Imovel_ID)
    REFERENCES Anuncio_Imovel (ID)
    ON DELETE SET NULL;
 
ALTER TABLE Favoritar ADD CONSTRAINT FK_Favoritar_2
    FOREIGN KEY (fk_Historico_de_Pesquisa_ID)
    REFERENCES Historico_de_Pesquisa (ID)
    ON DELETE SET NULL;