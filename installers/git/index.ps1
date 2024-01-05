# link .gitconfig
Remove-Item "$env:USERPROFILE\.gitconfig"
New-Item -Path "$env:USERPROFILE\.gitconfig" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.config\git\config"

Push-Location "$env:USERPROFILE\.dotfiles"
# change from http to ssh
git remote remove origin
git remote add origin git@github.com:Eythaann/.dotfiles.git

# link .ssh
Remove-Item "$env:USERPROFILE\.ssh"
mkdir ".ssh"
New-Item -Path "$env:USERPROFILE\.ssh" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.ssh"
Pop-Location

# configuring ssh
ssh-keygen -t ed25519

Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Start-Service ssh-agent

ssh-add "$Env:USERPROFILE\.dotfiles\.ssh\id_ed25519"

winget install --id GitHub.cli
gh auth login
gh auth refresh -h github.com -s admin:ssh_signing_key

$sshKeyListTable = gh ssh-key list | ConvertFrom-String -PropertyNames "Title", "KeyType", "Key", "Added", "Id", "Type"
foreach ($entry in $sshKeyListTable) {
  if ($entry.Type -eq "authentication") {
    gh ssh-key delete $entry.Id -y
  }
}

gh ssh-key add "$Env:USERPROFILE\.dotfiles\.ssh\id_ed25519.pub" --title AuthKey --type authentication
gh ssh-key add "$Env:USERPROFILE\.dotfiles\.ssh\id_ed25519.pub" --title SingKey --type signing