# Alterar a política de execução temporariamente
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# Verificar se o módulo PSWindowsUpdate está instalado
if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
    # Instalar o módulo PSWindowsUpdate
    Install-Module -Name PSWindowsUpdate -Force -SkipPublisherCheck
}

# Importar o módulo PSWindowsUpdate
Import-Module PSWindowsUpdate

# Verificar atualizações pendentes
$updates = Get-WindowsUpdate

# Exibir as atualizações pendentes
if ($updates) {
    $updates | ForEach-Object {
        Write-Output "Título: $($_.Title)"
        Write-Output "Descrição: $($_.Description)"
        Write-Output "KB: $($_.KBArticleIDs)"
        Write-Output "Data de Lançamento: $($_.LastDeploymentChangeTime)"
        Write-Output "----------------------------------"
    }

    # Instalar as atualizações pendentes
    Write-Output "Instalando atualizações pendentes..."
    Install-WindowsUpdate -AcceptAll -AutoReboot
} else {
    Write-Output "Não há atualizações pendentes."
}

# Reverter a política de execução para a configuração padrão
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope Process -Force
