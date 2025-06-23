# Projeto de Banco de Dados de um Sistema de Entrega 

O objetivo do projeto é construir uma modelagem de banco de dados relacional eficiente, normalizada e com integridade referencial, aplicando boas práticas de modelagem conceitual, lógica e física.




## Requisitos Funcionais 
A empresa vende diversos produtos, seus clientes podem fazer pedidos com um ou mais produto, cada pedido gera uma entrega, cada entregador é responsável por cada entrega.
É necessário saber quando o pedido foi feito, quando foi entregue e o status da entrega.

## Mdelagem
Crei um modelo Conceitual, lógico e físico para o banco de dados SQL Server, apliquei a normalização até a 3FN.
As entidade são:: Cliente, Pedido, Produto, Entrega e Entregador. 

## Tecnologias
- SQL Server
- SQL Server Management Studio (SSMS)
- BrModelo3
- DBreaver

# Etapas do Projeto
## 1. Modelo Conceitual (DER)
Entidades: Cliente, Produto, Pedido, Entregador, Entrega. 
Relacionamentos: Cliente faz Pedido, Pedido contém Produtos, Pedido é Entregue por Entregador.
Grau dos relacionamentos: 1:N, N:N, 1:N, 1:N.

![image](https://github.com/user-attachments/assets/59b6072c-0e00-4745-957d-3609c9122951)


## 2. Modelo Lógico
Transformação do DER para tabelas relacionais
Tabelas com chave primária e estrangeira
Normalização até 3FN

## 🔍 Como usar
Abra o arquivo Fisico_Sistema_Entrega.sql no SQL Server.
Execute os comandos para criar as tabelas e inserção dos dados, consultas, views e trigger. 









