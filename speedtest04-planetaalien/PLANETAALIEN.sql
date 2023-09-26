CREATE DATABASE planetaalien;
USE planetaalien;

CREATE TABLE Usuario (
    id int PRIMARY KEY auto_increment,
    nome varchar(70) null,
    apelido varchar(70) not null,
    email varchar(80) not null,
    senha nchar(8) not null
);
show tables; 
describe usuario;

insert into usuario (id,nome, apelido, email, senha) 
values
(default,'Tatiene','Taty','tatiene@gmail.com','12345678'),
(default,'Rômulo Cersar','Jogador-Da-Cei','jogão@gmail.com','34567898'),
(default,'Jorge','Jorgimplay','jorge1983@gmail.com','41850747'),
(default,'Sérgio','Serjão','marombafoguetes@gmail.com','90204064'),
(default,'Roberta','R0mer0Brit0','bet100@gmail.com','96023059'),
(default,'Juliana','JuJu','xuliana_13@gmail.com','93196512'),
(default,'Paulo Muzy','FakeNaty','basebollbat@gmail.com','27393601'),
(default,'Júnior','Xaméx','Júlio_70974@gmail.com','93906044'),
(default, null,'Angel of The Night','angelofthenight@gmail.com','76584115'),
(default, 'José','Joker Indiano','coringaokkk@gmail.com','13826190'),
(default, 'Lucas','TerrorDoOver','fuibanidodenovo@gmail.com','61112233');
select * from usuario;
select apelido from usuario;
select apelido, senha from usuario;

Update usuario Set apelido = 'Taty_Games' where id = 1; 
/*Sem o where, TODOS os usuários iriam ter seus apelidos modificados para Taty_Games*/
Delete from usuario where id='2'; 
/*comando para deletar um usuário (n=numero id): Delete from usuario where id='n';*/
Update usuario set nome = Zé where id = 10;
/*Atualizando nome de usuário com uma condição*/
delete from usuario where id > 4 and id < 7;
