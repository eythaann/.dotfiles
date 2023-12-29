
winget install JanDeDobbeleer.OhMyPosh -s winget
Write-Host "\nInstalling oh my posh"
winget install JanDeDobbeleer.OhMyPosh -s winget

# Windows Terminal Settings
Write-Host "\nLinking Terminal Configurations"
Remove-Item "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
New-Item -Path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\WTerminalSettings.json"
