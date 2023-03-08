
Get-Process

Show-Command Get-Process

Get-Process | Get-Member

# Modules
Get-Module
Get-Module -ListAvailable

Import-Module VMware.PowerCLI

# Help
Get-Help Connect-VIServer
Get-Help Connect-VIServer -Examples
Get-Help Connect-VIServer -Full

# Pipeline
notepad.exe
Get-Process notepad | Stop-Process

Get-ChildItem -Path *.txt | Where-Object {$_.length -gt 10000} | Sort-Object -Property length | Format-Table -Property name, length

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

# Add Synopsis
function Start-AlarmClock {
    <#
 .SYNOPSIS
 After the parameter of number of seconds has elapsed, this function will beep until user initiates a <CTRL>C
 #>
    param(
        [int] $Seconds
    )

    Start-Sleep -Seconds $Seconds
    while ($true) {
        [console]::Beep()
    }
}

# See Synopsis added for help
Get-Help Start-AlarmClock

# Show the code - show the invoke
code .\Start-AlarmClock.ps1

# Run it - doesn't do anything???
# Run .\Start-AlarmClock.ps1
# Need to dot-source the function - it makes the function available in the global scope
.\Start-AlarmClock.ps1
# add seconds
.\Start-AlarmClock -Seconds 3

# Luke
.\Start-AlarmClock-Luke.ps1

# Show the code if time
code .\Start-AlarmClock-Luke.ps1

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
    Description = 'Indy UC - AlarmClock module'
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
