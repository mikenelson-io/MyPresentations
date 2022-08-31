function Start-AlarmClock-MI {
    <#
.SYNOPSIS
An alarm with Mission Impossible messages!
#>
    param(
        [int] $Seconds
    )
    Add-Type -AssemblyName System.Speech
    $Synthesiser = New-Object System.Speech.Synthesis.SpeechSynthesizer
    "Alarm will trigger after $Seconds seconds, press <CTRL> C to stop the alarm"

    Start-Sleep -Seconds $Seconds
    while ($true) {
        [console]::Beep()
        [console]::Beep(1000, 300)
        [console]::Beep()
        [console]::Beep(1000, 300)
        [console]::Beep()
        [console]::Beep(1000, 300)
        Start-Sleep 1
        $Synthesiser.Speak("Wake up Mr. Phelps. Your mission Jim, if you choose to accept it, is to get up and move! This alarm will self destruct in 10 seconds.")
        [console]::beep(784,150)
        Start-Sleep -m 300
        [console]::beep(784,150)
        Start-Sleep -m 300
        [console]::beep(932,150)
        Start-Sleep -m 150
        [console]::beep(1047,150)
        Start-Sleep -m 150
        [console]::beep(784,150)
        Start-Sleep -m 300
        [console]::beep(784,150)
        Start-Sleep -m 300
        [console]::beep(699,150)
        Start-Sleep -m 150
        [console]::beep(740,150)
        Start-Sleep -m 150
        [console]::beep(784,150)
        Start-Sleep -m 300
        [console]::beep(784,150)
        Start-Sleep -m 300
        [console]::beep(932,150)
        Start-Sleep -m 150
        [console]::beep(1047,150)
        Start-Sleep -m 150
        [console]::beep(784,150)
        Start-Sleep -m 300
        [console]::beep(784,150)
        Start-Sleep -m 300
        [console]::beep(699,150)
        Start-Sleep -m 150
        [console]::beep(740,150)
        Start-Sleep -m 150
        [console]::beep(932,150)
        [console]::beep(784,150)
        [console]::beep(587,1200)
        Start-Sleep -m 75
        [console]::beep(932,150)
        [console]::beep(784,150)
        [console]::beep(554,1200)
        Start-Sleep -m 75
        [console]::beep(932,150)
        [console]::beep(784,150)
        [console]::beep(523,1200)
        Start-Sleep -m 150
        [console]::beep(466,150)
        [console]::beep(523,150)
        Start-Sleep 3
    }
}
Start-AlarmClock-MI