# 📦 Projeto de Banco de Dados — Sistema de Entrega

Este projeto tem como objetivo construir uma **modelagem de banco de dados relacional eficiente**, normalizada e com **integridade referencial**, aplicando boas práticas de modelagem **conceitual, lógica e física**.

---

## ✅ Requisitos Funcionais

* A empresa vende diversos produtos.
* Cada cliente pode realizar pedidos com um ou mais produtos.
* Cada pedido gera uma entrega, e cada entrega é de responsabilidade de um entregador.
* É necessário registrar:

  * Data do pedido
  * Data de entrega
  * Status da entrega

---

## 📌 Modelagem

Foi criado um **modelo conceitual, lógico e físico** para o banco de dados **SQL Server**, com normalização até a **3ª Forma Normal (3FN)**.

**Entidades principais:**

* Cliente
* Pedido
* Produto
* Entrega
* Entregador

---

## ⚙️ Tecnologias Utilizadas

* **SQL Server**
* **SQL Server Management Studio (SSMS)**
* **BrModelo 3**
* **DBeaver**
* **AWS - RDS**

---

## 🗂️ Etapas do Projeto

### 1️⃣ Modelo Conceitual (DER)

* **Entidades:** Cliente, Produto, Pedido, Entregador, Entrega
* **Relacionamentos:**

  * Cliente faz Pedido (1\:N)
  * Pedido contém Produtos (N\:N)
  * Pedido gera Entrega (1:1)
  * Entregador realiza Entrega (1\:N)

![Modelo Conceitual](https://github.com/user-attachments/assets/59b6072c-0e00-4745-957d-3609c9122951)

---

### 2️⃣ Modelo Lógico

* Conversão do DER para tabelas relacionais
* Definição de **chaves primárias** e **chaves estrangeiras**
* Normalização até a **3FN**

---

### 3️⃣ Modelo Físico

* Criação do script SQL (`Fisico_Sistema_Entrega.sql`) para gerar:

  * Estrutura de tabelas
  * Chaves primárias e estrangeiras
  * Inserts iniciais de dados
  * Views, consultas e triggers

---

## 💾 Política de Backup e Restore

Para garantir a segurança e a integridade dos dados do sistema, foram definidos procedimentos para backup e restauração do banco de dados:

### Backup
*  Criei uma política de backup com 4 backups completos e backups diferenciais diários.

### Restore

---
## Deploy

O banco de dados utilizado neste projeto está hospedado no Amazon RDS (Relational Database Service), utilizando uma instância do SQL Server.
A conexão com o banco foi realizada com sucesso utilizando a ferramenta **DBeaver**, através do endpoint da instância RDS, porta 1433, usuário e senha (essas credenciais não estão incluídas neste repositório por questões de segurança).

# RDS na AWS SQL Server
<img width="1036" height="295" alt="image" src="https://github.com/user-attachments/assets/b45f6bfa-d2b8-43b8-a393-756ae12ef728" />

---
## 🚀 Como Usar
1. Abra o arquivo **`Fisico_Sistema_Entrega.sql`** no **SQL Server Management Studio (SSMS)**.
2. Execute os comandos para:

   * Criar as tabelas
   * Inserir dados de teste
   * Criar views e triggers
3. Teste consultas e validações de integridade referencial.
---
## 📎 Autor

Projeto desenvolvido como parte do portfólio pessoal para prática de **Administração e Engenharia de Banco de Dados**.

