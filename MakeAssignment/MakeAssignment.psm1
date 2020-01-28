# Adapted from 
# https://stackoverflow.com/a/41084586
function New-AssignmentZip {
    param (
        [Parameter(Mandatory = $true)]
        [string] $ZipFileName,
        [string] $DirToZip = "."
    )

    $destDirName = 'zipped-assignment'
    $fullDestPath = $DirToZip + '/' + $destDirName

    if (!(Test-Path $fullDestPath)) {
        New-Item -ItemType Directory -Path $fullDestPath
    }

    $extensionsToExclude = @('*.pyc')

    $namesToExclude = @('.git', '.gradle', '.travis', '.travis.yml',
        '.gitignore', 'node_modules', '__pycache__', $destDirName)

    $zipFileReslt = $fullDestPath + '/' + $ZipFileName

    Get-ChildItem $DirToZip -Exclude $extensionsToExclude | 
    Where-Object { $_.Name -notin $namesToExclude } | 
    Compress-Archive -DestinationPath $zipFileReslt -Update;

    Write-Host ('Output written to: {0}' -f $zipFileReslt)
}

New-Alias -Name assnzip -Value New-AssignmentZip

Export-ModuleMember -Function New-AssignmentZip -Alias assnzip