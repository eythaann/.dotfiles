# fancyWM for some shortcuts and title windows managment.
Write-Host "\nInstaling FancyWM"
winget install "fancywm" -s msstore

# AHK (auto hot key) for the rest of the shortcuts.
Write-Host "\nInstaling Auto Hot key"
winget install "AutoHotkey" -s winget

Write-Host "\nInstaling VsCode"
winget install Microsoft.VisualStudioCode -s winget

Write-Host "\nInstaling Firefox!!!"
winget install "Mozilla Firefox" -s msstore
winget install firefoxpwa

Write-Host "\nInstaling Other Programs"
winget install NordPass
winget install Valve.Steam