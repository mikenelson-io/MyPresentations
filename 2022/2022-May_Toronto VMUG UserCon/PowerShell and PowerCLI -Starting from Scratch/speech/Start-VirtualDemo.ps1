#requires -version 2.0

# -----------------------------------------------------------------------------
# Script: Start-VirtualDemo.ps1
# Version: 1.0
# Author: Jeffery Hicks
#    http://jdhitsolutions.com/blog
#    http://twitter.com/JeffHicks
# Date: 3/10/2011
# Keywords: Demo
# Comments:
# http://jdhitsolutions.com/blog/2011/03/friday-fun-virtual-demos/
#
# "Those who forget to script are doomed to repeat their work."
#
#  ****************************************************************
#  * DO NOT USE IN A PRODUCTION ENVIRONMENT UNTIL YOU HAVE TESTED *
#  * THOROUGHLY IN A LAB ENVIRONMENT. USE AT YOUR OWN RISK.  IF   *
#  * YOU DO NOT UNDERSTAND WHAT THIS SCRIPT DOES OR HOW IT WORKS, *
#  * DO NOT USE IT OUTSIDE OF A SECURE, TEST SETTING.             *
#  ****************************************************************
# -----------------------------------------------------------------------------


Param(
    [Parameter(Position=0)]
    [string]$File="vdemo.txt",
    [int]$rate=-1
)

#verify the text file "script"
if (-Not (Test-Path -path $File))
{
    Write-Error "Failed to find $file. Please verify and try again."
}
else
{
    Try {
        #create the Voice object
        $voice=New-Object -ComObject "SAPI.SPVoice"
        #I find a slower rate works better but you may need to experiment
        $voice.rate=$rate
    }

    Catch {
        #Oops.
        Write-Warning "Unable to create the Voice object."
    }

    if ($voice) {
        #cleas the screen
        Clear-Host

        #store the current location so we can return to it
        Push-Location

        #get all data from the text file, filtering out blank lines
        $data=Get-Content $file | where {$_}

#        Write-Host "Demo Started." -ForegroundColor Cyan

        #go through each line. Lines that start with # will be spoken.
        #All other lines will be displayed in a pseudo prompt and then executed
        foreach ($line in $data) {

          If ($line.StartsWith("/"))
          {
            $voice.Speak($line.Substring(1)) | Out-Null
          }
          else
          {
            #display the command using the current location in a prompt
            #add a blank line before and after the command
            Write-host ("`nPS {0}> {1} `n" -f (Get-Location).path,$line)
            #pause a few seconds to give the viewer time to read the command
            sleep 3
            #execute the command
            Invoke-Expression $line | Out-Default
          }
        } #Foreach
        #return to the original location
        Pop-Location
    } #if $voice
} #else file found
#Write-Host "Demo Finished." -ForegroundColor Cyan
