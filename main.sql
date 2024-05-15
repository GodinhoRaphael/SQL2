create table if not exists clientes(
  id INT PRIMARY KEY,
  nome VARCHAR(100)
);

create table if not exists pedidos(
  id INTEGER,
  quantidade INT NOT NULL,
  data_pedido DATE NOT NULL,
  id_cliente INTEGER NOT NULL,
  id_produto INTEGER NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id),
  FOREIGN KEY (id_produto) REFERENCES produtos(id),
  PRIMARY KEY (id_cliente, id_produto, id)
);

create table if not exists produtos(
  id INTEGER PRIMARY KEY,
  nome VARCHAR(100),
  preco NUMERIC(10,2)
);

insert or ignore into produtos(id,nome,preco) values
  (1, 'Laptop' , 999.99),
  (2, 'Mouse' , 19.99),
  (3, 'Teclado' , 49.99),
  (4, 'Monitor' , 199.99);
insert or ignore into clientes(id,nome) values
  (1, 'John Doe'),
  (2, 'Jane Smith'),
  (3, 'Alice Jones');
insert or ignore into pedidos(id,id_cliente,id_produto,quantidade,data_pedido) values
  (1001,1,1,1,'2023-05-14'),
  (1002,2,2,2,'2023-05-15'),
  (1003,1,3,1,'2023-05-16'),
  (1004,3,1,1,'2023-05-17'),
  (1005,2,4,2,'2023-05-18');
  

select clientes.nome,pedidos.quantidade, pedidos.data_pedido, produtos.nome, produtos.preco 
from clientes
join pedidos on clientes.id= pedidos.id_cliente
join produtos on pedidos.id_produto = produtos.id