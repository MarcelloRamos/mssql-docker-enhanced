USE master;
GO

IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'MeuBancoDeDados'
)
CREATE DATABASE MeuBancoDeDados;
GO