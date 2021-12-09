$count=0
do{
<# The below was used in the NLB exercise to clear the cache at the start of 
and prior to each incrementation. We needed to clear the cache to ensure that there was 
equal likelihood of the NLB webhosting to pull the HTML page 
from either Server 1 or 2. We altered the page of Server 2 so that when 
IE would open each time the difference would be noticeable to us. Whereas 
we would normally have to open IE to the NLB URL, close, clear cache, and try
again manually, this script does it all for us while pausing with enough time 
in between for the page to load and our eyes to recognize what's going on.

For use on any other PCs outside of the lab environment, I've commented out 
the NLB and IE references and just replaced them with the notepad app
so that the functionality can be viewed on any PC. 

The $HOME shortcut was used so that the below locations would not be user-
specific and should work for any user on any device. 

Remove-Item -path "$HOME\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" 
-Recurse -Force -EA SilentlyContinue -Verbose | 

Remove-Item -path "$HOME\AppData\Local\Microsoft\Windows\INetCache\*" 
-Recurse -Force -EA SilentlyContinue -Verbose | 

Remove-Item -path "$HOME\AppData\Local\Microsoft\Windows\WER\*" 
-Recurse -Force -EA SilentlyContinue -Verbose | 

Remove-Item -path "$HOME\AppData\Local\Temp\*" 
-Recurse -Force -EA SilentlyContinue -Verbose | 

Start-Sleep -seconds 2 <-- we don't need it to sleep here as the cache was not cleared
#>
Start-Process -filepath "C:\Windows\notepad.exe" <# -arg "http://lon-nlb/" #> -PassThru 

Start-Sleep -Seconds 2

Stop-process -name notepad
# changing ie to notepad bc IE doesn't work in Win10, that only works on the Win2016 Server OS I was initially using. 


Write-Output "Next attempt momentarily"
Start-sleep -Seconds 1 

$count++
 
}until($count -eq 2){exit}

# check source https://vijayarajt.wordpress.com/2021/01/24/open-or-close-applications-using-powershell/ 
# Functions might be better; do I need to force close to help with IE history? 

#I just wanted it to look readable and spacing it like an email is the only way I know how