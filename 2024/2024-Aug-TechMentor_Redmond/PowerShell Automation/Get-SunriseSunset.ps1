# Get sunrise and sunset times using a public API
$latitude = "44.261799"
$longitude = "-88.407249"
$apiUrl = "https://api.sunrise-sunset.org/json?lat=$latitude&lng=$longitude&formatted=1"
$response = Invoke-RestMethod -Uri $apiUrl
$sunrise = [datetime]$response.results.sunrise
$sunset = [datetime]$response.results.sunset
$daylength = $response.results.day_length
Write-Host "Sunrise: " $sunrise
Write-Host "Sunset: " $sunset