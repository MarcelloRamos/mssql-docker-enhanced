# Install-Module Microsoft.Online.SharePoint.PowerShell -force
# Install-Module -Name SqlServer -AllowClobber -Force
# Importando o módulo SqlServer
Import-Module SqlServer
Install-Module -Name Microsoft.Online.SharePoint.PowerShell -Force

# Defina as credenciais
$username = "micro@eurocolchoes.com"
$password = "Luqu20455!" | ConvertTo-SecureString -AsPlainText -Force
$UserCredential = New-Object System.Management.Automation.PSCredential($username, $password)

# Conecte-se ao SharePoint Online
Connect-PnPOnline -Url "https://eurocolchoes-admin.sharepoint.com" -Credential $UserCredential

 
# Obtenha todos os sites configurados
$sites = Get-SPOSite -Limit All
# Iterar sobre cada site para obter o tamanho ocupado
foreach ($site in $sites) {
    $siteUrl = $site.Url
    $siteSize = $site.StorageUsageCurrent
    $siteSizeGB = [math]::Round($siteSize / 1024, 2)

    Write-Host "Site: $siteUrl"
    Write-Host "Tamanho Ocupado: $siteSize MB"
    Write-Host "Tamanho Ocupado: $siteSizeGB GB"
    Write-Host "-------------------------"
}

# #Verifique se o compartilhamento público está habilitado globalmente
# $publicSharingGlobal = Get-SPOTenant | Select-Object -ExpandProperty SharingCapability

# Write-Host "Compartilhamento Público Global: $publicSharingGlobal"

# #Obtenha todos os sites configurados
# $sites = Get-SPOSite -Limit All

#Iterar sobre cada site para verificar o status de compartilhamento público
# foreach ($site in $sites) {
#    $siteUrl = $site.Url
#     $siteSharing = Get-SPOSite -Identity $siteUrl | Select-Object -ExpandProperty SharingCapability
#     write-host ""
#     write-host ""
#     Write-Host "Site: $siteUrl"
#     write-host "Compartilhamento Público: $siteSharing"
#     write-host ""
#    write-host ""
# }


