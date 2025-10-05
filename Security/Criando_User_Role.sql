-- Usuários/ logins  com base no master ou em bancos
use bd_entrega;
-- user != login 
-- Tem regras de segurança para login e outras regras para usuário

create login use_teste with password = 'teste@123'; 
create user use_teste for login use_teste; 

-- ler tabela da permisão ao usuário 
exec sp_addrolemember 'db_datareader', 'use_teste'

-- criar base de dados da permisão ao login 



--- Caso quira apagar / se tiver logado não consigo apagar /
-- se tem banco não apaga o user alterar propietário
drop login use_teste;

drop user use_teste; 

-- Informação de todos os usuários logados
select * from master.sys.sql_logins;


-- Logados nos ultimas data e hora
select name, LOGINPROPERTY(name, 'PasswordLastSetTime') from master.sys.sql_logins;

-- DBA tem como vê a senha do user? Criptografada?
select name, password_hash from master.sys.sql_logins;

-- Criando user com senha e login iguais
create login teste with password = 'teste'; 


-- Se algum usuário tem a senha igual ao nome
select name from master.sys.sql_logins 
	where PWDCOMPARE(name, password_hash)= 1;



-- Dando permissão ao user criado 
alter server role dbcreator add member use_teste;
 
-- Retirando as permissões 
alter server role dbcreator drop member use_teste;


-- Vendo as regras que pode add ao menbro do role
select * from sys.server_principals where is_fixed_role = 1;

-- A consulta a seguir lista as permissões concedidas ou negadas explicitamente a 
-- entidades de segurança do servidor.
SELECT pr.principal_id, pr.name, pr.type_desc,   
    pe.state_desc, pe.permission_name   
FROM sys.server_principals AS pr   
JOIN sys.server_permissions AS pe   
    ON pe.grantee_principal_id = pr.principal_id;

