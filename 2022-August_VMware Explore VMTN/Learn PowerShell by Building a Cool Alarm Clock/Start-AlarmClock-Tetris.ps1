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
Start-AlarmClock-Tetris