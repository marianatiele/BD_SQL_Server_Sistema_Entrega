use teste
-- quem comprou e o quê? e valor?
select  c.cpf, c.nome, p.itens, p.total_pedido 
from Cliente c inner join Pedido p on p.cpf = c.cpf;

--Quem fez o pedido o que pediu e como foi a entrega
select  c.cpf, c.nome, p.itens, p.total_pedido, e.avaliacao, e.status, e.data 
from Cliente c inner join Pedido p on p.cpf = c.cpf 
inner join Entrega e on p.cod_pedido = e.cod_pedido;

--Quem fez a entrega e o que o cliente pediu
select c.nome, p.itens, p.total_pedido, e.status, e.data, en.nome
from Cliente c inner join Pedido p on p.cpf = c.cpf inner join Entrega e on p.cod_pedido = e.cod_pedido
inner join Entregador en on en.cnh = e.cnh;


--Quantidade item e valor
select pss.quantidade, p.item, p.preco
from Possui pss inner join Produto p on pss.cod_produto = p.cod_produto;



-- View 
-- Pedido do cliente com avaliação, item e valor total
create view vw_pedido_cliente_ava_entrega 
as select c.nome, p.itens, p.total_pedido, e.avaliacao, e.status 
from Cliente c inner join Pedido p on p.cpf = c.cpf
inner join Entrega e on e.cod_pedido = p.cod_pedido;


select * from vw_pedido_cliente_ava_entrega;


-- View Criptografada 

create view vw_entregador_avaliacao with encryption 
as 
select e.nome as entregador, en.avaliacao as nota, en.status
from Entregador e inner join Entrega en 
on en.cnh = e.cnh;


select * from vw_entregador_avaliacao;
