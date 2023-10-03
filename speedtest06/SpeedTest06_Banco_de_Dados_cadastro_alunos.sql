Create Database cadastroescola;
Use cadastroescola;

CREATE TABLE Aluno (
    Id INT PRIMARY KEY auto_increment,
    Ano_Inicio YEAR,
    Nome VARCHAR(60) not null,
    Semestre_Inicio ENUM('1 Semestre','2 Semestre') not null
);

CREATE TABLE Sala (
    Id_ INT PRIMARY KEY,
    Localizacao NCHAR(3) not null unique,
    Materia VARCHAR(30) not null 
);

CREATE TABLE Professor (
    Id_ INT PRIMARY KEY,
    Nome VARCHAR(60) not null,
    Unidade_Trabalho ENUM('Taguatinga', 'Ceilandia') not null
);

CREATE TABLE Estudar (
    fk_Sala_Id_ INT,
    fk_Aluno_Id INT
);

CREATE TABLE Lecionar (
    fk_Sala_Id_ INT,
    fk_Professor_Id_ INT
);
 
ALTER TABLE Estudar ADD CONSTRAINT FK_Estudar_1
    FOREIGN KEY (fk_Sala_Id_)
    REFERENCES Sala (Id_)
    ON DELETE RESTRICT;
 
ALTER TABLE Estudar ADD CONSTRAINT FK_Estudar_2
    FOREIGN KEY (fk_Aluno_Id)
    REFERENCES Aluno (Id)
    ON DELETE SET NULL;
 
ALTER TABLE Lecionar ADD CONSTRAINT FK_Lecionar_1
    FOREIGN KEY (fk_Sala_Id_)
    REFERENCES Sala (Id_)
    ON DELETE RESTRICT;
 
ALTER TABLE Lecionar ADD CONSTRAINT FK_Lecionar_2
    FOREIGN KEY (fk_Professor_Id_)
    REFERENCES Professor (Id_)
    ON DELETE RESTRICT;
    