Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

winget install LGUG2Z.komorebi

Write-Host "`nScheduling on Start"
$taskName = "KomorebiStart"
$command = "komorebi -c $Env:USERPROFILE\.config\komorebi\settings.json"

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-WindowStyle Hidden -Command $command"
$trigger = New-ScheduledTaskTrigger -AtLogon
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -Hidden

Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -TaskName $taskName -User $env:USERNAME -RunLevel Highest