param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path $_})]
    [string]$Path,

    [Parameter()]
    [ValidateSet('Light','Dark')]
    [string]$Theme = 'Dark'
)

$lnk = & ("$PSScriptRoot\Get-Link.ps1") $Path

# Set Common Solarized Colors
$lnk.ConsoleColors[0]="#002b36"
$lnk.ConsoleColors[8]="#073642"
$lnk.ConsoleColors[2]="#586e75"
$lnk.ConsoleColors[6]="#657b83"
$lnk.ConsoleColors[1]="#839496"
$lnk.ConsoleColors[3]="#93a1a1"
$lnk.ConsoleColors[7]="#eee8d5"
$lnk.ConsoleColors[15]="#fdf6e3"
$lnk.ConsoleColors[14]="#b58900"
$lnk.ConsoleColors[4]="#cb4b16"
$lnk.ConsoleColors[12]="#dc322f"
$lnk.ConsoleColors[13]="#d33682"
$lnk.ConsoleColors[5]="#6c71c4"
$lnk.ConsoleColors[9]="#268bd2"
$lnk.ConsoleColors[11]="#2aa198"
$lnk.ConsoleColors[10]="#859900"

# Set Light/Dark Theme-Specific Colors
if ($Theme -eq "Dark") {
    $lnk.PopUpBackgroundColor=0xf
    $lnk.PopUpTextColor=0x6
    $lnk.ScreenBackgroundColor=0x0
    $lnk.ScreenTextColor=0x1
} else {
    $lnk.PopUpBackgroundColor=0x0
    $lnk.PopUpTextColor=0x1
    $lnk.ScreenBackgroundColor=0xf
    $lnk.ScreenTextColor=0x6
}

$lnk.Save()

Write-Host "Updated $Path to Solarized - $Theme"