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
    if (-not $options){ $options = Get-PSReadlineOption }
	if ([System.Version](Get-Module PSReadline).Version -lt [System.Version]"2.0.0") {
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
	} else {
		# New version of PSReadline renames Foreground colors and eliminates Background
		$options.CommandColor = 'Yellow'
		$options.ContinuationPromptColor = 'DarkYellow'
		$options.DefaultTokenColor = 'DarkYellow'
		$options.EmphasisColor = 'Cyan'
		$options.ErrorColor = 'Red'
		$options.KeywordColor = 'Green'
		$options.MemberColor = 'DarkGreen'
		$options.NumberColor = 'DarkGreen'
		$options.OperatorColor = 'DarkCyan'
		$options.ParameterColor = 'DarkCyan'
		$options.StringColor = 'Blue'
		$options.TypeColor = 'DarkBlue'
		$options.VariableColor = 'Green'
	}
}
