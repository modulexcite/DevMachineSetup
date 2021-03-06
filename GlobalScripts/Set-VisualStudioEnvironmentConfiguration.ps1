function Set-VisualStudioEnvironmentConfiguration(){

	if(!($DTE)){
		throw "This function must be executed within the Nuget Package Manager to work correctly.";
	}

	# Map Ctrl+W to close a tab
	$DTE.Commands.Item("File.Close").Bindings = "Global::Ctrl+W";
	$DTE.Commands.Item("File.Close").Bindings = "Text Editor::Ctrl+W"
	
	# Turn on line numbers for ALL language types
	($DTE.Properties("TextEditor", "AllLanguages") | where {$_.Name -eq "ShowLineNumbers" } ).Value = $true
	
	# Autoload files when they've changed on disk - great for git branch switching or typescript reloads of js files.
	($DTE.Properties("Environment", "Documents") | where {$_.Name -eq "AutoloadExternalChanges" }).Value = $true

}
