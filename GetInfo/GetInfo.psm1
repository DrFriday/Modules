function Get-Info {

    $info_file = ".info.md"

    if(Test-Path $info_file)
    {
        ConvertFrom-Markdown -Path $info_file -AsVT100EncodedString | Show-Markdown
    }

    Get-ChildItem .
}
New-Alias -Name li -Value Get-Info

# -- Exporting --
Export-ModuleMember -Function Get-Info -Alias li
