<#
    .SYNOPSIS
    Create ISO-file from directory

    .PARAMETER SourceDir
    Directory, contents of which put to new ISO-file

    .PARAMETER Output
    The name of new ISO-file. Default is image.iso

    .INPUTS
    None.

    .OUTPUTS
    Displays output from mkisofs utility

    .EXAMPLE
    PS> .\Make-ISO.ps1 -SourceDir HelloWorld

    .EXAMPLE
    PS> .\Make-ISO.ps1 -SourceDir HelloWorld -Output HelloWorld.iso
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$SourceDir,
    [string]$Output = "image.iso"
)

if ( -not (Test-Path $SourceDir) ) {
    throw "$SourceDir directory does not exist"
    exit 1
}

if (Test-Path $SourceDir -PathType Leaf) {
    throw "Expected SourceDir to be directory. Got file: $SourceDir"
    exit 1
}

if (Test-Path $Output -PathType Leaf) {
    $proceed = ((Read-Host -Prompt "Do you want to replace file $Output? [y/N]: ").ToLower() -eq "y")
    
    if ( -not $proceed ) {
        exit 0
    }

    Remove-Item $Output | Out-Null
}

mkisofs -o $Output -J -R -l $SourceDir
