$count=0
do{

Remove-Item -path "$HOME\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" 
-Recurse -Force -EA SilentlyContinue -Verbose | 

Remove-Item -path "$HOME\AppData\Local\Microsoft\Windows\INetCache\*" 
-Recurse -Force -EA SilentlyContinue -Verbose | 

Remove-Item -path "$HOME\AppData\Local\Microsoft\Windows\WER\*" 
-Recurse -Force -EA SilentlyContinue -Verbose | 

Remove-Item -path "$HOME\AppData\Local\Temp\*" 
-Recurse -Force -EA SilentlyContinue -Verbose | 

Start-Sleep -seconds 2

Start-Process -filepath "C:\Windows\notepad.exe" <# -arg "http://lon-nlb/" #> -PassThru 

Start-Sleep -Seconds 2

Stop-process -name notepad.exe 
# changing ie to notepad bc IE doesn't work in Win10, that only works on the Win2016 Server OS I was initially using. 


Write-Output "Next attempt momentarily"
Start-sleep -Seconds 1 

$count++
 
}until($count -eq 2){exit}
# if(-not($success)){exit}  -redundant line

# check source https://vijayarajt.wordpress.com/2021/01/24/open-or-close-applications-using-powershell/ 
# Functions might be better; do I need to force close? 
<#
'a','b','c' | % -PV letter { $_ } |

'a' | % -pv a { $_ } | % -PV number { 1,2,3 } | % { write "${a}${number}" }
#>

#I just wanted it to look readable and spacing it like an email is the only way I know how