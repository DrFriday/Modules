function Move-ToShortcut {

    param (
        [string] $Nickname,
        [string] $AddNickname,
        [string] $AddPath
    )

    $possible_directories = $ENV:PSModulePath.Split(";")

    if ($Nickname) {
        foreach ($dir in $possible_directories) {
            $file_path = $dir.ToString() + '\Shortcuts\data.json'
            
            if (Test-Path $file_path) {
                $json_data = Get-Content $file_path | ConvertFrom-Json
                
                foreach ($data in $json_data) {
                    if ($Nickname -eq $data.nickname) {
                        Set-Location -Path $data.path
                        
                        return
                    }
                }
            }
        }
    }
    
    if ($AddNickname -and $AddPath) {
        foreach ($dir in $possible_directories) {
            $file_path = $dir.ToString() + '\Shortcuts\data.json'
            
            if (Test-Path $file_path) {
                $old_data = Get-Content $file_path | ConvertFrom-Json -AsHashtable

                $new_item = [pscustomobject]@{
                    Nickname = $AddNickname
                    Path     = $AddPath
                }

                $new_data = $old_data + $new_item

                $new_data | Select-Object * | Export-Csv -Path "./data.csv"
            }
        }
    }
}

New-Alias -Name msc -Value Move-ToShortcut

Export-ModuleMember -Function Move-ToShortcut -Alias msc