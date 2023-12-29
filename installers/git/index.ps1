# link .gitconfig
Remove-Item "$env:USERPROFILE\.gitconfig"
New-Item -Path "$env:USERPROFILE\.gitconfig" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.gitconfig"

# configuring ssh
ssh-keygen -t ed25519

Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent

ssh-add "$Env:USERPROFILE\.dotfiles\.ssh\id_ed25519"

Get-Content "$Env:USERPROFILE\.dotfiles\.ssh\id_ed25519.pub" | clip

Write-Host "Copied RSA PUB on clipboard."

Remove-Item "$env:USERPROFILE\.ssh"
New-Item -Path "$env:USERPROFILE\.ssh" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.ssh"

Start-Process "https://github.com/settings/keys"

Pause "Did you add the key in github?"

# change from http to ssh
Push-Location "$env:USERPROFILE\.dotfiles"
git remote remove origin
git remote add origin git@github.com:Eythaann/.dotfiles.git
Pop-Location