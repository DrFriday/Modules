Function Move-ToShortcut {

    param (
        [string] $Nickname
    )

    $possible_directories = $ENV:PSModulePath.Split(";")

    foreach($dir in $possible_directories) {
        $file_path = $dir.ToString() + '\Shortcuts\data.json'

        if(Test-Path $file_path) {
            Write-Host "Found the file!"

            $json_data = Get-Content $file_path | ConvertFrom-Json

            Write-Host $json_data[0]

            foreach($data in $json_data) {
                if ($Nickname -eq $data.nickname) {
                    Set-Location -Path $data.path
                }
            }
        }
        else {
            Write-Host "Didn't find the file"
        }

        Write-Host "Looking in " -NoNewline
        Write-Host $file_path
    }
}

New-Alias -Name msc -Value Shortcuts

Export-ModuleMember -Function Move-ToShortcut -Alias msc