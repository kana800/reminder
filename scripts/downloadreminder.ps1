$pyReminderScriptPath = Resolve-Path -Path "g:\repositories\reminder\src\main.py"
$pyReminderExecPath = Resolve-Path -Path "g:\repositories\reminder\.venv\Scripts\python.exe" 
Write-Host "Fetching for reminders..."
$pyRemOutput = & $pyReminderExecPath $pyReminderScriptPath