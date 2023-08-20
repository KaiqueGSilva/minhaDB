------------------------------------------

-- COMO STARTAR ESSA MERDA --

-- TENHA A MERDA DO XAMPP FUNCIONANDO COM O APACHE E O MYSQL VERDE --

-- ABRA O CMD E EXECUTE ESSE COMANDO "cd C:\xampp\mysql\bin"

-- STARTA O SERVIDOR "mysql -u root" SE CASO QUISER STARTAR DIRETO SEM PEDIR SENHA "mysql -u root -p"

-- LEMBRANDO QUE O SEU XAMPP VC TEM QUE SABER A SENHA, CASO QUEIRA REDEFINIR (CASO VC NÃO FAÇA A MINIMA DE QUAL É A SENHA) USA ESSE COMANDO ABAIXO

-- UPDATE mysql.user SET Password=PASSWORD('') WHERE User='root';ByeCtrl-C -- exit!

-- PRESSIONE ENTER E FORTE ABRAÇO

-- DEPOIS USA O COMANDO "source D:\scripts\db_projeto.sql" OBVIAMENTE SUBSTITUA O QUE TÁ DENTRO PELO CAMINHO DO ARQUIVO NO QUAL VC SALVOU

-- PRESSIONE ENTER E SEJA FELIZ !!!

------------------------------------------

-- apagar o banco de dados

drop database db_projeto;

-- criar o banco de dados dbpets

create database db_projeto;

-- visualizar o banco de dados

show databases;

-- acessando o banco de dados dbpets

use db_projeto;

-- visualizando as tabelas do banco de dados

show tables;

-- criando as tabelas do banco de dados

--- FUNCIONARIOS
--- USUARIOS
--- CLIENTES
--- PRODUTOS

create table tbFuncionarios(
codFunc int not null auto_increment,
nomeFunc varchar(50) not null,
cpfFunc char(14) not null unique,
sexoFunc char(1) default 'F' check(sexoFunc in('F','M')),
salario decimal(9,2) default 0.0 check(salario >=0.0),
logradouro varchar(100) not null,
numero varchar(10) not null,
cep char(9) not null unique,
bairro varchar(100) not null,
cidade varchar(100) not null,
estado char(2) not null,
telFunc char(13) not null unique,
primary key(codFunc)
);

create table tbUsuarios(
codUsu int not null auto_increment,
codFunc int not null,
nomeUsu varchar(50) not null,
emailUsu varchar(100) not null unique,
senhaUsu varchar(100) not null,
telUsu varchar(14) not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc)
);

create table tbClientes(
codCli int not null auto_increment,
codUsu int not null,
nomeCli varchar(50) not null,
emailCli varchar(100) not null unique,
senhaCli varchar(100) not null,
telCli char(13) not null unique,
primary key(codCli),
foreign key(codUsu)references tbUsuarios(codUsu)
);

create table tbProdutos(
codProd int not null auto_increment,
codCli int not null,
nomeProd varchar(50) not null,
filtroProd varchar(50) not null,
descricaoProd varchar(255) not null,
nomeImagem varchar(25) not null,
tamanhoImagem varchar(25) not null,
tipoImagem varchar(25) not null,
imagem longblob not null,
primary key(codProd),
foreign key(codCli)references tbClientes(codCli)
);

-- CRUD (Insert, select, update e delete)

-- INSERT

insert into tbFuncionarios(nomeFunc,cpfFunc,sexoFunc,salario,logradouro,numero,cep,bairro,cidade,estado,telFunc)	
	values('Maik','123.456.789-42','F',1500.00,'Av. Sao Jose',20,'01234-567','JD. Capela','Sao Paulo','SP','(11)1234-5678');

insert into tbUsuarios(codFunc,nomeUsu,emailUsu,senhaUsu,telUsu)
	values(1,'?','?','?','?');

insert into tbClientes(codUsu,nomeCli,emailCli,senhaCli,telCli)
	values(1,'?','?','?','?');

insert into tbProdutos(codCli,nomeProd,filtroProd,descricaoProd,nomeImagem,tamanhoImagem,tipoImagem,imagem)
	values(1,'?','?','?','?','?','?','?');


-- BUSCA

select nomeFunc from tbFuncionarios where nomeFunc = 'Maik';
select nomeUsu from tbUsuarios where nomeUsu = '?';
select nomeCli from tbClientes where nomeCli = '?';
select nomeImagem from tbProdutos where nomeImagem = '?';

-- UPDATES

update tbFuncionarios set nomeFunc = 'Maik', sexoFunc = 'M' where codFunc = 1;
update tbUsuarios set nomeUsu = '?', emailUsu = '?' where codUsu = 1;
update tbClientes set nomeCli = 'Luis', emailCli = 'luis123@gmail.com' where codCli = 1;
update tbProdutos set nomeProd = '?', nomeProd = '?' where codProd = 1;


select * from tbFuncionarios;
select * from tbUsuarios;
select * from tbClientes;
select * from tbProdutos;

desc tbFuncionarios;
desc tbUsuarios;
desc tbClientes;
desc tbProdutos;

