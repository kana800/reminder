$pyWAPath = Resolve-Path -Path "G:\repositories\automate-whatsapp-messages\automater\wa_bulk.py"
$pyReminderScriptPath = Resolve-Path -Path "G:\repositories\reminder\src\main.py"
$pyWAExecPath = Resolve-Path -Path "G:\repositories\automate-whatsapp-messages\.venv\Scripts\python.exe"
$pyReminderExecPath = Resolve-Path -Path "G:\repositories\reminder\.venv\Scripts\python.exe" 
# creating a filename for wa_bulk.py 
$currentDate = Get-Date -Format "dd-MM-yyyy"
$fileDirectory = Resolve-Path -Path "G:\repositories\reminder\data"
$fileName = $fileDirectory.Path + $currentDate + "-ra.json"
# running reminder script to generate content
Write-Host "Fetching for reminders..."
$pyRemOutput = & $pyReminderExecPath $pyReminderScriptPath
Write-Host "Sending the messages..."
$pyWAOutput = & $pyWAExecPath $pyWAPath $fileName
Write-Host "Done"