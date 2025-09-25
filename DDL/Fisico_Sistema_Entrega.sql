use bd_entrega;
-- SQL Server 
/* Lógico_Sistema_Entrega: */

create table Cliente (
    cpf char(11) not null,
    nome varchar(50) not null,
    telefone bigint not null,
	cidade varchar (50) not null,
	rua varchar(50) not null,
	bairro varchar(50) not null,
	num_residencia integer not null,
	primary key (cpf)
);

create table  Produto (
    cod_produto integer not null,
    item varchar(50) not null,
    estoque integer not null,
    preco money not null,
     primary key(cod_produto)
);
create table Pedido (
    cod_pedido integer not null,
    itens varchar (25) not null,
    total_pedido money not null,
    cpf char(11) not null,
	primary key(cod_pedido),
	foreign key (cpf) references Cliente (cpf) 
	on delete cascade on update cascade,
);

create table Possui (
        cod_pedido integer not null,
	cod_produto integer not null,
	quantidade integer not null,
	primary key (cod_pedido, cod_produto),
	foreign key (cod_pedido) references Pedido (cod_pedido)
	on delete cascade on update cascade,

	foreign key (cod_produto) references Produto (cod_produto)
	on delete cascade on update cascade,

);

create table Entregador (
    cnh char(11) not null,
    nome varchar(50) not null,
    telefone bigint not null,
    cidade varchar(50) not null,
    rua varchar(50) not null,
    bairro varchar(50) not null,
    num_residencia integer not null,
    primary key(cnh)
);

create table Entrega (
    cod_entrega integer not null,
    avaliacao varchar(25) not null,
    status varchar (15) not null,
    data date not null,
    cnh char(11) not null,
    cod_pedido integer not null,
	primary key (cod_entrega),

	foreign key (cnh) references Entregador (cnh) 
	on delete cascade on update cascade,
	
	foreign key (cod_pedido) references Pedido (cod_pedido)
	on delete cascade on update cascade
);

-- Create index
create index idx_Entrega_Pedido on entrega (cod_pedido);



select * from Cliente;
select * from Entrega;
select * from Entregador;
select * from Pedido;
select * from Possui;
select * from Produto; 
