-- Usu�rios/ logins  com base no master ou em bancos
use bd_entrega;
-- user != login 
-- Tem regras de seguran�a para login e outras regras para usu�rio

create login use_teste with password = 'teste@123'; 
create user use_teste for login use_teste; 

-- ler tabela da permis�o ao usu�rio 
exec sp_addrolemember 'db_datareader', 'use_teste'

-- criar base de dados da permis�o ao login 



--- Caso quira apagar / se tiver logado n�o consigo apagar /
-- se tem banco n�o apaga o user alterar propiet�rio
drop login use_teste;

drop user use_teste; 

-- Informa��o de todos os usu�rios logados
select * from master.sys.sql_logins;


-- Logados nos ultimas data e hora
select name, LOGINPROPERTY(name, 'PasswordLastSetTime') from master.sys.sql_logins;

-- DBA tem como v� a senha do user? Criptografada?
select name, password_hash from master.sys.sql_logins;

-- Criando user com senha e login iguais
create login teste with password = 'teste'; 


-- Se algum usu�rio tem a senha igual ao nome
select name from master.sys.sql_logins 
	where PWDCOMPARE(name, password_hash)= 1;



-- Dando permiss�o ao user criado 
alter server role dbcreator add member use_teste;
 
-- Retirando as permiss�es 
alter server role dbcreator drop member use_teste;


-- Vendo as regras que pode add ao menbro do role
select * from sys.server_principals where is_fixed_role = 1;

-- A consulta a seguir lista as permiss�es concedidas ou negadas explicitamente a 
-- entidades de seguran�a do servidor.
SELECT pr.principal_id, pr.name, pr.type_desc,   
    pe.state_desc, pe.permission_name   
FROM sys.server_principals AS pr   
JOIN sys.server_permissions AS pe   
    ON pe.grantee_principal_id = pr.principal_id;

