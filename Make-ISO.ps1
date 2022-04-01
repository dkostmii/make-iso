<#
    .SYNOPSIS
    Create ISO-file from directory

    .DESCRIPTION
    Script to create ISO-file from directory using open-source WinCDEmu utility for Windows. Requires mkisofs utility, which is shipped with WinCDEmu build.
    For more information check the README.md

    .PARAMETER SourceDir
    Directory, contents of which put to new ISO-file. 

    .PARAMETER Output
    The name of new ISO-file. Default is image.iso

    .INPUTS
    None.

    .OUTPUTS
    None.

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

try {
    Get-Command mkisofs -ErrorAction Stop | Out-Null
}
catch {
    Write-Host "mkisofs utility not found." -ForegroundColor Red
    Write-Host "Make sure that C:\Program Files (x86)\WinCDEmu\ is in the path.`nRead README.md for full information." -ForegroundColor Yellow
    exit 1
}

Write-Host "`nWriting $SourceDir to $Output image...`n" -ForegroundColor Green
mkisofs -o $Output -J -R -l $SourceDir

Write-Host "`nDone." -ForegroundColor Green
