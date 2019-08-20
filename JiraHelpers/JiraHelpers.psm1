function Rh-Work {
    if (Test-Path variable:global:cred) {
        Get-JiraIssue -Query 'project = "RHD" AND assignee = currentuser() AND status != "done" ORDER BY status DESC' -Credential $cred
    } else {
        Write-Host "Please enter your Jira credentials"
        $cred = Get-Credential
        Rh-Work
    }
}
Export-ModuleMember -Function Rh-Work
