GO
USE master
GO
CREATE TABLE tb_sharepoint_sites (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    site VARCHAR(90),
    title VARCHAR(50),
    storeger VARCHAR(50),
    sharing VARCHAR(50),
    language VARCHAR(50),
    url VARCHAR(100),
    id_tenant VARCHAR(50), -- Coluna para a chave estrangeira
    FOREIGN KEY (id_tenant) REFERENCES dbo.tb.tenant (id_tenant)
)
USE master
GO
CREATE TABLE tb_user (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(50),
    inactive int,
)

USE master
GO
CREATE TABLE tb_tenant (
    id_tenant VARCHAR(80) PRIMARY KEY IDENTITY(1,1),
    tenant VARCHAR(50),
    url_share VARCHAR(100),
    usuario VARCHAR(80),
    senha VARCHAR(50),
    active INT
);

USE master
GO
CREATE TABLE tb_sharepoint_sites (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    site VARCHAR(90),
    title VARCHAR(50),
    storeger VARCHAR(50),
    sharing VARCHAR(50),
    ishub boolean,
    hubsiteid VARCHAR(50),
    languagecod int,
    language VARCHAR(50),
    siteCostumizePages boolean,
    url VARCHAR(100),
    id_tenant VARCHAR(80), -- Coluna para a chave estrangeira
    FOREIGN KEY (id_tenant) REFERENCES dbo.tb_tenant (id_tenant)
)
