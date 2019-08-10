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
      #         [console]::Beep()
               $Synthesiser.Speak("Wake up Luke! May the force be with you!")
                [console]::beep(440, 500)
                [console]::beep(440, 500)
                [console]::beep(440, 500)
                [console]::beep(349, 350)
                [console]::beep(523, 150)
                [console]::beep(440, 500)
                [console]::beep(349, 350)
                [console]::beep(523, 150)
                [console]::beep(440, 1000)
    }
}
Start-AlarmClock-Luke