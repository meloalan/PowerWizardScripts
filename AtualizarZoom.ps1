# URL do instalador mais recente do Zoom
$zoomInstallerUrl = "https://zoom.us/client/latest/ZoomInstallerFull.msi"

# Caminho temporário para baixar o instalador
$tempInstallerPath = "$env:TEMP\ZoomInstallerFull.msi"

# Baixar o instalador
try {
    Invoke-WebRequest -Uri $zoomInstallerUrl -OutFile $tempInstallerPath -ErrorAction Stop
    Write-Host "Download concluído com sucesso." -ForegroundColor Green
} catch {
    Write-Host "Falha ao baixar o instalador: $_" -ForegroundColor Red
    exit 1
}

# Verificar se o arquivo foi baixado
if (Test-Path $tempInstallerPath) {
    # Instalar o Zoom
    try {
        Start-Process msiexec.exe -ArgumentList "/i $tempInstallerPath /quiet /norestart" -NoNewWindow -Wait
        Write-Host "Instalação concluída com sucesso." -ForegroundColor Green
    } catch {
        Write-Host "Falha na instalação: $_" -ForegroundColor Red
        exit 1
    }

    # Remover o instalador temporário
    try {
        Remove-Item $tempInstallerPath -ErrorAction Stop
        Write-Host "Arquivo temporário removido com sucesso." -ForegroundColor Green
    } catch {
        Write-Host "Falha ao remover o arquivo temporário: $_" -ForegroundColor Red
    }
} else {
    Write-Host "O arquivo de instalador não foi encontrado após o download." -ForegroundColor Red
}
