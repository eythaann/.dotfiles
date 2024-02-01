Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

git clone "git@github.com:eythaann/komorebi.git" "$Env:USERPROFILE\source\repos\komorebi"

Push-Location "~\source\repos\komorebi"
cargo build
Pop-Location


Write-Host "`nScheduling on Start"
$taskName = "KomorebiStart"
$command = "~\source\repos\komorebi\target\debug\komorebi.exe -c $Env:USERPROFILE\.config\komorebi\settings.json"

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-WindowStyle Hidden -Command $command"
$trigger = New-ScheduledTaskTrigger -AtLogon
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -Hidden

Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -TaskName $taskName -User $env:USERNAME -RunLevel Highest
Start-ScheduledTask -TaskName $taskName