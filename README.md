Este repositório contém o projeto de banco de dados para um sistema de Aluguel de Filmes, incluindo a modelagem lógica, scripts de criação de tabelas (DDL) e manipulação de dados (DML).

📊 Objetivo do Projeto
O projeto visa simular o backend de uma locadora, gerenciando o fluxo de inventário, clientes e transações de aluguel. O foco principal foi a aplicação de conceitos de Normalização (1NF, 2NF e 3NF) para garantir a integridade dos dados e evitar redundâncias.

🛠️ Tecnologias Utilizadas
SGBD: MySQL / PostgreSQL (ou o que você utilizou especificamente).

Linguagem: SQL (DDL e DML).

Ferramenta de Modelagem: MySQL Workbench / draw.io (se aplicável).

🗂️ Estrutura do Banco de Dados
A modelagem engloba as seguintes entidades principais:

Filmes: Cadastro de títulos, gêneros, classificações e estoque.

Clientes: Gestão de usuários, contatos e endereços.

Aluguéis: Registro de transações, datas de retirada, devolução e multas.

Atores/Diretores: Relacionamentos N:N para detalhamento das obras.

🔍 Funcionalidades Implementadas
Scripts de Criação: Estrutura completa de tabelas com chaves primárias (PK) e estrangeiras (FK).

Consultas Complexas: Exemplos de JOINs para relatórios de filmes mais alugados e histórico de clientes.

Triggers/Procedures (Opcional): Automação de cálculos de multas ou atualização de status de disponibilidade (se houver no código).

Constraints: Garantia de regras de negócio, como não permitir aluguel para clientes com pendências.
