Remove-Item "$env:USERPROFILE\.gitconfig"
New-Item -Path "$env:USERPROFILE\.gitconfig" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.gitconfig"

Remove-Item "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
New-Item -Path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\WTerminalSettings.json"

Remove-Item "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\shortcuts.ahk"
New-Item -Path "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\shortcuts.ahk" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\scripts\shortcutsV2.ahk"

New-Item -Path "$env:USERPROFILE\.vscode\extensions\DeepType-Theme" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\DeepType-Theme"