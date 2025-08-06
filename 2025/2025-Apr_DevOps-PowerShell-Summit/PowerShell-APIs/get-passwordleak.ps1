# Check password securely (replace 'password123' with your password)
$password = "password123"
$sha1 = (New-Object -TypeName System.Security.Cryptography.SHA1CryptoServiceProvider)
$hash = ($sha1.ComputeHash([Text.Encoding]::UTF8.GetBytes($password)) | ForEach-Object { $_.ToString("X2") }) -join ''
$hashPrefix = $hash.Substring(0, 5)
$hashSuffix = $hash.Substring(5)

$response = Invoke-RestMethod -Uri "https://api.pwnedpasswords.com/range/$hashPrefix"
if ($response -match $hashSuffix) {
    Write-Output "Yikes! Your password has been compromised. Change it ASAP."
}
else {
    Write-Output "Good news! Your password hasn't been found in any breaches (yet)."
}