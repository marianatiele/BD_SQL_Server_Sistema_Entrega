-- Implementando a Politica de Backup
-- Criando uma tabela para monitorar o backup
--drop table controle_backups;

create table controle_backups 
(
	id integer, 
	nome varchar(100), 
	entrega integer
);

select * from controle_backups;

-- 1 DA MANHA - FULL (DATABASE WITH INT)
BACKUP DATABASE teste TO 
DISK = 'E:\Documentos\DBA_SQL_SERVER\Backup_Agendado\POLITICA_BACKUP_20250716.BAK' WITH INIT;

-- Add na tabela o Primeiro Backup
DECLARE @NUM_ENTREGAS INTEGER;
SELECT @NUM_ENTREGAS = COUNT(*) FROM entrega; 
INSERT INTO controle_backups VALUES (1, 'BACKUP FULL 1 AM',@NUM_ENTREGAS);
SELECT * FROM controle_backups;



-- 6 DA MANHÃ - INCREMENTAL (LOG WITH NOINT)
--Insere Pedidos
exec insere_pedido @cod_pedido =  109, @itens='Caruru', @total_pedido = 15, @cpf = '12345678901';
exec insere_pedido @cod_pedido =  110, @itens='Acarajé', @total_pedido = 25, @cpf = '10928374650';
exec insere_pedido @cod_pedido =  111, @itens='Peixe', @total_pedido = 15, @cpf = '39172648100';

--Insere entrega

exec Faz_entrega @cod_entrega = 209, @avaliacao = 5, @status ='Entregue', @data = '2025-06-15', @cnh = '10398764521', @cod_pedido = 109;

exec Faz_entrega @cod_entrega = 210, @avaliacao = 4, @status ='Em andamento', @data = '2025-06-25', @cnh = '36985214700', @cod_pedido = 110;

exec Faz_entrega @cod_entrega = 211, @avaliacao = 3, @status ='Entregue', @data = '2025-06-26', @cnh = '21584973610', @cod_pedido = 111;


--Fazendo o Backup Incremental

BACKUP LOG  teste 
TO DISK = 'E:\Documentos\DBA_SQL_SERVER\Backup_Agendado\POLITICA_BACKUP_20250716.BAK' WITH NOINIT;

--Insere na tabela
DECLARE @NUM_ENTREGAS INTEGER;
SELECT @NUM_ENTREGAS = COUNT(*) FROM entrega; 
INSERT INTO controle_backups VALUES (2, '6 DA MANHÃ - INCREMENTAL',@NUM_ENTREGAS);
SELECT * FROM controle_backups;



-- 12 DA MANHÃ - FULL (DATABASE WITH DIFFERENTIAL)

--Insere Pedido
exec insere_pedido @cod_pedido =  112, @itens='Acarajé', @total_pedido = 25, @cpf = '39172648100';
--Insere entrega
exec Faz_entrega @cod_entrega = 212, @avaliacao = 2, @status ='Em andamento', @data = '2025-06-16', @cnh = '10398764521', @cod_pedido = 112;


--Faz o Backup Diferencial
BACKUP DATABASE teste TO 
DISK = 'E:\Documentos\DBA_SQL_SERVER\Backup_Agendado\POLITICA_BACKUP_20250716.BAK' WITH DIFFERENTIAL;

DECLARE @NUM_ENTREGAS INTEGER;
SELECT @NUM_ENTREGAS = COUNT(*) FROM entrega; 
INSERT INTO controle_backups VALUES (3, '12 DA AMANHÃ BACKUP FULL DIFFERENTIAL',@NUM_ENTREGAS);
SELECT * FROM controle_backups;


-- 9 DA NOITE - INCREMENTAL (LOG WITH NOINT)
BACKUP LOG  teste 
TO DISK = 'E:\Documentos\DBA_SQL_SERVER\Backup_Agendado\POLITICA_BACKUP_20250716.BAK' WITH NOINIT;
-- Insere na tabela
DECLARE @NUM_ENTREGAS INTEGER;
SELECT @NUM_ENTREGAS = COUNT(*) FROM entrega; 
INSERT INTO controle_backups VALUES (4, '9 DA NOITE - INCREMENTAL ',@NUM_ENTREGAS);
SELECT * FROM controle_backups;








