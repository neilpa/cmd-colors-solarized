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
    $options.ContinuationPromptForegroundColor = 'Yellow'
    $options.DefaultTokenForegroundColor = 'Yellow'
    $options.EmphasisForegroundColor = 'DarkCyan'
    $options.ErrorForegroundColor = 'DarkRed'
    $options.KeywordForegroundColor = 'DarkGreen'
    $options.MemberForegroundColor = 'Green'
    $options.NumberForegroundColor = 'Green'
    $options.OperatorForegroundColor = 'Cyan'
    $options.ParameterForegroundColor = 'Cyan'
    $options.StringForegroundColor = 'DarkBlue'
    $options.TypeForegroundColor = 'Blue'
    $options.VariableForegroundColor = 'DarkGreen'

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
