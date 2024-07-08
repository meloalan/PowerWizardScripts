# Define the registry path and the value name
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0"
$valueName = "RestrictSendingNTLMTraffic"

# Define the value to disable outgoing NTLM traffic (2 to disable)
$value = 2

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $value

# Output the result to verify
Write-Output "NTLM outgoing traffic to remote servers has been disabled."
