--Usuário sem permisão
--Permissão CREATE DATABASE negada no banco de dados 'master'.
create database teste; 

-- Precisa de permissão
create table tb_teste(id int, name char(15));


use bd_entrega;
select * from produtos;
