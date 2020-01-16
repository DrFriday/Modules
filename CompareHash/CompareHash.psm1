function Compare-Hash {

    param (
        [Parameter(Mandatory = $true)]
        [string] $file,
        [Parameter(Mandatory = $true)]
        [string] $hash,
        [string] $algorithm = "SHA256"
    )

    $fileHash = Get-FileHash $file -Algorithm $algorithm

    if ($fileHash.Hash -ne $hash) {
        Write-Host ("Hashes are {0} the same" -f "NOT")
    }
    else {
        Write-Host ("Hashes are the same")
    }
}

New-Alias -Name ch -Value Compare-Hash

Export-ModuleMember -Function Compare-Hash -Alias ch