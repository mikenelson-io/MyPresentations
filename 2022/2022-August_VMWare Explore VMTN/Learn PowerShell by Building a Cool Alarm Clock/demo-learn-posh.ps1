Set-Location c:\powershell

code $PROFILE

Get-Process

Show-Command Get-Process

Get-Process | Get-Member

# Pipeline
notepad.exe
Get-Process notepad | Stop-Process

# Help
Get-Help Get-Process
Get-Help Get-Process -Examples
Get-Help Get-Process -Full

# Modules
Get-Module
Get-Module -ListAvailable

Import-Module WSL
Get-Command -Module WSL

# Get-Help & start function
Get-Help Start-Sleep
Get-Help Start-Sleep -Parameter Seconds
Get-Alias -Definition Start-Sleep
sleep 3
sleep 3; [console]::Beep()
sleep 3; while (1) { [console]::Beep() }

code SimpleAlarmClock.ps1

# Show "One-line" function loaded in memory

function Start-AlarmClock { Start-Sleep -Seconds 3 while ($true) { [console]::Beep() } }

# PSDrive dir of Function:
Get-PSDrive
dir Function:
dir Function:\*alarm*

# Add seconds parameter
function Start-AlarmClock {
    param(
        [int] $Seconds
    )

    Start-Sleep -Seconds $Seconds
    while ($true) {
        [console]::Beep()
    }
}

Start-AlarmClock 3

# Run it - doesn't do anything???
Start-AlarmClock.ps1
# Need to dot-source the script - it makes the function available in the global scope
.\Start-AlarmClockScript.ps1
# add seconds
.\Start-AlarmClock -Seconds 3

# Luke
.\Start-AlarmClock-Luke.ps1

# Show the code
code .\Start-AlarmClock-Luke.ps1

.\Start-AlarmClock-MI.ps1
.\Start-AlarmClock-Tetris.ps1

# Let's start building our Module
# Just creating a directory for the module
New-Item -Path AlarmClockModule -ItemType Directory

# Copying the ps1 file and renaming it to .psm1
Copy-Item -Path .\Start-AlarmClock.ps1 -Destination .\AlarmClockModule\AlarmClock.psm1

# Importing the newly copied .psm1 file
Import-Module .\AlarmClockModule\AlarmClock.psm1 -Verbose

# Defining an array of variables for the manifest
$Splat = @{
    Path = '.\AlarmClockModule\AlarmClock.psd1'
    Author = 'Mike'
    ModuleVersion= '1.1.0.0'
    FunctionsToExport = 'Start-AlarmClock'
    Description = 'Demo - AlarmClock module'
    RootModule = '.\AlarmClockModule\AlarmClock.psm1'
}

# Creating the manifest
New-ModuleManifest @Splat

# Open the manifest
code .\AlarmClockModule\AlarmClock.psd1

# Import the manifest, which loads the module
Import-Module .\AlarmClockModule\AlarmClock.psd1 -Verbose

# Module created!! Yea!

# End demo

Start-Process powershell -ArgumentList '-noprofile -noexit -command .\PSInvaders.ps1'

.\Highway2Powershell.ps1

https://www.youtube.com/watch?v=MWWzrp3xkYY


