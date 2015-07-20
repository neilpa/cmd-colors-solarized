function Out-Colors()
{
    [enum]::GetValues([ConsoleColor]) | % {
        Write-Host -NoNewLine "$($_.value__) : $_`t"
        Write-Host "COLOR`t" -ForegroundColor $_ -NoNewLine
        Write-Host "`t" -BackgroundColor $_
    }
}
