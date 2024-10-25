$pyWAPath = Resolve-Path -Path "g:\repositories\automate-whatsapp-messages\automater\wa_bulk.py"
$pyWAExecPath = Resolve-Path -Path "g:\repositories\automate-whatsapp-messages\.venv\Scripts\python.exe"
# creating a filename for wa_bulk.py 
$currentDate = Get-Date -Format "dd-MM-yyyy"
$fileDirectory = Resolve-Path -Path "g:\repositories\reminder\data\"
$fileName = $fileDirectory.Path + $currentDate + "-ra.json"
if (Test-Path $fileName){
    $pyOutput = &$pyWAExecPath $pyWAPath $fileName
    Write-Output $pyOutput
} else {
    Write-Warning "Reminder File Doesn't Exist Skipping..."
}