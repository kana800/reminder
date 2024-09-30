$pyWAPath = Resolve-Path -Path "g:\repositories\automate-whatsapp-messages\automater\wa_bulk.py"
$pyReminderScriptPath = Resolve-Path -Path "g:\repositories\reminder\src\main.py"
$pyWAExecPath = Resolve-Path -Path "g:\repositories\automate-whatsapp-messages\.venv\Scripts\python.exe"
$pyReminderExecPath = Resolve-Path -Path "g:\repositories\reminder\.venv\Scripts\python.exe" 
# creating a filename for wa_bulk.py 
$currentDate = Get-Date -Format "dd-MM-yyyy"
$fileDirectory = Resolve-Path -Path "g:\repositories\reminder\data\"
$fileName = $fileDirectory.Path + $currentDate + "-ra.json"
# running reminder script to generate content
Write-Host "Fetching for reminders..."
#$pyRemOutput = & $pyReminderExecPath $pyReminderScriptPath
#Write-Host "Sending the messages..."
Write-Host $fileName
$pyWAOutput = & $pyWAExecPath $pyWAPath $fileName
Write-Host "Done"