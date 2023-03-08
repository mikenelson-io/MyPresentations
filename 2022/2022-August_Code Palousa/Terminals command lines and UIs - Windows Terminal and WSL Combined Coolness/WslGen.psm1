<#
	===========================================================================
	WSL multiple distribution image creator module
  Version - 0.1.0
  Original module created by Patrick Wu as PsUWI - github.com/patrick330602/PsUWI
  Modified to:
  - reduce number of random characgters in instance name
  - added -InstanceName parameter to specify name
  - added debian distros as option
  - misc syntax and refactoring
	-------------------------------------------------------------------------
	Disclaimer
 	The sample script and documentation are provided AS IS and are not supported by
	the author or the author's employer, unless otherwise agreed in writing. You bear
	all risk relating to the use or performance of the sample script and documentation.
	The author and the author's employer disclaim all express or implied warranties
	(including, without limitation, any warranties of merchantability, title, infringement
	or fitness for a particular purpose). In no event shall the author, the author's employer
	or anyone else involved in the creation, production, or delivery of the scripts be liable
	for any damages whatsoever arising out of the use or performance of the sample script and
	documentation (including, without limitation, damages for loss of business profits,
	business interruption, loss of business information, or other pecuniary loss), even if
	such person has been advised of the possibility of such damages.
	===========================================================================
#>

