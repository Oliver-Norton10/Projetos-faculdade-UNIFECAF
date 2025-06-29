create database bd_supermercado;
use bd_supermercado;


-- FORNECEDOR
CREATE TABLE fornecedor (
    id_fornecedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL
);

create table telefone_fornecedor (
  id_telefone_fornecedor int not null primary key auto_increment,
  numero varchar (15) not null unique,
  id_fornecedor int not null,
  
  constraint fk_telefone_fornecedor
  foreign key (id_fornecedor)
  references fornecedor (id_fornecedor)
);

create table email_fornecedor (
  id_email_fornecedor int not null primary key auto_increment,
  email varchar (255) not null unique,
  id_fornecedor int not null,
  
  constraint fk_email_fornecedor
  foreign key (id_fornecedor)
  references fornecedor (id_fornecedor)
);

create table endereco_fornecedor (
  id_endereco_fornecedor int not null primary key auto_increment,
  logradouro varchar (45) not null,
  numero_estabelecimento varchar (20) not null,
  bairro varchar (60) not null,
  id_fornecedor int not null,
  
  constraint fk_endereco_fornecedor
  foreign key (id_fornecedor)
  references fornecedor (id_fornecedor)
);

-- PRODUTO
CREATE TABLE produto (
    id_produto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco_compra DECIMAL(10,2) NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    id_fornecedor INT NOT NULL,
    
    constraint fk_produto
    foreign key (id_fornecedor)
    references fornecedor(id_fornecedor)
);

-- CLIENTE
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE
);

-- COLABORADOR
CREATE TABLE colaborador (
    id_colaborador INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    cargo VARCHAR(50),
    data_contratacao DATE
);

-- VENDA
CREATE TABLE venda (
    id_venda INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_colaborador INT NOT NULL,
    
    constraint fk_venda
    FOREIGN KEY (id_cliente) 
    REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_colaborador) 
    REFERENCES colaborador(id_colaborador)
);

-- ITEM_VENDA
CREATE TABLE item_venda (
    id_item_venda INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    
    CONSTRAINT fk_item_venda
    FOREIGN KEY (id_venda) 
    REFERENCES venda(id_venda),
    FOREIGN KEY (id_produto) 
    REFERENCES produto(id_produto)
);

-- INSERSSÃO DE DADOS

-- FORNECEDORES
INSERT INTO fornecedor (nome,
	                    cnpj 
					   ) VALUES (
                        'Fornecedor Aurora', 
                        '12345678000199'), (
                        'Fornecedor União',
                        '98765432000155'
);

-- PRODUTOS
INSERT INTO produto (nome,
                     descricao,
                     preco_compra,
                     preco_venda, 
                     quantidade, 
                     id_fornecedor
					) VALUES (
                     'Açúcar Mascavo',
                     'Pacote 500g',
                      3.50, 
                      5.00, 
                      100, 1), (
					 'Farinha de Trigo',
					 '1kg', 
                      2.00, 
                      3.50, 
                      200,
                      2
);

-- CLIENTES
INSERT INTO cliente (nome, cpf, data_nascimento) VALUES
('João da Silva', '12345678901', '1990-05-15'),
('Maria Souza', '98765432100', '1985-09-30');

-- COLABORADORES
INSERT INTO colaborador (nome, cpf, cargo, data_contratacao) VALUES
('Carlos Mendes', '11122233344', 'Caixa', '2022-01-10'),
('Ana Paula', '55566677788', 'Vendedora', '2023-03-22');

-- VENDAS
INSERT INTO venda (data_venda, id_cliente, id_colaborador) VALUES
('2024-06-25', 1, 1),
('2024-06-26', 2, 2);

-- ITENS DE VENDA
INSERT INTO item_venda (id_venda, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 2, 5.00),
(1, 2, 1, 3.50),
(2, 2, 3, 3.50);

