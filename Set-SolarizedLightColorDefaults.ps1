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
    $options = Get-PSReadlineOption

    # Foreground
    $options.CommandForegroundColor = 'Yellow'
    $options.ContinuationPromptForegroundColor = 'DarkYellow'
    $options.DefaultTokenForegroundColor = 'DarkYellow'
    $options.EmphasisForegroundColor = 'Cyan'
    $options.ErrorForegroundColor = 'Red'
    $options.KeywordForegroundColor = 'Green'
    $options.MemberForegroundColor = 'DarkGreen'
    $options.NumberForegroundColor = 'DarkGreen'
    $options.OperatorForegroundColor = 'DarkCyan'
    $options.ParameterForegroundColor = 'DarkCyan'
    $options.StringForegroundColor = 'Blue'
    $options.TypeForegroundColor = 'DarkBlue'
    $options.VariableForegroundColor = 'Green'

    # Background
    $options.CommandBackgroundColor = 'White'
    $options.ContinuationPromptBackgroundColor = 'White'
    $options.DefaultTokenBackgroundColor = 'White'
    $options.EmphasisBackgroundColor = 'White'
    $options.ErrorBackgroundColor = 'White'
    $options.KeywordBackgroundColor = 'White'
    $options.MemberBackgroundColor = 'White'
    $options.NumberBackgroundColor = 'White'
    $options.OperatorBackgroundColor = 'White'
    $options.ParameterBackgroundColor = 'White'
    $options.StringBackgroundColor = 'White'
    $options.TypeBackgroundColor = 'White'
    $options.VariableBackgroundColor = 'White'
}
