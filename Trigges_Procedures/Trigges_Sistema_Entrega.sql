-- Quando fizer um pedido diminuir a quantidade do estoque 
--drop trigger novo_pedido_baixa_estoque;

create trigger novo_pedido_baixa_estoque
on Possui for insert
as
	begin 
	update produto set estoque = estoque - (select p.quantidade from possui p 
		inner join produto pd on pd.cod_produto = p.cod_produto
		where pd.cod_produto = (select cod_produto from inserted)) 
		where produto.cod_produto = (select cod_produto from inserted); 
	if @@rowcount = 0
		rollback transaction
	end;


 





