Write-Host "`nInstalling Customizations"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\Customizations.ps1"

Write-Host "`nInstalling fonts"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\Fonts.ps1"

Write-Host "`nInstalling apps"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\index.ps1"

Write-Host "`nCreating links to .dotfiles"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\createLinks.ps1"

Write-Host "`nInstalling WSL"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\WSL.ps1"