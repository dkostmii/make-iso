```
NAME
    Make-ISO.ps1

SYNOPSIS
    Create ISO-file from directory


SYNTAX
    Make-ISO.ps1 [-SourceDir] <String> [[-Output] <String>] [<CommonParameters>]


DESCRIPTION


PARAMETERS
    -SourceDir <String>
        Directory, contents of which put to new ISO-file

        Required?                    true
        Position?                    1
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false

    -Output <String>
        The name of new ISO-file. Default is image.iso

        Required?                    false
        Position?                    2
        Default value                image.iso
        Accept pipeline input?       false
        Accept wildcard characters?  false

    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216).

INPUTS
    None.


OUTPUTS
    Displays output from mkisofs utility


    -------------------------- EXAMPLE 1 --------------------------

    PS>.\Make-ISO.ps1 -SourceDir HelloWorld






    -------------------------- EXAMPLE 2 --------------------------

    PS>.\Make-ISO.ps1 -SourceDir HelloWorld -Output HelloWorld.iso

```
