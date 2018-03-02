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
# Solarized Colors: http://ethanschoonover.com/solarized
# NOTE: These are not the same as for the command prompt.
#                                  | Solarized | PowerShell  |
#----------------------------------|-----------|-------------|
$lnk.ConsoleColors[00] = "#002b36" # base03    | Black       |
$lnk.ConsoleColors[08] = "#073642" # base02    | DarkGray    |
$lnk.ConsoleColors[02] = "#586e75" # base01    | DarkGreen   |
$lnk.ConsoleColors[06] = "#657b83" # base00    | DarkYellow  |
$lnk.ConsoleColors[01] = "#839496" # base0     | DarkBlue    |
$lnk.ConsoleColors[03] = "#93a1a1" # base1     | DarkCyan    |
$lnk.ConsoleColors[07] = "#eee8d5" # base2     | Gray        |
$lnk.ConsoleColors[15] = "#fdf6e3" # base3     | White       |
$lnk.ConsoleColors[14] = "#b58900" # yellow    | Yellow      |
$lnk.ConsoleColors[04] = "#cb4b16" # orange    | DarkRed     |
$lnk.ConsoleColors[12] = "#dc322f" # red       | Red         |
$lnk.ConsoleColors[13] = "#d33682" # magenta   | Magenta     |
$lnk.ConsoleColors[05] = "#6c71c4" # violet    | DarkMagenta |
$lnk.ConsoleColors[09] = "#268bd2" # blue      | Blue        |
$lnk.ConsoleColors[11] = "#2aa198" # cyan      | Cyan        |
$lnk.ConsoleColors[10] = "#859900" # green     | Green       |

# Set Light/Dark Theme-Specific Colors
if ($Theme -eq "Dark") {
    $lnk.ScreenBackgroundColor=0  # base03
    $lnk.ScreenTextColor=1        # base0
    $lnk.PopUpBackgroundColor=8   # base02
    $lnk.PopUpTextColor=3         # base1
} else {
    $lnk.ScreenBackgroundColor=15 # base3
    $lnk.ScreenTextColor=1        # base0
    $lnk.PopUpBackgroundColor=7   # base2
    $lnk.PopUpTextColor=3         # base1
}

$lnk.Save()

Write-Host "Updated $Path to Solarized - $Theme"
