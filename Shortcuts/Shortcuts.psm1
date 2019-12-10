function Move-ToShortcut {

    param (
        [string] $Nickname
    )

    $possible_directories = $ENV:PSModulePath.Split(";")

    foreach($dir in $possible_directories) {
        $file_path = $dir.ToString() + '\Shortcuts\data.json'

        if(Test-Path $file_path) {
            $json_data = Get-Content $file_path | ConvertFrom-Json

            foreach($data in $json_data) {
                if ($Nickname -eq $data.nickname) {
                    Set-Location -Path $data.path
                    
                    return
                }
            }
        }
    }
}

New-Alias -Name msc -Value Move-ToShortcut

Export-ModuleMember -Function Move-ToShortcut -Alias msc