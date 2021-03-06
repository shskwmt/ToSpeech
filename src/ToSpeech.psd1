###
# Author: shskwmt
###

@{

    # Script module or binary module file associated with this manifest.
    RootModule = 'ToSpeech.psm1'

    # このモジュールのバージョン番号です。
    ModuleVersion = '0.1.0'

    # ID used to uniquely identify this module
    GUID = 'eb40dad1-3417-4168-a234-171741537973'

    # Author of this module
    Author = 'shskwmt'

    # Copyright statement for this module
    Copyright = '(c) 2020 shskwmt. All rights reserved.'

    # Description of the functionality provided by this module
    Description = 'PowerShell functions to speech.'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.1'


    # Functions to export from this module
    FunctionsToExport = '*'

    # Cmdlets to export from this module
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = '*'


    # Aliases to export from this module
    AliasesToExport = @()


    # Private data to pass to the module specified in RootModule/ModuleToProcess.
    # This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{
        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @('Virtualbox')

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            # ProjectUri = ''

            # ReleaseNotes of this module
            # ReleaseNotes = ''
        }
    }
}
