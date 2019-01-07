# Host Foreground
$Host.PrivateData.ErrorForegroundColor = 'Red'
$Host.PrivateData.WarningForegroundColor = 'Yellow'
$Host.PrivateData.DebugForegroundColor = 'Green'
$Host.PrivateData.VerboseForegroundColor = 'Blue'
$Host.PrivateData.ProgressForegroundColor = 'Gray'

# Host Background
$Host.PrivateData.ErrorBackgroundColor = 'Gray'
$Host.PrivateData.WarningBackgroundColor = 'Gray'
$Host.PrivateData.DebugBackgroundColor = 'Gray'
$Host.PrivateData.VerboseBackgroundColor = 'Gray'
$Host.PrivateData.ProgressBackgroundColor = 'Cyan'

# Check for PSReadline
if (Get-Module -ListAvailable -Name "PSReadline") {
    Set-PSReadLineOption -Colors @{
        "Command"            = [ConsoleColor]::Yellow
        "ContinuationPrompt" = [ConsoleColor]::DarkYellow
        "DefaultToken"       = [ConsoleColor]::DarkYellow
        "Emphasis"           = [ConsoleColor]::Cyan
        "Error"              = [ConsoleColor]::Red
        "Keyword"            = [ConsoleColor]::Green
        "Member"             = [ConsoleColor]::DarkGreen
        "Number"             = [ConsoleColor]::DarkGreen
        "Operator"           = [ConsoleColor]::DarkCyan
        "Parameter"          = [ConsoleColor]::DarkCyan
        "String"             = [ConsoleColor]::Blue
        "Type"               = [ConsoleColor]::DarkBlue
        "Variable"           = [ConsoleColor]::Green
    }
}
