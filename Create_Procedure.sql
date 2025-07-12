-- Create Procedure 
-- Retorna os registros de clientes e pedidos em que a nota de avaliação da entrega seja maior ou igual ao valor definido como parâmetro de entrada na procedure.

create procedure Pedidos_avaliacao
@avaliacao integer output
as
select  c.nome, p.itens,e.avaliacao
from Cliente c inner join Pedido p on p.cpf = c.cpf 
inner join Entrega e on p.cod_pedido = e.cod_pedido
where e.avaliacao >= @avaliacao;

-- Executando o procedimento para avaliação 5
exec Pedidos_avaliacao 5

-- Para avaliação maior o igual a 3
exec Pedidos_avaliacao 3
