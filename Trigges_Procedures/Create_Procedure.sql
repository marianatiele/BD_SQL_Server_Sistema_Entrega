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


-- Insere Pedidos 

create procedure insere_pedido 
@cod_pedido integer output,
@itens varchar(50) output,
@total_pedido money output,
@cpf char(11) output 
as 
begin
	insert into pedido (cod_pedido, itens, total_pedido, cpf) 
	values (@cod_pedido, @itens, @total_pedido, @cpf);
end;


-- Insere Entrega

create procedure Faz_entrega 
@cod_entrega integer output,
@avaliacao integer output,
@status varchar(25) output,
@data date output,
@cnh varchar(15) output,
@cod_pedido integer output
as 
begin
	insert into entrega (cod_entrega, avaliacao,status, data, cnh, cod_pedido) 
	values (@cod_entrega, @avaliacao, @status, @data,@cnh, @cod_pedido);
end;
