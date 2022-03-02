#region Pre-check
Set-Location 'C:\Users\Jaap Brasser\OneDrive\Documents\Events\2018-09-23 Ignite\session\Demo'
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Ensure VPN is disconnected
# Ensure Windows Defender is disabled for last demo

#endregion

#region Aliases and Help

# Alarm clock
Start-Sleep -Seconds 600

# Help and information about parameter order
Get-Help Start-Sleep
Get-Help Start-Sleep -Parameter Seconds

# Find alias
Get-Alias -Definition Start-Sleep

sleep 3

sleep 3;[console]::Beep()

sleep 3; while(1){[console]::Beep()}

code alarmclock.ps1

.\AlarmClock.ps1
#endregion

#region Functions

function Start-AlarmClock {
    Start-Sleep -Seconds 3
    while ($true) {
        [console]::Beep()
    }
}

dir Function:\*alarm*
dir function:\*alarm* | Select-Object -ExpandProperty Definition

Start-AlarmClock

function Start-AlarmClock {
    param(
        [int] $Seconds
    )

    Start-Sleep -Seconds $Seconds
    while ($true) {
        [console]::Beep()
    }
}

Start-AlarmClock -Seconds 3

function Start-AlarmClock {
 <#
 .SYNOPSIS
 After a set number of seconds this function will beep until switched off with <CTRL> + C
 #>
    param(
        [int] $Seconds
    )

    Start-Sleep -Seconds $Seconds
    while ($true) {
        #        [console]::Beep()
        Add-Type -AssemblyName System.Speech
        $Synthesiser = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $Synthesiser.Speak("Wake up! Wake Up!")
    }
}

Get-Help Start-AlarmClock

code Start-AlarmClock.ps1

.\Start-AlarmClock.ps1

. .\Start-AlarmClock.ps1

Start-AlarmClock -Seconds 30
#endregion

#region Modules
New-Item -Path AlarmClock -ItemType Directory
Copy-Item -Path .\Start-AlarmClock.ps1 -Destination .\AlarmClock\AlarmClock.psm1

Import-Module .\AlarmClock\AlarmClock.psm1 -Verbose

$Splat = @{
        Path              = '.\AlarmClock\AlarmClock.psd1'
        Author            = 'Jaap Brasser'
        ModuleVersion     = '1.0.0.0'
        FunctionsToExport = 'Start-AlarmClock'
        Description       = 'Ignite 2018 - AlarmClock module'
        RootModule        = '.\AlarmClock\AlarmClock.psm1'
}
New-ModuleManifest @Splat

code .\AlarmClock\AlarmClock.psd1

Import-Module .\AlarmClock\AlarmClock.psd1 -Verbose
#endregion

#region modules
Find-Module AzureRM
Find-Module VMware.PowerCLI
Find-Module AWSPowerShell

Install-Module Rubrik -Verbose
#endregion

<#
Next steps:
    * Publish to PowerShell Gallery
    * Push to Git
    * Create Azure DevOps module pipeline
#>

code .\FunDemo.ps1