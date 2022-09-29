function Start-AlarmClock-Luke {
    <#
.SYNOPSIS
An alarm with Star Wars messages!
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
        $Synthesiser.Speak("Wake up Luke! May the force be with you! By the way, Darth Vader is your father.")
        [console]::beep(440,500)
        [console]::beep(440,500)
        [console]::beep(440,500)
        [console]::beep(349,350)
        [console]::beep(523,150)
        [console]::beep(440,500)
        [console]::beep(349,350)
        [console]::beep(523,150)
        [console]::beep(440,1000)
        [console]::beep(659,500)
        [console]::beep(659,500)
        [console]::beep(659,500)
        [console]::beep(698,350)
        [console]::beep(523,150)
        [console]::beep(415,500)
        [console]::beep(349,350)
        [console]::beep(523,150)
        [console]::beep(440,1000)
        Start-Sleep 3
    }
}
Start-AlarmClock-Luke