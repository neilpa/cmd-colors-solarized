# Host Foreground
$Host.PrivateData.ErrorForegroundColor = 'Red'
$Host.PrivateData.WarningForegroundColor = 'Yellow'
$Host.PrivateData.DebugForegroundColor = 'Green'
$Host.PrivateData.VerboseForegroundColor = 'Blue'
$Host.PrivateData.ProgressForegroundColor = 'Gray'

# Host Background
$Host.PrivateData.ErrorBackgroundColor = 'DarkGray'
$Host.PrivateData.WarningBackgroundColor = 'DarkGray'
$Host.PrivateData.DebugBackgroundColor = 'DarkGray'
$Host.PrivateData.VerboseBackgroundColor = 'DarkGray'
$Host.PrivateData.ProgressBackgroundColor = 'Cyan'

# Check for PSReadline
if (Get-Module -ListAvailable -Name "PSReadline") {
    Set-PSReadLineOption -Colors @{ 
        "Command"            = [ConsoleColor]::Yellow
        "ContinuationPrompt" = [ConsoleColor]::DarkBlue
        "DefaultToken"       = [ConsoleColor]::DarkBlue
        "Emphasis"           = [ConsoleColor]::Cyan
        "Error"              = [ConsoleColor]::Red
        "Keyword"            = [ConsoleColor]::Green
        "Member"             = [ConsoleColor]::DarkCyan
        "Number"             = [ConsoleColor]::DarkCyan
        "Operator"           = [ConsoleColor]::DarkGreen
        "Parameter"          = [ConsoleColor]::DarkGreen
        "String"             = [ConsoleColor]::Blue
        "Type"               = [ConsoleColor]::DarkYellow
        "Variable"           = [ConsoleColor]::Green
    }
}
