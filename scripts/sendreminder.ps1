$pyWAPath = Resolve-Path -Path "g:\repositories\automate-whatsapp-messages\automater\wa_bulk.py"
$pyWAExecPath = Resolve-Path -Path "g:\repositories\automate-whatsapp-messages\.venv\Scripts\python.exe"
# creating a filename for wa_bulk.py 
$currentDate = Get-Date -Format "dd-MM-yyyy"
$fileDirectory = Resolve-Path -Path "g:\repositories\reminder\data\"
$fileName = $fileDirectory.Path + $currentDate + "-ra.json"
if ("-1" -ne $pyRemOutput )
{
    Write-Host $fileName
    Write-Host "Sending the messages..."
    $pyWAOutput = & $pyWAExecPath $pyWAPath $fileName
    Write-Host "Done"
} 
else 
{
    Write-Host "No reminders Found"
}