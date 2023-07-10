#Install-VSCodeSandbox.ps1

<#
  This script will download and install the most current x64 version of VS Code
  and install the PowerShell extension
#>

$file = Join-Path -Path $env:temp -ChildPath 'VSCodeSetup-x64.exe'
Invoke-WebRequest -Uri "https://update.code.visualstudio.com/latest/win32-x64-user/stable" -OutFile $file -DisableKeepAlive -UseBasicParsing

$loadInf = '@
[Setup]
Lang=english
Dir=C:\Program Files\Microsoft VS Code
Group=Visual Studio Code
NoIcons=0
Tasks=desktopicon,addcontextmenufiles,addcontextmenufolders,addtopath
@'

$infPath = Join-Path -path $env:TEMP -child load.inf
$loadInf | Out-File $infPath

Start-Process -FilePath $file -ArgumentList "/VERYSILENT /LOADINF=${infPath}" -Wait

#add extensions
Start-Process -FilePath "C:\Program Files\Microsoft VS Code\bin\code.cmd" -ArgumentList "--install-extension ms-vscode.powerShell"

if (Test-Path Function:\log) {
  log "VSCode Setup Complete"
}
