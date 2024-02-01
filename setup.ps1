function Next([string]$title) {
  Write-Host "`n============================================================================================"
  Write-Host "                                   $title"
  Write-Host "============================================================================================`n"
}

function Pause($message)
{
    # Check if running Powershell ISE
    if ($psISE)
    {
        Add-Type -AssemblyName System.Windows.Forms
        [System.Windows.Forms.MessageBox]::Show("$message")
    }
    else
    {
        Write-Host "$message" -ForegroundColor Yellow
        $host.ui.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
}

Next "Installing Customizations"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\customizations\index.ps1"

Next "Installing fonts"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\fonts\index.ps1"

Next "Configuring Git"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\git\index.ps1"

Next "Installing apps"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\apps\index.ps1"

Next "Others"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\others\index.ps1"

Next "Installing WSL"
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.dotfiles\installers\wsl\index.ps1"