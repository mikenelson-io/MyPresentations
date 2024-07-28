# Example using Pushover API for notifications
$apiUrl = "https://api.pushover.net/1/messages.json"

$body = @{
    token = $poappToken
    user = $pouserKey
    message = "Hello from TechMentor 2024!"
} | ConvertTo-Json
Invoke-RestMethod -Uri $apiUrl -Method POST -ContentType "application/json" -Body $body
