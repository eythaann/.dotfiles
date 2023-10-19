Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

winget install LGUG2Z.komorebi

# Setting on Path
$komorebiPath = "C:\Program Files\komorebi\bin"
$envPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)
if (-not $envPath.Contains($komorebiPath)) {
    $newPath = $envPath + ";" + $komorebiPath
    [System.Environment]::SetEnvironmentVariable("PATH", $newPath, [EnvironmentVariableTarget]::Machine)
}

Write-Host "`nScheduled on Start"

$taskName = "KomorebiStart"
$scriptPath = "$env:USERPROFILE\.dotfiles\komorebi\start.ps1"

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-WindowStyle Hidden -ExecutionPolicy Bypass -File $scriptPath"
$trigger = New-ScheduledTaskTrigger -AtLogon
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries $true -DontStopIfGoingOnBatteries $true

Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -TaskName $taskName -User $env:USERNAME

Write-Host "`nStarting Komorebi"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\komorebi\start.ps1"