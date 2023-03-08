
# Start Star Wars Alarm Clock code
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
# Start Mission Impossible Alarm Clock code
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
# Start Tetris Alarm Clock code
function Start-AlarmClock-Tetris {
    <#
.SYNOPSIS
An alarm with Tetris music!
#>
    param(
        [int] $Seconds
    )
    "Alarm will trigger after $Seconds seconds, press <CTRL> C to stop the alarm"

    Start-Sleep -Seconds $Seconds
    while ($true) {
        [Console]::Beep(658, 125)
        [Console]::Beep(1320, 500)
        [Console]::Beep(990, 250)
        [Console]::Beep(1056, 250)
        [Console]::Beep(1188, 250)
        [Console]::Beep(1320, 125)
        [Console]::Beep(1188, 125)
        [Console]::Beep(1056, 250)
        [Console]::Beep(990, 250)
        [Console]::Beep(880, 500)
        [Console]::Beep(880, 250)
        [Console]::Beep(1056, 250)
        [Console]::Beep(1320, 500)
        [Console]::Beep(1188, 250)
        [Console]::Beep(1056, 250)
        [Console]::Beep(990, 750)
        [Console]::Beep(1056, 250)
        [Console]::Beep(1188, 500)
        [Console]::Beep(1320, 500)
        [Console]::Beep(1056, 500)
        [Console]::Beep(880, 500)
        [Console]::Beep(880, 500)
        sleep -m 250
        [Console]::Beep(1188, 500)
        [Console]::Beep(1408, 250)
        [Console]::Beep(1760, 500)
        [Console]::Beep(1584, 250)
        [Console]::Beep(1408, 250)
        [Console]::Beep(1320, 750)
        [Console]::Beep(1056, 250)
        [Console]::Beep(1320, 500)
        [Console]::Beep(1188, 250)
        [Console]::Beep(1056, 250)
        [Console]::Beep(990, 500)
        [Console]::Beep(990, 250)
        [Console]::Beep(1056, 250)
        [Console]::Beep(1188, 500)
        [Console]::Beep(1320, 500)
        [Console]::Beep(1056, 500)
        [Console]::Beep(880, 500)
        [Console]::Beep(880, 500)
        sleep -m 500
        [Console]::Beep(1320, 500)
        [Console]::Beep(990, 250)
        [Console]::Beep(1056, 250)
        [Console]::Beep(1188, 250)
        [Console]::Beep(1320, 125)
        [Console]::Beep(1188, 125)
        [Console]::Beep(1056, 250)
        [Console]::Beep(990, 250)
        [Console]::Beep(880, 500)
        [Console]::Beep(880, 250)
        [Console]::Beep(1056, 250)
        [Console]::Beep(1320, 500)
        [Console]::Beep(1188, 250)
        [Console]::Beep(1056, 250)
        [Console]::Beep(990, 750)
        [Console]::Beep(1056, 250)
        [Console]::Beep(1188, 500)
        [Console]::Beep(1320, 500)
        [Console]::Beep(1056, 500)
        [Console]::Beep(880, 500)
        [Console]::Beep(880, 500)
        sleep -m 250
        [Console]::Beep(1188, 500)
        [Console]::Beep(1408, 250)
        [Console]::Beep(1760, 500)
        [Console]::Beep(1584, 250)
        [Console]::Beep(1408, 250)
        [Console]::Beep(1320, 750)
        [Console]::Beep(1056, 250)
        [Console]::Beep(1320, 500)
        [Console]::Beep(1188, 250)
        [Console]::Beep(1056, 250)
        [Console]::Beep(990, 500)
        [Console]::Beep(990, 250)
        [Console]::Beep(1056, 250)
        [Console]::Beep(1188, 500)
        [Console]::Beep(1320, 500)
        [Console]::Beep(1056, 500)
        [Console]::Beep(880, 500)
        [Console]::Beep(880, 500)
        sleep -m 500
        [Console]::Beep(660, 1000)
        [Console]::Beep(528, 1000)
        [Console]::Beep(594, 1000)
        [Console]::Beep(495, 1000)
        [Console]::Beep(528, 1000)
        [Console]::Beep(440, 1000)
        [Console]::Beep(419, 1000)
        [Console]::Beep(495, 1000)
        [Console]::Beep(660, 1000)
        [Console]::Beep(528, 1000)
        [Console]::Beep(594, 1000)
        [Console]::Beep(495, 1000)
        [Console]::Beep(528, 500)
        [Console]::Beep(660, 500)
        [Console]::Beep(880, 1000)
        [Console]::Beep(838, 2000)
        [Console]::Beep(660, 1000)
        [Console]::Beep(528, 1000)
        [Console]::Beep(594, 1000)
        [Console]::Beep(495, 1000)
        [Console]::Beep(528, 1000)
        [Console]::Beep(440, 1000)
        [Console]::Beep(419, 1000)
        [Console]::Beep(495, 1000)
        [Console]::Beep(660, 1000)
        [Console]::Beep(528, 1000)
        [Console]::Beep(594, 1000)
        [Console]::Beep(495, 1000)
        [Console]::Beep(528, 500)
        [Console]::Beep(660, 500)
        [Console]::Beep(880, 1000)
        [Console]::Beep(838, 2000)
        Start-Sleep 3
    }
}
