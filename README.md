# MyPresentations
get-childitem | % {
    $GHPath = $_.FullName -replace 'C:\\Temp\\Events' -replace '\\','/' -replace '\s','%20'
    "* [$(Split-Path $_ -Leaf)](https://github.com/jaapbrasser/events/tree/master$GHPath)"
    $_ | ls -recurse | ? {$_.PSIsContainer -or $_.Extension -eq '.md'} | select -exp fullname | % {
        $Count = ($_ -split '\\').Count -4
        $GHPath = $_ -replace 'C:\\Temp\\Events' -replace '\\','/' -replace '\s','%20'
        "$(" "*$Count*2)* [$(Split-Path $_ -Leaf)](https://github.com/jaapbrasser/events/tree/master$GHPath)"
    }
} | clip.exe
