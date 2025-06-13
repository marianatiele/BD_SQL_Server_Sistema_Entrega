use teste;
-- SQL Server 
/* Lógico_Sistema_Entrega: */

create table Cliente (
    cpf varchar(11),
    nome varchar(50),
    telefone bigint,
    cidade varchar (50),
    rua varchar(50),
    bairro varchar(50),
    num_residencia integer,
	primary key (cpf)
);

create table  Produto (
    cod_produto integer,
    item varchar(50),
    estoque integer,
    preco money,
	primary key(cod_produto)
);
create table Pedido (
    cod_pedido integer,
    itens varchar (25),
    total_pedido money,
    cpf varchar(11),
    primary key(cod_pedido),
    foreign key (cpf) references Cliente (cpf) 
    on delete cascade on update cascade,
);

create table Possui (
    	cod_pedido integer,
	cod_produto integer,
	quantidade integer,
	foreign key (cod_pedido) references Pedido (cod_pedido)
	on delete cascade on update cascade,

	foreign key (cod_produto) references Produto (cod_produto)
	on delete cascade on update cascade,

);

create table Entregador (
    cnh varchar(11),
    nome varchar(50),
    telefone bigint,
    cidade varchar(50),
    rua varchar(50),
    bairro varchar(50),
    num_residencia integer,
	primary key(cnh)
);

create table Entrega (
    cod_entrega integer,
    avaliacao varchar(25),
    status varchar (15),
    data date,
    cnh varchar(11),
    cod_pedido integer,
    primary key (cod_entrega),

    foreign key (cnh) references Entregador (cnh) 
     on delete cascade on update cascade,
	
    foreign key (cod_pedido) references Pedido (cod_pedido)
	on delete cascade on update cascade
);


