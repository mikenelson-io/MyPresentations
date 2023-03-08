#
# Highway2Powershell.PS1
#

function global:out-voice ($words) { (new-object -com SAPI.SpVoice).speak($words) }

IMPORT-CSV ./HIGHWAY.CSV | FOREACH { WRITE-HOST $_.Lyric; OUT-VOICE ( $_.Lyric);  }

#
# End of Le Script
#