# AHK script on startup
$startup = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
Remove-Item "$startup\shortcuts.ahk"
New-Item -Path "$startup\shortcuts.ahk" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\AutoHotKeys\index.ahk"

# Bad Docs Routes For Some Games
Remove-Item "$env:USERPROFILE\Documents\My Games"
New-Item -Path "$env:USERPROFILE\Documents\My Games" -ItemType SymbolicLink -Value "$env:USERPROFILE\OneDrive\Documents\_BadImplementedDocsRoute\My Games"

# Config Files
Remove-Item "$env:USERPROFILE\.config"
New-Item -Path "$env:USERPROFILE\.config" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.config"