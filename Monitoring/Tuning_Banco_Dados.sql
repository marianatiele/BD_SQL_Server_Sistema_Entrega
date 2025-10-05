--- Performace 
-- No XEvent Profile usado para monitorar query
-- 1. Clique na instância e vai em monitorar atividade 

-- Quantidade de solicitações;
-- Filtra sessões de usuários (ignora as internas do sistema)
SELECT COUNT(*) AS Total_Requisicoes_Ativas
FROM sys.dm_exec_requests
WHERE session_id > 5;


SELECT * FROM sys.dm_exec_requests;