create database livraria; 
 
use livraria; 
 
CREATE TABLE cliente ( 
    id_cliente int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome varchar(100) NOT NULL, 
    telefone int(13) default null,
    nome_autor_livro_comprado varchar(100) not null
);  
 
 CREATE TABLE editora( 
    id_editora int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,  
    nome varchar(100) NOT NULL, 
    telefone int(13) DEFAULT NULL
); 
  
CREATE TABLE livro ( 
    ISBN  int(13) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    titulo varchar(100) NOT NULL, 
    preco float not null, 
    qtd_livro int(11) DEFAULT '0', 
    autor varchar(100) default null, 
    genero varchar(100) default null,
    id_editora int not null
    
); 
 
CREATE TABLE estoque ( 
    qtd int(11) default '0', 
    ISBN int not null 
); 
 
CREATE TABLE venda ( 
    nota_fiscal int(10) NOT NULL PRIMARY KEY, 
    ano_venda int(4) not null, 
    mes_venda varchar(20) not null,
    total int(11) DEFAULT '0', 
    id_cliente int not null 
);  
  
 
CREATE TABLE livros_vendidos ( 
    nota_fiscal int not null, 
    id_cliente int not null,
    ISBN int not null,
    total int(4) not null
    ); 


    ALTER TABLE livro 
ADD FOREIGN KEY (id_editora) 
    REFERENCES editora(id_editora); 
     
     ALTER TABLE estoque 
ADD FOREIGN KEY (ISBN) 
    REFERENCES livro(ISBN);  
     
     ALTER TABLE venda 
ADD FOREIGN KEY (id_cliente) 
    REFERENCES cliente(id_cliente);  
     
    ALTER TABLE livros_vendidos 
ADD FOREIGN KEY (nota_fiscal) 
    REFERENCES venda(nota_fiscal);
    
    ALTER TABLE livros_vendidos 
ADD FOREIGN KEY (id_cliente) 
    REFERENCES cliente(id_cliente);
     
    ALTER TABLE livros_vendidos 
ADD FOREIGN KEY (ISBN) 
    REFERENCES livro(ISBN); 
     
     
    desc editora; 
    desc cliente; 
    desc livro; 
    desc estoque; 
    desc venda; 
    desc livros_vendidos; 
     
     
insert  into editora values 
(1,'Bloomsbury Publishing Plc',NULL),    
(2,'Scholastic Corporation',NULL),    
(3,'Viking Press',NULL),
(4,'Glénat', NULL);
  
  select * from editora;
  
insert into  cliente values  
(1,'Eduarda Thayse',null,'Stephen King'),    
(2,'Rafaela Ribeiro',null,'Stephen King'),     
(3,'Pedro Aguiar',null,'J. K. Rowling'),     
(4,'Elaine Luciana',null,'Cecelia Ahern'),  
(5,'Antonio Pereira',null,'J. K. Rowling');

  select * from cliente;
     
insert  into livro values
(1,'Harry Potter e as Reliquias da Morte','36.90', '10','J. K. Rowling','Fantasia','1'),
(2,'It','48.90','6','Stephen King','Terror','3'), 
(3,'O iluminado','31.90','3','Stephen King','Romance','3'),
(4, 'o extraordinário', '20.90','6','R. J. Palacio','Drama','2'),
(5,'Rápido e Devagar - Duas Formas de Pensar','43.9','8','Daniel Kahneman','Não ficção','2'),    
(6,'P.s. - Eu Te Amo ','23.5','3',' Cecelia Ahern','Romance','2'),
(7,'Azul é a cor mais quente','43.12','4','Julie Maroh','Romance','4');

select * from livro;
    
insert into estoque values 
(10,1),
(6,2),
(3,3),
(6,4),
('',5),
(8,6),
(4, 7);
    
    select * from estoque;
    

insert into venda values
(111111,'2017','Outubro',2,1),
(222222,'2017','Outubro',2,2),
(333333,'2017','Dezembro',2,3),
(444444,'2017','Outubro',2,4),
(555555,'2017','Junho',2,5);
     
     select * from venda;
 
insert into livros_vendidos values 
(111111,1,2,2), 
(222222,2,2,4), 
(333333,3,1,1), 
(444444,4,6,5), 
(555555,5,1,3);
 
 select * from livros_vendidos; 
 
 
 

/*4 PERGUNTAS PARA O PROJETO  (FEITAS PELO PROFESSOR)

/* Selecione todos os clientes que compraram o livro de Stephen King.*/
 select nome
 from cliente
 where nome_autor_livro_comprado = 'Stephen King';
 
 select * from estoque;

 /* Selecione o nome do livro que possui estoque maior do que 5. */
 select ISBN, titulo
 from livro
 where qtd_livro > 5;
 
 

 /* Selecione o total das vendas do mês de outubro.  */
 select sum(total), mes_venda
 from venda
 where mes_venda = 'Outubro';
 


 /* Selecione o livro que possui o maior preço. */
 select max(preco), titulo
 from livro;
