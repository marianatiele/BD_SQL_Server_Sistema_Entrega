--- Performace 
-- No XEvent Profile usado para monitorar query
-- 1. Clique na inst�ncia e vai em monitorar atividade 

-- Quantidade de solicita��es;
-- Filtra sess�es de usu�rios (ignora as internas do sistema)
SELECT COUNT(*) AS Total_Requisicoes_Ativas
FROM sys.dm_exec_requests
WHERE session_id > 5;


SELECT * FROM sys.dm_exec_requests;