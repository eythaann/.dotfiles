Write-Host "`nCreating Shh Keys"
ssh-keygen -t ed25519

Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent

ssh-add "$Env:USERPROFILE\.dotfiles\.ssh\id_ed25519"

Get-Content "$Env:USERPROFILE\.dotfiles\.ssh\id_ed25519.pub" | clip

Write-Host "Copied RSA PUB on clipboard."

Remove-Item "$env:USERPROFILE\.ssh"
New-Item -Path "$env:USERPROFILE\.ssh" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.ssh"

Start-Process "https://github.com/settings/keys"