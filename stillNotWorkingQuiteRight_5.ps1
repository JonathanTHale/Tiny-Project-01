$count=0
do{

Remove-Item -path "C:\Users\$env:Adatum\Administrator\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" 
-Recurse -Force -EA SilentlyContinue -Verbose | 

Remove-Item -path "C:\Users\$env:Adatum\Administrator\AppData\Local\Microsoft\Windows\INetCache\*" 
-Recurse -Force -EA SilentlyContinue -Verbose | 

Remove-Item -path "C:\Users\$env:Adatum\Administrator\AppData\Local\Microsoft\Windows\WER\*" 
-Recurse -Force -EA SilentlyContinue -Verbose | 

Remove-Item -path "C:\Users\$env:Adatum\Administrator\AppData\Local\Temp\*" 
-Recurse -Force -EA SilentlyContinue -Verbose | 

Start-Process -file iexplore.exe -arg "http://lon-nlb/" -PassThru sleep -seconds 5
Stop-process -name iexplore.exe -PassThru -Force

Write-Output "Next attempt momentarily"
Start-sleep -Seconds 5 

$count++
 
}until($count -eq 5 -or $success)
if(-not($success)){exit}

#I just wanted it to look readable and spacing it like an email is the only way I know how