# Define o intervalo de tempo para verificar a rede (em segundos)
$IntervaloVerificacao = 60
$LogFile = "C:\Caminho\para\o\arquivo\log.txt"

# Função para verificar a conectividade de um dispositivo e salvar o resultado no arquivo de log
function VerificarConectividade {
    param(
        [string]$Dispositivo
    )
    $Ping = Test-Connection -ComputerName $Dispositivo -Count 1 -Quiet
    if ($Ping) {
        $Status = "$Dispositivo está ONLINE."
    } else {
        $Status = "$Dispositivo está OFFLINE."
    }
    Add-Content -Path $LogFile -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $Status"
    Write-Host $Status
}

# Loop para verificar a conectividade dos dispositivos a cada intervalo
while ($true) {
    Clear-Host
    Write-Host "Verificando conectividade dos dispositivos..."
    VerificarConectividade -Dispositivo "192.168.1.1"  # Exemplo: Endereço IP do roteador
    VerificarConectividade -Dispositivo "192.168.1.100"  # Exemplo: Endereço IP de um computador na rede
    # Adicione mais dispositivos conforme necessário

    # Aguarda o intervalo de tempo antes de verificar novamente
    Start-Sleep -Seconds $IntervaloVerificacao
}
