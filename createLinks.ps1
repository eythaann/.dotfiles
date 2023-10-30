Remove-Item "$env:USERPROFILE\.gitconfig"
New-Item -Path "$env:USERPROFILE\.gitconfig" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.gitconfig"

Remove-Item "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
New-Item -Path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\WTerminalSettings.json"

$startup = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
Remove-Item "$startup\shortcuts.ahk"
New-Item -Path "$startup\shortcuts.ahk" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\AutoHotKeys\index.ahk"

Remove-Item "$env:USERPROFILE\Documents\My Games"
New-Item -Path "$env:USERPROFILE\Documents\My Games" -ItemType SymbolicLink -Value "$env:USERPROFILE\OneDrive\Documents\_BadImplementedDocsRoute\My Games"

New-Item -Path "$env:USERPROFILE\.vscode\extensions\DeepType-Theme" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\DeepType-Theme"