function New-WSLInstance {
  <#
    .SYNOPSIS
        Create a new Distro instance on WSL.
    .DESCRIPTION
        Create a new Distro instance in WSL with many options for updating and adding packages. This is currently limited to distributions that work with the APT package manager.
    .PARAMETER Distro
        The name of the distribution. The defualt is "Ubuntu". Currently allowed options are:
        "Ubuntu"
    .PARAMETER Release
        The Distro release you want to use to create the instance. Example for the Ubuntu distro would be "focal" (v20.04).
    .PARAMETER Version
        The WSL version you want to use. Default is 2.
    .PARAMETER Force
        If specified, a new WSL tarball will always be downloaded even if it exists.
    .PARAMETER NoUpdate
        If specified, it will not update during the creation.
    .PARAMETER NoUpgrade
        If specified, it will only update but not upgrade during the creation.
    .PARAMETER RootOnly
        If specified, no new user will be created.
    .PARAMETER EnableSource
        If specified, all source repositories in `/etc/apt/sources.list` will be enabled.
    .PARAMETER EnableProposed
        For Ubuntu instance, if specified, Ubuntu Proposed repository will be enabled. By default selective is enabled.
    .PARAMETER DisableSelective
        For Ubuntu instance, if specified, Selective Proposed repostiory will be disabled.
    .PARAMETER AdditionalPPA
        The PPA you want to include by default. Separate each PPA by comma.
    .PARAMETER AptOutput
        If specified, apt output will be shown.
    .PARAMETER Silent
        If specified, all ouput will not be printed out. AptOutput will be ignored when using this
    .PARAMETER NonInteractive
        If specified, it will return the name of the created distro instead of going into the interactive prompt
    .PARAMETER AdditionalPkg
        The packages you want to include by default. Separate each package by comma.
    .PARAMETER InstanceName
        If included, it will create the distro with the name specified prefixed with "ubuntu-".
    .EXAMPLE
        New-WSLInstance -Release bionic
        # Create a Ubuntu Bionic instance on WSL2
    .EXAMPLE
        New-WSLInstance -Release xenial -Version 1 -RootOnly
        # Create an Ubuntu Xenial instance on WSL1 without creating a user account
    .EXAMPLE
        New-WSLInstance -Version 2 -NoUpdate
        # Create an Ubuntu Focal instance on WSL2 without any update
    .EXAMPLE
        New-WSLInstance -Release Eoan -Force
        # Create an Ubuntu Eoan instance on WSL2 and download the WSL tarball even if it already exists
    .EXAMPLE
        New-WSLInstance -Version 2 -NoUpdate -InstanceName test
        # Create an Ubuntu Focal instance on WSL2 without any update that is named "ubuntu-test"
    .NOTES
    The Release tarballs are downloaded to the $HomePath\.wslgen\ folder.
    The created distribution will be located in the $HomePath\.wslgen\ folder in the respective named folder.
    Windows 10 2004+ only. Others may work, but not tested.
    .LINK
        https://github.com/mikenelson-io/WslGen
    #>
  [cmdletbinding()]
  Param (
    [Parameter(Mandatory = $false)]
    [string]$Distro = 'Ubuntu',
    [Parameter(Mandatory = $false)]
    [string]$Release = 'focal',
    [Parameter(Mandatory = $false)]
    [ValidateSet('1', '2')]
    [string]$Version = '2',
    [Parameter(Mandatory = $false)]
    [switch]$Force,
    [Parameter(Mandatory = $false)]
    [switch]$NoUpdate,
    [Parameter(Mandatory = $false)]
    [switch]$NoUpgrade,
    [Parameter(Mandatory = $false)]
    [switch]$RootOnly,
    [Parameter(Mandatory = $false)]
    [string]$AdditionalPPA,
    [Parameter(Mandatory = $false)]
    [switch]$EnableSource,
    [Parameter(Mandatory = $false)]
    [switch]$EnableProposed,
    [Parameter(Mandatory = $false)]
    [switch]$DisableSelective,
    [Parameter(Mandatory = $false)]
    [switch]$AptOutput,
    [Parameter(Mandatory = $false)]
    [switch]$Silent,
    [Parameter(Mandatory = $false)]
    [switch]$NonInteractive,
    [Parameter(Mandatory = $false)]
    [string]$AdditionalPkg,
    [Parameter(Mandatory = $false)]
    [string]$InstanceName
  )
  Process {
    function Write-IfNotSilent {
      [cmdletbinding()]
      Param (
        [Parameter(Mandatory = $true)]
        [string]$Text
      )
      if (-not $Silent) {
        Write-Host ":: $Text" -ForegroundColor DarkYellow
      }
    }
    function Stop-Writing {
      if ($AptOutput -and (-not $Silent)) {
        return ""
      }
      else {
        return "-qq"
      }
    }

    Write-IfNotSilent "Beginning deployment process..."
    If ($null -eq $InstanceName) {
    $TmpName = -join ((65..90) + (97..122) | Get-Random -Count 2 | ForEach-Object { [char]$_ })
    }
    else {
      $TmpName = $InstanceName
    }

    $SysArchName = ($env:PROCESSOR_ARCHITECTURE).ToLower()
    if ( -not ( ( $SysArchName -eq "amd64" ) -or ( $SysArchName -eq "arm64" ) ) ) {
      throw [System.NotSupportedException] "The architecture $SysArchName is not supported. 'amd64' or 'arm64' is required."
      exit
    }
    if ( ( $Release -eq "xenial" ) -and ( $SysArchName -eq "arm64" ) ) {
      throw [System.NotSupportedException] "Ubuntu Xenial does not support architecture arm64."
    }
    Write-IfNotSilent " "
    Write-IfNotSilent "Your system architecture is $SysArchName"
    Write-IfNotSilent " "

    $HomePath = $env:HOME
    if (-not $HomePath) {
      $HomePath = "$($env:HOMEDRIVE)$($env:HOMEPATH)"
    }

    if ( -not (Test-Path -Path "$HomePath\.wslgen" -PathType Container ) ) {
      mkdir -Path "$HomePath\.wslgen" | Out-Null
    }

    if ( -not (Test-Path -Path "$HomePath\.wslgen\.tarball" -PathType Container ) ) {
      mkdir -Path "$HomePath\.wslgen\.tarball" | Out-Null
    }

    if ( Test-Path -LiteralPath "$HomePath\.wslgen\.tarball\$Release-$SysArchName.tar.gz" -PathType Leaf ) {

      if ( $Force ) {
        Write-IfNotSilent "WSL tarball for $Release($SysArchName) found but -Force switch was passed. Re-downloading new tarball..."
        $download_start_time = Get-Date
        Invoke-WebRequest -Uri "http://cloud-images.ubuntu.com/$Release/current/$Release-server-cloudimg-$SysArchName-wsl.rootfs.tar.gz" -OutFile "$HomePath\.wslgen\.tarball\$Release-$SysArchName.tar.gz"

        Write-IfNotSilent "Download completed. Time taken: $((Get-Date).Subtract($download_start_time).Seconds) second(s)"
      }
      else {
        Write-IfNotSilent "WSL tarball for $Release ($SysArchName) found."
      }

    }
    else {

      Write-IfNotSilent "WSL tarball for $Release ($SysArchName) not found. Downloading..."
      $download_start_time = Get-Date
      Invoke-WebRequest -Uri "http://cloud-images.ubuntu.com/$Release/current/$Release-server-cloudimg-$SysArchName-wsl.rootfs.tar.gz" -OutFile "$HomePath\.wslgen\.tarball\$Release-$SysArchName.tar.gz"

      Write-IfNotSilent "Download completed. Time taken: $((Get-Date).Subtract($download_start_time).Seconds) second(s)"

    }

    # set a unique instance name which will contain 3 random characters and be prefixed with '$Distro-'.
    # This name will only be used if the -InstanceName parameter has not been specified.
    Do {
      $tmpname_exist = $false
      foreach ($i in $inst_list) {
        if ($i.ID -eq "$TmpName") { $tmpname_exist = $true }
      }
      if ( $tmpname_exist -eq $true ) { $TmpName = -join ((65..90) + (97..122) | Get-Random -Count 3 | ForEach-Object { [char]$_ }) }
    } until ($tmpname_exist -eq $false)

    Write-IfNotSilent "Creating instance $Distro-$TmpName (Using $Distro $Release and WSL$Version)...."
    wsl.exe --import $Distro-$TmpName "$HomePath\.wslgen\$Distro-$TmpName" "$HomePath\.wslgen\.tarball\$Release-amd64.tar.gz"

    if (-not (wsl.exe --set-version $Distro-$TmpName $Version)) {
      Write-IfNotSilent "You are using a system that does not support WSL2, keep in WSL1"
    }

    if ($EnableSource) {
      Write-IfNotSilent "Enabling $Distro source repository...."
      Write-IfNotSilent "-NoUpdate will be ignored if passed"
      wsl.exe -d ubuntu-$TmpName sed -i `"s`|`# deb-src`|deb-src`|g`" /etc/apt/sources.list
    }

    if ($EnableProposed) {
      Write-IfNotSilent "Enabling $Distro Proposed repository...."
      Write-IfNotSilent "-NoUpdate will be ignored if passed"
      wsl.exe -d $Distro-$TmpName echo -e `"`# Enable $Distro proposed archive\ndeb http`://archive.ubuntu.com/ubuntu/ `$`(lsb_release `-cs`)-proposed restricted main multiverse universe`" `> /etc/apt/sources.list.d/ubuntu-`$`(lsb_release `-cs`)-proposed.list
      if ( $SysArchName -eq "arm64" ) {
        wsl.exe -d $Distro-$TmpName echo -e `"`# Enable $Distro proposed archive\ndeb http`://ports.ubuntu.com/ubuntu-ports `$`(lsb_release `-cs`)-proposed restricted main multiverse universe`" `> /etc/apt/sources.list.d/ubuntu-`$`(lsb_release `-cs`)-proposed.list
      }
      if (-not $DisableSelective) {
        wsl.exe -d $Distro-$TmpName echo -e `"`# Configure apt to allow selective installs of packages `from proposed\nPackage: `*\nPin`: release a`=`$`(lsb_release `-cs`)-proposed\nPin-Priority`: 400`" `>`> /etc/apt/preferences.d/proposed-updates
      }
    }

    $quiet_param = Stop-Writing

    if ( -not $NoUpdate -or ($EnableSource -or $EnableProposed) ) {
      Write-IfNotSilent "Updating $Distro-$TmpName. This may take some time. Please wait..."
      wsl.exe -d $Distro-$TmpName apt-get update $quiet_param | Out-Null
      if (-not $NoUpgrade){
        wsl.exe -d $Distro-$TmpName apt-get upgrade -y $quiet_param | Out-Null
      }
    }

    if ((-not $RootOnly) -or (-not $NonInteractive)) {
      Write-IfNotSilent "Creating user '$env:USERNAME' for $Distro-$TmpName...."
      wsl.exe -d $Distro-$TmpName /usr/sbin/useradd -m -s "/bin/bash" $env:USERNAME
      wsl.exe -d $Distro-$TmpName passwd -q -d $env:USERNAME
      wsl.exe -d $Distro-$TmpName echo `"$env:USERNAME ALL=`(ALL`:ALL`) NOPASSWD: ALL`" `| tee -a /etc/sudoers.d/$env:USERNAME `>/dev/null
      wsl.exe -d $Distro-$TmpName /usr/sbin/usermod -a -G adm, dialout, cdrom, floppy, sudo, audio, dip, video, plugdev, netdev $env:USERNAME
    }

    if ($AdditionalPPA) {
      $ppa_array = $AdditionalPPA -split ","

      foreach ($appa in $ppa_array) {
        Write-IfNotSilent "Adding additional PPA '$appa'...."
        wsl.exe -d ubuntu-$TmpName /usr/bin/apt-add-repository -y "ppa:$appa" | Out-Host
        wsl.exe -d ubuntu-$TmpName apt-get update $quiet_param | Out-Host
        wsl.exe -d ubuntu-$TmpName apt-get upgrade -y $quiet_param | Out-Host
      }
    }

    if ($AdditionalPkg) {
      $pkg_array = $AdditionalPkg -split ","
      foreach ($apkg in $pkg_array) {
        Write-IfNotSilent "Adding package '$apkg'...."
        wsl.exe -d ubuntu-$TmpName apt-get install $quiet_param -y $apkg | Out-Host
      }
    }
    if ( -not $RootOnly ) {
      $tmp_dis_name = (Get-ChildItem HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss\ | Get-ItemProperty | Where-Object { $_.'DistributionName' -eq "$Distro-$TmpName" })[0].PSChildName
      Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss\$tmp_dis_name" -Name DefaultUid -Value 1000 -Force
    }
    Write-IfNotSilent "Distribution $TmpName is ready for use. Use 'wsl.exe -d $Distro-$TmpName' to launch."
    if ($NonInteractive) {
      return "$TmpName"
    }
  }
}
#endregion

#region Remove-WSLInstance
function Remove-WSLInstance {
  <#
    .SYNOPSIS
        Unregisters a specific distro instance on WSL.
    .DESCRIPTION
        Unregisters a specific distro instance on WSL.
    .PARAMETER Id
        The ID of the instance. This would be the numbers or letters after the distro prefix - ie. for instance "ubuntu-123", the ID would be "123".
    .EXAMPLE
        Remove-WSLInstance -Id 123

        Unregisters an instance called "ubuntu-123".
    .EXAMPLE
        Remove-WSLInstance -Id myInstanceName

        Unregisters an instance called "ubuntu-myInstanceName".
    .LINK
        https://github.com/mikenelson-io/WslGen
    #>
  [cmdletbinding()]
  Param (
    [Parameter(Mandatory = $true)]
    [string]$Id
  )
  Process {
    $HomePath = $env:HOME
    if (-not $HomePath) {
      $HomePath = "$($env:HOMEDRIVE)$($env:HOMEPATH)"
    }

    if ( -not ( Get-ChildItem "$HomePath\.wslgen" | Select-String "$Id" ) ) {
      throw [System.IO.FileNotFoundException] "$Id not found."
    }

    Write-Host "# Removing instance $Distro-$Id..." -ForegroundColor DarkYellow

    Write-Host "# Terminating instance $Distro-$Id..." -ForegroundColor DarkYellow
    wsl.exe -t ubuntu-$Id
    Write-Host "# Unregistering instance $Distro-$Id..." -ForegroundColor DarkYellow
    wsl.exe --unregister $Distro-$Id
    Write-Host "# Cleanup..." -ForegroundColor DarkYellow
    Remove-Item "$HomePath\.wslgen\$Distro-$Id" -Force -Recurse
    Remove-Item "$Env:AppData\Microsoft\Windows\Start Menu\Programs\$Distro-$Id" -Force -Recurse -ErrorAction SilentlyContinue

    Write-Host "# Removed instance $Distro-$Id." -ForegroundColor DarkYellow
  }
}
#endregion

#region remove-AllDistroInstances
function Remove-AllDistroWSLInstances {
  <#
    .SYNOPSIS
        Unregister all instances of a distro on WSL.
    .DESCRIPTION
        Unregister all instances of a distro on WSL.
    .PARAMETER Distro
        The name of the distribution. The default is "Ubuntu". Allowed Distro names:
        "Ubuntu"
    .EXAMPLE
        Remove-AllDistroWSLInstances -Distro "Ubuntu"

        Unregsiter all Ubuntu instances from WSL.
    .LINK
        https://github.com/mikenelson.io/WslGen
    #>
  [cmdletbinding()]
  Param (
    [Parameter(Mandatory = $false)]
    [string]$Distro = 'Ubuntu'
  )
  $HomePath = $env:HOME
  if (-not $HomePath) {
    $HomePath = "$($env:HOMEDRIVE)$($env:HOMEPATH)"
  }

  Write-Host "# Removing all instances..." -ForegroundColor DarkYellow
  $DistroList = @(Get-ChildItem "$HomePath\.wslgen" -Filter $Distro-*)
  Foreach ($i in $DistroList) {
    Remove-UbuntuWSLInstance -Id ($i.BaseName).split('-')[1]
  }
  Write-Host "# Removed all instances." -ForegroundColor DarkYellow
}
#endregion

Export-ModuleMember -Function New-WSLInstance
Export-ModuleMember -Function Remove-WSLInstance
Export-ModuleMember -Function Remove-AllDistroWSLInstances