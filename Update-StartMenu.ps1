param(
    [Parameter()]
    [ValidateSet('Light','Dark')]
    [string]$theme = 'Dark'
)

Write-Host "Updating PowerShell shortcuts on the Start Menu"

$appdataFolder = $env:APPDATA
$startFolder = resolve-path "$appdataFolder\Microsoft\Windows\Start Menu"
$powerShellFolder = resolve-path "$startFolder\Programs\Windows PowerShell"

Write-Host "Looking in $powerShellFolder"

Write-Host
$powerShellx86 = "$powerShellFolder\Windows PowerShell (x86).lnk"
if (test-path $powerShellx86) {
    Write-Host "Updating $powerShellx86"
    .\Update-Link.ps1 $powerShellx86 $theme
} else {
    Write-Warning "Didn't find $powerShellx86"
}

Write-Host
$powerShell64 = "$powerShellFolder\Windows PowerShell.lnk" 
if (test-path $powerShell64) {
    Write-Host "Updating $powerShell64"
    .\Update-Link.ps1 $powerShell64 $theme
} else {
    Write-Warning "Didn't find $powerShell64"
}
