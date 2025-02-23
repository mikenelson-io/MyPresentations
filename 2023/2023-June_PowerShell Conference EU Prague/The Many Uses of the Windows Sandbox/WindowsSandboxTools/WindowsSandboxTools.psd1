#
# Module manifest for module 'WindowsSandboxTools'
#

@{

    RootModule           = 'WindowsSandboxTools.psm1'
    ModuleVersion        = '1.0.0'
    CompatiblePSEditions = @('Desktop', 'Core')
    GUID                 = '4b0d061c-4d96-4b84-a110-fd20447037cd'
    Author               = 'Jeff Hicks'
    CompanyName          = 'JDH Information Technology Solutions, Inc.'
    Copyright            = '(c) 2020-2022 JDH Information Technology Solutions, Inc.'
    Description          = 'A set of PowerShell tools for working with and managing the Windows Sandbox.'
    PowerShellVersion    = '5.1'
    RequiredModules      = @('BurntToast')
    # TypesToProcess = @()

    FormatsToProcess     = 'formats\wsbConfiguration.format.ps1xml'
    FunctionsToExport    = 'Start-WindowsSandbox', 'Get-WsbConfiguration',
    'New-WsbConfiguration', 'New-WsbMappedFolder','Export-WsbConfiguration'

    AliasesToExport      = 'wsb'

    PrivateData          = @{

        PSData = @{
            Tags       = @('wsb', 'WindowsSandbox')
            LicenseUri = 'https://github.com/jdhitsolutions/WindowsSandboxTools/blob/main/License.txt'
            ProjectUri = 'https://github.com/jdhitsolutions/WindowsSandboxTools'

            # IconUri = ''

            # ReleaseNotes = ''

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfoURI = ''

    # DefaultCommandPrefix = ''

}

