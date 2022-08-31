function Start-AlarmClock {
    <#
.SYNOPSIS
After the parameter of number of seconds has elapsed, this function will beep until user initiates a <CTRL>C
#>
    param(
        [int] $Seconds
    )
    "Alarm will trigger after $Seconds seconds, press <CTRL> C to stop the alarm"

    Start-Sleep -Seconds $Seconds
    while ($true) {
               [console]::Beep()
    }
}
Start-AlarmClock