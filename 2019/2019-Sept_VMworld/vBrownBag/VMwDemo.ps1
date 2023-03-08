# Copyright Mike Nelson 2019
# Pretty harmless code, but still use at your own risk.
# VMwDemo.ps1 file used for VMworld vBrownBag 2019 PowerShell Beginning Session 8-24-2019
#
# This file is not meant to run as a script - it is a reference file for giving session information
#
# Credit and thanks go to Jaap Brasser @Jaap_Brasser for his code and assistance

Set-Location 'D:\OneDrive\Events\VMworld2019\PowerShell'
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# 4 primary commands to discover objects in PowerShell
Get-Help
Get-Command
Get-Process | Get-Member
Get-PSDrive

# Show-Command
Show-Command Get-Help

# Modules
Get-Module
Get-Module -ListAvailable
Install-Module Rubrik
Import-Module Rubrik -Verbose

# Providers
Get-PSProvider
Import-Module ActiveDirectory
Get-PSProvider

# Pipelines
Get-Process
Get-Process | Where-Object { $_.WorkingSet -gt 10000000 }
Get-Process | Format-Table -View priority

# Get-Help & start function
Get-Help Start-Sleep
Get-Help Start-Sleep -Parameter Seconds
Get-Alias -Definition Start-Sleep
sleep 2
sleep 2; [console]::Beep()
sleep 2; while (1) { [console]::Beep() }

code SimpleAlarmClock.ps1


########## Start Here from automated demo script

# Run .\SimpleAlarmClock.ps1

# Show "One-line" function loaded in memory

function Start-AlarmClock { Start-Sleep -Seconds 2 while ($true) { [console]::Beep() } }

# PSDrive dir of Function:
dir Function:
dir Function:\*alarm*
dir function:\*alarm* | Select-Object -ExpandProperty Definition

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
# Run .\StartAlarmClock.ps1 -Seconds 3

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
. .\Start-AlarmClock.ps1
# Now just run it
Start-AlarmClock -Seconds 2

# If time allows - run funny alarm AlarmClock - just for kicks
.\Start-AlarmClock-Luke.ps1

# Show the code if time
code .\Start-AlarmClock-Luke.ps1

# End demo

