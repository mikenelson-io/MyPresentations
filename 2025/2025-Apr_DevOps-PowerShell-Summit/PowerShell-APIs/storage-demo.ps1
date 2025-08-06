$headers = @{Authorization = "Bearer YOUR_API_TOKEN" }
$volumeConfig = @{
    name   = "ProdDBVolume"
    size   = 512000
    preset = "SQLServer"
} | ConvertTo-Json

$response = Invoke-RestMethod "https://10.21.185.110/api/2.41/volumes" -Headers $headers -Body $volumeConfig -Method POST -ContentType "application/json"
Write-Host "Provisioned volume: $($response.name) with size: $($response.size) bytes."
