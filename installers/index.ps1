# fancyWM for some shortcuts and title windows managment.
Write-Host "`nInstaling FancyWM"
winget install "fancywm" -s msstore

Write-Host "`nInstaling Firefox!!!"
winget install Mozilla.Firefox -s winget
winget install firefoxpwa

Write-Host "`nInstaling NordPass"
winget settings --enable InstallerHashOverride
winget install NordSecurity.NordPass --ignore-security-hash

Write-Host "`nInstaling Steam"
winget install Valve.Steam

Write-Host "`n--- Instaling Dev Tools ---"
Write-Host "`nInstaling VsCode"
winget install Microsoft.VisualStudioCode -s winget

# AHK (auto hot key) for the rest of the shortcuts.
Write-Host "`nInstaling Auto Hot key"
winget install "AutoHotkey" -s winget

Write-Host "`nInstaling NodeJs"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\nodejs.ps1"

Write-Host "`nInstaling Komorebi"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\komorebi.ps1"