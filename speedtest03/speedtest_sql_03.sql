/*ddl : CREATE - Criar . ALTER - alterar . DROP - derrubar */
CREATE DATABASE bardodba
default character set utf8
default collate utf8_general_ci;
USE bardodba; /*Seleciona o bar*/

CREATE TABLE Garcom (
    Id INT PRIMARY KEY auto_increment,
    Nome Varchar(50)
);

CREATE TABLE Mesa (
    ID INT PRIMARY KEY auto_increment,
    Numero VARCHAR(3)
);

CREATE TABLE Comanda (
    Valor DECIMAL(6,2),
    Fechada BOOLEAN,
    Observacao TEXT,
    Estrela INT,
    ID INT PRIMARY KEY auto_increment,
    fk_Garcom_Id INT,
    fk_Mesa_ID INT
);
 
/*ALter Table - altera a tabela*/
/*Constraint - limitações (regras)*/
/*Adicionar uma constraint: foreing key (Chave estrangeira)*/
/*fk_comanda_2 - nome da constraint*/
/*fk_garcom_id - campo da tabela comanda*/
/*On delete cascade - deletar em cascata*/
ALTER TABLE Comanda ADD CONSTRAINT FK_Comanda_2
    FOREIGN KEY (fk_Garcom_Id)
    REFERENCES Garcom (Id)
    ON DELETE CASCADE;
 
/*ALter Table - altera a tabela*/
/*Constraint - limitações (regras)*/
/*Adicionar uma constraint: foreing key (Chave estrangeira)*/
/*fk_comanda_3 - nome da constraint*/
/*fk_mesa_id - campo da tabela comanda*/
/*On delete cascade - deletar em cascata*/
ALTER TABLE Comanda ADD CONSTRAINT FK_Comanda_3
    FOREIGN KEY (fk_Mesa_ID)
    REFERENCES Mesa (ID)
    ON DELETE CASCADE;
 
 select * from comanda;
 select * from garcom;
 select * from mesa;
 
/*Administração de dados*/
SELECT * FROM bardodba.garcom; /*Seleciona tabela*/
Insert into garcom(nome) values ('Romero Brito');
Insert into garcom(nome) values ('Oswaldo Ramalho');
Insert into garcom(nome) values ('Sidney Magal');
DELETE FROM `bardodba`.`garcom` WHERE (`Id` = 'n'); /*n= número id*/

SELECT * FROM bardodba.mesa; /*Seleciona tabela*/
/*DELETE FROM `bardodba`.`mesa` WHERE (`ID` = 'n'); n= número id*/
TRUNCATE table bardodba.mesa; /*Exclui os dados e zera a contagem de id's*/

/*Cinco fileiras: A,B,C,D,E*/
/*Em cada fileira existe 9 mesas*/
CALL inserir_numeros_coluna_A();
CALL inserir_valores_na_coluna_B();
CALL inserir_valores_na_coluna_C();
CALL inserir_valores_na_coluna_D();
CALL inserir_valores_na_coluna_E();

DELIMITER //   
create procedure inserir_numeros_coluna_A()
BEGIN
	DECLARE i INT DEFAULT 1;
    WHILE i < 10 do
		INSERT INTO mesa (numero) VALUES (CONCAT('A',i));
        SET i = i + 1;
	END WHILE;
END;
//
DELIMITER //
CALL inserir_valores_na_coluna_B();
DELIMITER //
CREATE PROCEDURE inserir_valores_na_coluna_B()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i < 10 DO
        INSERT INTO mesa (numero) VALUES (CONCAT('B', i));
        SET i = i + 1;
    END WHILE;
END;
//
DELIMITER //
CREATE PROCEDURE inserir_valores_na_coluna_C()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i < 10 DO
        INSERT INTO mesa (numero) VALUES (CONCAT('C', i));
        SET i = i + 1;
    END WHILE;
END;
//
 DELIMITER //
CREATE PROCEDURE inserir_valores_na_coluna_D()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i < 10 DO
        INSERT INTO mesa (numero) VALUES (CONCAT('D', i));
        SET i = i + 1;
    END WHILE;
END;
//
DELIMITER //
CREATE PROCEDURE inserir_valores_na_coluna_E()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i < 10 DO
        INSERT INTO mesa (numero) VALUES (CONCAT('E', i));
        SET i = i + 1;
    END WHILE;
END;
//

SELECT COUNT(numero) FROM mesa;
DELETE FROM `bardodba`.`mesa` WHERE (`ID` = '');

select * from comanda;

INSERT INTO comanda(valor,fechada,estrela,fk_garcom_id,fk_mesa_id)
	values(999.99,false,2,3,1);
INSERT INTO comanda(valor,fechada,estrela,fk_garcom_id,fk_mesa_id)
	values(2.50,true,5,1,2);
INSERT INTO comanda(valor,fechada,estrela,fk_garcom_id,fk_mesa_id)
	values(17.99,true,4,2,34);
INSERT INTO comanda(valor,fechada,estrela,fk_garcom_id,fk_mesa_id)
	values(100.00,true,1,5,45);
INSERT INTO comanda(valor,fechada,estrela,fk_garcom_id,fk_mesa_id)
	values(30.00,false,5,2,13);