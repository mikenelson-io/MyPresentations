### This is the file I used for my demos that I presented at the Dutch PowerShell user group in May 2020
# I didn't get through all of them due to time, but I commented all of it.
# Use as you wish, but there is absolutely no responsibility on my part whatsoever to maintain, provide support, or even justify it's existance.
# You will use at your own risk and will never use these in a production environment

### Getting distros
# from the Windows Store
# Non-store sources
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-2004 -OutFile Ubuntu.appx -UseBasicParsing
curl.exe -L -o ubuntu-2004.appx https://aka.ms/wsl-ubuntu-2004
Add-AppxPackage .\ubuntu-2004.appx
### Patrick Wu's psuwi module for Ubuntu
Install-Module PsUWI
Import-Module PsUWI
New-UbuntuWSLInstance -Version 2

### Where are the default distro folders?
%localappdata%\Packages\CanonicalGroupLimited.Ubuntu20.04onWindows_79rhkp1fndgsc

### How to start a distro?
# Via the icon, if downloaded from the Store
# Copy the App shortcut to your dekstop if you wish by accessing this folder in a "Run" box
shell:AppsFolder
# Command line start
wsl.exe
wsl.exe -u -p command #can do root without sudo here -- maybe try gsudo (Github)
# Or just call the distro name. Can't be used for custom distros
Ubuntu-18.04
# Or via Windows Terminal
wt

### What under the covers of the VMP (Virtual Machine Platform)?
hcsdiag list
# Run Windows sandbox and see another virtual VM container show up in the hcsdiag list - called 'Madrid'

### Command line admin for Hyper-v
hvc list

### How to config?
# The old way
wslconfig.exe
# .wslconfig file - new in v2 - located in %USERPROFILE%
wsl command line
# Set default distro
wsl -l -v
wsl --set-default ubuntu-20.04
# Set default version
wsl --set-default-version 2
# Change default user to root
Ubuntu-20.04 config --default-user root
# Kill it
wsl --terminate ubuntu-20.04
# Shut it down
wsl --shutdown ubuntu-20.04

### Export / Import distro images - creates .vhdx files
wsl --export Ubuntu demo
wsl --import Ubuntu-demo d:\wsl_distros demo
wsl -d Ubuntu-demo

### What version of Linux is running?
dmesg # Lots of output
wsl -l -v
wsl cat /etc/os-release
wsl screenfetch # If installed

### wslutilities by Patrick Wu (Github)
wslvar -S
wslsys
wslfetch
wslact

### FS Redirector
\\wsl$
wslpath -u 'c:\users'
wslpath -w '/home/mike'

### linux to win paths In Ubuntu
PATHLIST=/mnt/c/Users/:/mnt/c/temp/
export WSLENV=$WSLENV:PATHLIST/l
cmd.exe
set PATHLIST

### Win to Linux path
set WINWSL
WINWSL=c:\users\mike
set WSLENV=WINWSL /up
echo $WINWSL

### Can also execute distro commands in automated fashion
wsl -d Ubuntu-20.04 df -h
wsl -u mike ls -l

### Multiple pipe and redirect between distros & OSs
wsl -d debian fortune | wsl -d ubuntu cowsay
wsl ip a | findstr /i "eth0"
wsl ls -l /etc | wsl grep "timezone" > tz.txt
wsl ls -la | Select-Object -First 10

### FS/Drive interoperability
mount
# windows explorer now lists 'Linux'
# The old way
    \\wsl$\ubuntu-20.04
    explorer.exe .
# folder shift-right click - Run linux shell
# type wsl in explorer address bar

### PowerShell and WSL
# PowerShell not installed on distro, run from the Win side
'/mnt/c/Program Files/PowerShell/7/pwsh.exe'
# PowerShell from within distro where it is installed
pwsh get-process

### Windows side batch or cmd - defaults to WINDIR
cmd.exe /c [command]

### Direct launch - most will need full path /mnt/c/Windows/...
notepad.exe .
explorer.exe .
code.exe

### Disable interoperability - not persistent across sessions
echo 0 > /proc/sys/fs/binfmt_misc/WSLInterop

### Re-enable interoperability - not persistent across sessions
echo 1 > /proc/sys/fs/binfmt_misc/WSLInterop

### Run remote-wsl in vscode - F1 remote-wsl
code .

### Docker
# Run from either native Linux Docker (dockerd) or Interop via Docker Desktop in Windows
docker run adamoss/clippy Greetings to the DuPSUG
docker run --rm -it wernight/funbox asciiquarium

### Run benchmark on 18.04 - part of Patrick Wu's repo (Github)
cd /mnt/c/Users/Mike/wslconf/interop-on-wsl-benchmark
./bm.sh
