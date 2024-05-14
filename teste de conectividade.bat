# Define o intervalo de tempo para verificar a rede (em segundos)
$IntervaloVerificacao = 60
$LogFile = "C:\Caminho\para\o\arquivo\log.txt"  # Altere o caminho conforme necessário

# Função para verificar a conectividade de um dispositivo e porta
function VerificarConectividade {
    param(
        [string]$Dispositivo,
        [int]$Porta
    )
    $TestePorta = Test-NetConnection -ComputerName $Dispositivo -Port $Porta
    if ($TestePorta.TcpTestSucceeded) {
        $Status = "$Dispositivo:$Porta está ONLINE."
    } else {
        $Status = "$Dispositivo:$Porta está OFFLINE."
    }
    Add-Content -Path $LogFile -Value $Status
}

# Loop para verificar a conectividade dos dispositivos e portas a cada intervalo
while ($true) {
    Clear-Host
    Write-Host "Verificando conectividade dos dispositivos e portas..."
    VerificarConectividade -Dispositivo "192.168.1.1" -Port 80  # Exemplo: Porta HTTP
    VerificarConectividade -Dispositivo "192.168.1.100" -Port 3389  # Exemplo: Porta RDP
    # Adicione mais dispositivos e portas conforme necessário

    # Aguarda o intervalo de tempo antes de verificar novamente
    Start-Sleep -Seconds $IntervaloVerificacao
}
