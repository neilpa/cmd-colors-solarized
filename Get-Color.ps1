param([Switch] $Table)

# If -table exists, output a color list.
if ($Table){
    for ($bg = 0; $bg -lt 0x10; $bg++){
        for ($fg = 0; $fg -lt 0x10; $fg++){
            Write-Host -nonewline -background $bg -foreground $fg `
              (" {0:X}{1:X} " -f $bg,$fg)
        }
        Write-Host
    }
    exit
}

# Output the current colors as a string.
" {0:X}{1:X} " -f [Int] $HOST.UI.RawUI.BackgroundColor,
  [Int] $HOST.UI.RawUI.ForegroundColor