# Basics
Get-Command

Get-Service

Get-Help -Name Get-Service

Show-Command Get-Service

Get-Module

Get-Module -ListAvailable

Get-PSDrive

# Parameters
Get-Command -Name *time*
Get-Command -Noun *time*
Get-Command -Noun *time* -Verb Get

# Pipelines
Get-Process notepad
Start-Process notepad
Get-Process notepad
Get-Process notepad | Stop-Process

Get-Service | Get-Member
Get-Service | Where-Object {$_.status -eq "Running"}
Get-Service | Where-Object {$_.status -eq "Running"} | Select-Object DisplayName, Status
Get-NetIPAddress | Where-Object {$_.AddressFamily -eq "ipv4"} | Select-Object InterfaceAlias, IPAddress

# Look at some PowerCLI modules
code-insiders Get-NicDetails.ps1
code-insiders Get-NewAndremovedVMs.ps1
code-insiders VMware-vCD-TenantReport.psd1

Install-Module -Name VMware.PowerCLI -Scope CurrentUser

Get-Module -Name VMware* | Format-Table Name, Version, ModuleType -AutoSize
# returns empty. Why?

Import-Module VMware.PowerCLI
# what is it doing???

Get-Command -Module VMware.PowerCLI | Measure-Object

Get-Command -Module VMware.VimAutomation.Core | Measure-Object

Get-Command -Module VMware.PowerCLI -Name Get* | Measure-Object

Get-Command -Module VMware* | Sort-Object Name | Format-Table Name, Version, CommandType -AutoSize

Get-Command -Module VMware* | Measure-Object

# Module paths and collisions
Get-Module

Get-VM

# How does it know which one to load?
$env:PSModulePath
# in order, alphabetical by module Name# See about_command_precedence

# Cmdlet collision
Get-Command Get-VM

Import-Module Hyper-V -Verbose

# Show Get-VM Cmdlet

Get-Command Get-VM

Get-Command Get-VM -All

Remove-Module Hyper-V

Get-Command Get-VM

Import-Module Hyper-V -Prefix HV

Get-Command -Module Hyper-V


## GitHub

#Do you know how to use GitHub?
# Signup and create a repo

# open in GitHub Desktop

# open in VSCode --> download Git and add extension

# open with "."
