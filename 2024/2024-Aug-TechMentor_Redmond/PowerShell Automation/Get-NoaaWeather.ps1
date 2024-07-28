$Result = Invoke-RestMethod -Uri 'https://api.weather.gov/points/44.261799,-88.407249'
$Result
$Result = Invoke-RestMethod -Uri $Result.properties.forecast
