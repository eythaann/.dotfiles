Write-Host "`nInstaling Firefox adn Thunderbird"
winget install Mozilla.Firefox -s winget
winget install Mozilla.Thunderbird -s winget
#winget install firefoxpwa

Write-Host "`nInstaling KeePassXC"
winget install KeePassXCTeam.KeePassXC -s mstore

<# Write-Host "`nInstaling NordPass"
winget settings --enable InstallerHashOverride
winget install NordSecurity.NordPass --ignore-security-hash #>

Write-Host "`nInstaling Steam"
winget install Valve.Steam

Write-Host "`nInstaling VsCode"
winget install Microsoft.VisualStudioCode -s winget

Write-Host "`nInstaling Docker"
winget install Docker.DockerDesktop -s winget

Write-Host "`nInstaling Auto Hot key"
winget install "AutoHotkey" -s winget

Write-Host "`nInstaling Gpg"
winget install GnuPG.Gpg4win -s winget

Write-Host "`nInstaling NodeJs"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\nodejs.ps1"

Write-Host "`nInstaling Komorebi"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\komorebi.ps1"