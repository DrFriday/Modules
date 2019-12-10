# Modules

This is a directory of some of my powershell modules.

Much help taken from:
* https://stackoverflow.com/a/6040725.
* https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_modules?view=powershell-6

## How to use

1. Create new modules this folder

Should be places where powershell expects it. You can check this by running

    $ENV:PSModulePath

The folder and file name should be the same. E.x.:

    MyFunctions/MyFunctions.psm1

2. Import the module

Check to see that the modules is there,

    Get-Module -ListAvailable

and import it.

    Import-Module MyFunctions

To reimport the module, do

    Import-Module MyFunctions -Force

3. Check to see which commands you can run from your module


    Get-Command -module MyFunctions

## Dependencies

You need to have Powershell v6.2.2 (Thats what I have currently 8/19/2019).

    git clone https://github.com/PowerShell/PowerShell.git
