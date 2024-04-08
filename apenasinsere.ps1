Install-Module -Name SqlServer -AllowClobber -Force
# Importando o módulo SqlServer
Import-Module SqlServer

# Parâmetros de conexão ao banco de dados
$SqlServer = "localhost"
$Database = "master"
$TableName = "dbo.tb_cliente"
$Username = "sa"
$Password = "70quasWNl*o#nu4U"

# Construindo a string de conexão
$ConnectionString = "Server=$SqlServer;Database=$Database;User ID=$Username;Password=$Password;"

# Query SQL para inserir dados
$query = "INSERT INTO $TableName (nome, email, telefone) VALUES ('NomeCliente', 'emailcliente@example.com', '123456789')"

# Tentativa de conexão e inserção de dados
try {
    # Estabelecendo a conexão com o banco de dados
    $connection = New-Object System.Data.SqlClient.SqlConnection
    $connection.ConnectionString = $ConnectionString
    $connection.Open()

    # Criando um objeto Command
    $command = $connection.CreateCommand()
    $command.CommandText = $query

    # Executando a query
    $command.ExecuteNonQuery()

    Write-Host "Dados inseridos com sucesso na tabela $($TableName)."
} catch {
    Write-Host "Erro ao inserir dados na tabela $($TableName): $_.Exception.Message"
} finally {
    # Fechando a conexão com o banco de dados
    if ($connection.State -eq 'Open') {
        $connection.Close()
    }
}
