-- Monitoramento de Performace

select * from sys.dm_exec_requests; 


-- O relat�rio Esperas filtra todas as esperas ociosas e suspensas

select * from  sys.dm_os_wait_stats; 