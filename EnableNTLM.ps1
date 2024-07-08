# Define o caminho do registro e o nome do valor
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0"
$valueName = "RestrictSendingNTLMTraffic"

# Define o valor para permitir o tráfego NTLM de saída (0 para permitir)
$value = 0

# Define o valor do registro para permitir o tráfego NTLM de saída
Set-ItemProperty -Path $registryPath -Name $valueName -Value $value

# Output the result to verify
Write-Output "NTLM outgoing traffic to remote servers has been enabled."
