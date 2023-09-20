CREATE DATABASE speedtest02;
USE speedtest02;
CREATE TABLE Numero(
    ID INT PRIMARY KEY auto_increment,
	numx INT,
    numy INT 
);

insert into numero(numx, numy) Values (1,3);
insert into numero(numx, numy) Values (4,5);
insert into numero(numx, numy) Values (6,5);
insert into numero(numx, numy) Values (10,10);

select * from numero;
