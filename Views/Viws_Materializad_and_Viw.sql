use teste;
go
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
