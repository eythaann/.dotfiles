Remove-Item "$env:USERPROFILE\.gitconfig"
New-Item -Path "$env:USERPROFILE\.gitconfig" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.gitconfig"

Remove-Item "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
New-Item -Path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\WTerminalSettings.json"