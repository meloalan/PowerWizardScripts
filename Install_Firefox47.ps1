# Define o URL de download
$firefoxUrl = "https://ftp.mozilla.org/pub/firefox/releases/47.0/win32/pt-BR/Firefox%20Setup%2047.0.exe"

# Define o caminho temporário para salvar o instalador
$tempPath = [System.IO.Path]::Combine($env:TEMP, "Firefox_Setup_47.0.exe")

# Baixa o instalador
Invoke-WebRequest -Uri $firefoxUrl -OutFile $tempPath

# Verifica se o arquivo foi baixado com sucesso
if (Test-Path $tempPath) {
    Write-Host "Instalador do Firefox 47.0 baixado com sucesso em $tempPath."

    # Executa o instalador de forma silenciosa
    Start-Process -FilePath $tempPath -ArgumentList "/S" -Wait

    Write-Host "Instalação do Firefox 47.0 concluída."

    # Remove o instalador após a instalação
    Remove-Item -Path $tempPath -Force
} else {
    Write-Host "Falha ao baixar o instalador."
}
