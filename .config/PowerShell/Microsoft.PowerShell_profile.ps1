<# function Add-Path {
  param (
    [string]$PathToAdd
  )

  $envPathSystem = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)
  if (-not $envPathSystem.Contains($PathToAdd)) {
    $newPathSystem = $envPathSystem + ";" + $PathToAdd
    [System.Environment]::SetEnvironmentVariable("PATH", $newPathSystem, [EnvironmentVariableTarget]::Machine)
  }

  $envPathUser = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
  if (-not $envPathUser.Contains($PathToAdd)) {
    $newPathUser = $envPathUser + ";" + $PathToAdd
    [System.Environment]::SetEnvironmentVariable("PATH", $newPathUser, [EnvironmentVariableTarget]::User)
  }
} #>

function Save-Config {
  Set-Location "$env:USERPROFILE\.dotfiles"
  git add --all
  git commit -m "save"
  git push
}
Set-Alias -Name saveconfig -Value Save-Config

function Open-Config {
  code "$env:USERPROFILE\.dotfiles"
}
Set-Alias -Name settings -Value Open-Config

function Add-WSLPort {
  if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    $scriptBlock = {
      Add-WSLPort
      Write-Host "Press any key to close..."
      [Console]::ReadKey() > $null
    }
  
    Start-Process pwsh -ArgumentList "-Command $scriptBlock" -Verb RunAs
    return
  }

  $Port = Read-Host "Port"

  $wslAddress = bash.exe -c "ifconfig eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
  if ($wslAddress -match '^(\d{1,3}\.){3}\d{1,3}$') {
    Write-Host "WSL IP address: $wslAddress" -ForegroundColor Green
  }
  else {
    Write-Host "Error: Could not find WSL IP address." -ForegroundColor Red
    return
  }

  $listenAddress = '0.0.0.0';

  netsh interface portproxy delete v4tov4 listenport=$Port listenaddress=$listenAddress
  netsh interface portproxy add v4tov4 listenport=$Port listenaddress=$listenAddress connectport=$Port connectaddress=$wslAddress

  $fireWallDisplayName = "WSL Port: $Port"

  Remove-NetFireWallRule -DisplayName $fireWallDisplayName
  New-NetFireWallRule -DisplayName $fireWallDisplayName -Direction Outbound -LocalPort $Port -Action Allow -Protocol TCP
  New-NetFireWallRule -DisplayName $fireWallDisplayName -Direction Inbound -LocalPort $Port -Action Allow -Protocol TCP

  Write-Host "Port $Port has been bound to WSL."
}

function GitFetch { git fetch }
Set-Alias -Name gf -Value GitFetch

function GitPull { git pull }
Set-Alias -Name gp -Value GitPull -Force

function GitSwitchC { git switch -c $args[0] }
Set-Alias -Name gsc -Value GitSwitchC

function GitStash { git stash }
Set-Alias -Name gst -Value GitStash

function GitCommit { git commit }
Set-Alias -Name gc -Value GitCommit -Force

function GitCommitAmend { git commit --amend --no-edit }
Set-Alias -Name gca -Value GitCommitAmend

function GitCommitM { git commit -m $args[0] }
Set-Alias -Name gcm -Value GitCommitM -Force

function GitResetSoft { git reset --soft }
Set-Alias -Name grs -Value GitResetSoft

function GitResetHard { git reset --hard }
Set-Alias -Name grh -Value GitResetHard

function GitPushOriginHead { git push origin HEAD }
Set-Alias -Name gps -Value GitPushOriginHead -Force

function GitPushForce { git push origin HEAD --no-verify -f }
Set-Alias -Name gpsf -Value GitPushForce


# VARIABLES
$Env:KOMOREBI_CONFIG_HOME = '~\.config\komorebi'

# FINISH
oh-my-posh init pwsh --config '~\.config\OhMyPosh\theme.json' | Invoke-Expression

Clear-Host