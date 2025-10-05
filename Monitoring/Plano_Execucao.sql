-- Executar consulta


select c.cpf, c.nome, c.telefone, p.itens, p.total_pedido
from cliente c join pedido p on p.cpf = c.cpf;


-- Plano de Execução desta consulta
