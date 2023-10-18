winget install OpenJS.NodeJS.LTS -s winget

$nodePath = "C:\Program Files\nodejs"
$envPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)
if (-not $envPath.Contains($nodePath)) {
    $newPath = $envPath + ";" + $nodePath
    [System.Environment]::SetEnvironmentVariable("PATH", $newPath, [EnvironmentVariableTarget]::Machine)
}

winget install CoreyButler.NVMforWindows -s winget

$nvmPath = "C:\Users\dlmqc\AppData\Roaming\nvm"
if (-not $envPath.Contains($nvmPath)) {
    $newPath = $envPath + ";" + $nvmPath
    [System.Environment]::SetEnvironmentVariable("PATH", $newPath, [EnvironmentVariableTarget]::Machine)
}