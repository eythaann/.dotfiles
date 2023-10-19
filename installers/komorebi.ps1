Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

winget install LGUG2Z.komorebi
Add-Path "C:\Program Files\komorebi\bin"

Write-Host "`nScheduling on Start"
$taskName = "KomorebiStart"
$scriptPath = "$env:USERPROFILE\.dotfiles\komorebi\start.ps1"

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-WindowStyle Hidden -ExecutionPolicy Bypass -File $scriptPath"
$trigger = New-ScheduledTaskTrigger -AtLogon
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries $true -DontStopIfGoingOnBatteries $true

Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -TaskName $taskName -User $env:USERNAME

Write-Host "`nStarting Komorebi"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\komorebi\start.ps1"