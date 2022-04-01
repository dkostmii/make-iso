# make-iso

Create ISO-file from directory

Directory, contents of which put to new ISO-file. Requires `mkisofs` utility, which is shipped with WinCDEmu build. Dowload it [here](https://github.com/sysprogs/WinCDEmu/releases)

Make sure to append `C:\Program Files (x86)\WinCDEmu\` to **PATH**:

- execute the following command (with administrative privileges if needed):
    ```
    rundll32.exe sysdm.cpl,EditEnvironmentVariables
    ```

- find **PATH** variable and add mentioned `WinCDEmu` directory

## Requirements

- [PowerShell Core v7](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows)
- [WinCDEmu](https://github.com/sysprogs/WinCDEmu/releases)
