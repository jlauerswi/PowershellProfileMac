$hostGui = $Host.UI.RawUI
$colors = $Host.PrivateData

$hostGui.backgroundcolor = "white"
$hostGui.foregroundcolor = "black"

$colors.verbosebackgroundcolor = "white"
$colors.verboseforegroundcolor = "black"
$colors.warningbackgroundcolor = "white"
$colors.warningforegroundcolor = "DarkCyan"
$colors.ErrorBackgroundColor = "white"
$colors.ErrorForegroundColor = "DarkCyan"


Set-PSReadLineOption -Colors @{
	ContinuationPrompt	= 'Black'
	Default				= 'Black'
	Comment				= 'Black'
	Keyword				= 'Black'
	String				= 'Black'
	Operator			= 'Black'
	Variable			= 'Black'
	Command				= 'Black'
	Parameter			= 'Black'
	Type				= 'Black'
	Number				= 'Black'
	Member				= 'Black'
	Emphasis			= 'Black'
	Error				= 'DarkCyan'
	Selection			= 'Black'
}

function prompt {
"" + (get-location) + " " + $env:UserName + "$ "
}

New-Alias which get-command

function Open-Notepad++ {
	param(
        [Parameter(Mandatory=$false)][string]$FileName
    )
	
	If (!($FileName)) {
		notepad++
	} else {
		If (!(Test-Path $FileName)) {
			Throw $FileName + " doesn't exist in the specified path"
		}
    # Assumes you have notepad++ in your Path variable.
    # Otherwise replace "notepad++" with full .exe path (e.g. "& 'C:\Program Files (x86)\Notepad++\notepad++.exe'").
		notepad++ (Get-Item $FileName).ToString()
	}
}
