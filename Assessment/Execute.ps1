$csv = Import-Csv C:\Assessment\serverlist.csv
foreach ($line in $csv) {
$Computer = $line.ServerName
Write-Host "Get Application Installed List " -NoNewline -ForegroundColor Red
Write-Host $Computer -NoNewline -ForegroundColor Red
Write-Host "..." -ForegroundColor Red
$session = New-PSSession –ComputerName $Computer
Invoke-Command -FilePath .\ApplicationInstalledList.ps1 -ComputerName $Computer > .\$Computer-ApplicationList.csv
Write-Host "Get HostFile " -NoNewline -ForegroundColor Red
Write-Host $Computer -NoNewline -ForegroundColor Red
Write-Host "..." -ForegroundColor Red
Invoke-Command -FilePath .\Hostfile.ps1 -ComputerName $Computer > .\$Computer-Hostfile.txt
$session | Remove-PSSession
Write-Host "Assess " -NoNewline -ForegroundColor Blue
Write-Host $Computer -ForegroundColor Blue
}
Write-Host "Finish Assessment!" -ForegroundColor Blue
