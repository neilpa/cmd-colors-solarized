# Host Foreground
$Host.PrivateData.ErrorForegroundColor = 'DarkRed'
$Host.PrivateData.WarningForegroundColor = 'DarkYellow'
$Host.PrivateData.DebugForegroundColor = 'DarkGreen'
$Host.PrivateData.VerboseForegroundColor = 'DarkBlue'
$Host.PrivateData.ProgressForegroundColor = 'Gray'

# Host Background
$Host.PrivateData.ErrorBackgroundColor = 'Black'
$Host.PrivateData.WarningBackgroundColor = 'Black'
$Host.PrivateData.DebugBackgroundColor = 'Black'
$Host.PrivateData.VerboseBackgroundColor = 'Black'
$Host.PrivateData.ProgressBackgroundColor = 'DarkCyan'

# Check for PSReadline
if (Get-Module -ListAvailable -Name "PSReadline") {
    $options = Get-PSReadlineOption

    # Foreground
    $options.CommandForegroundColor = 'DarkYellow'
    $options.ContinuationPromptForegroundColor = 'Blue'
    $options.DefaultTokenForegroundColor = 'Blue'
    $options.EmphasisForegroundColor = 'DarkCyan'
    $options.ErrorForegroundColor = 'DarkRed'
    $options.KeywordForegroundColor = 'DarkGreen'
    $options.MemberForegroundColor = 'Cyan'
    $options.NumberForegroundColor = 'Cyan'
    $options.OperatorForegroundColor = 'Green'
    $options.ParameterForegroundColor = 'Green'
    $options.StringForegroundColor = 'DarkBlue'
    $options.TypeForegroundColor = 'Yellow'
    $options.VariableForegroundColor = 'DarkGreen'

    # Background
    $options.CommandBackgroundColor = 'DarkGray'
    $options.ContinuationPromptBackgroundColor = 'DarkGray'
    $options.DefaultTokenBackgroundColor = 'DarkGray'
    $options.EmphasisBackgroundColor = 'DarkGray'
    $options.ErrorBackgroundColor = 'DarkGray'
    $options.KeywordBackgroundColor = 'DarkGray'
    $options.MemberBackgroundColor = 'DarkGray'
    $options.NumberBackgroundColor = 'DarkGray'
    $options.OperatorBackgroundColor = 'DarkGray'
    $options.ParameterBackgroundColor = 'DarkGray'
    $options.StringBackgroundColor = 'DarkGray'
    $options.TypeBackgroundColor = 'DarkGray'
    $options.VariableBackgroundColor = 'DarkGray'
}
