# Novo nome do computador
$newHostname = "NovoNomeDoComputador"

# Alterar o nome do computador sem interação do usuário
Rename-Computer -NewName $newHostname -Force

# Informar que a alteração foi realizada e que será necessário reiniciar o computador manualmente
Write-Host "O nome do computador foi alterado para $newHostname. Por favor, reinicie o computador manualmente para que as alterações entrem em vigor."
