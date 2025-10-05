-- Monitoramento de Performace

select * from sys.dm_exec_requests; 


-- O relatório Esperas filtra todas as esperas ociosas e suspensas

select * from  sys.dm_os_wait_stats; 

-- Criar uma consulta gigante para analisar a performace

select c.nome, p.total_pedido 
from cliente c join pedido p on c.cpf = p.cpf;

-- Salvar o Trace em uma table no sql server

--
select * from sys.dm_xe_sessions where name= 'system_health';


SELECT CAST(xet.target_data as xml) AS target_data
FROM sys.dm_xe_session_targets xet
JOIN sys.dm_xe_sessions xe
ON xe.address = xet.event_session_address
WHERE xe.name = 'system_health';

-- Procedimento Armazenado
exec sp_trace_create;





