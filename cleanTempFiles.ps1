$folders = @("C:\Windows\Temp\*", "C:\Documents and Settings\*\Local Settings\temp\*", "C:\Users\*\Appdata\Local\Temp\*", "C:\Users\*\Appdata\Local\Microsoft\Windows\Temporary Internet Files\*", "C:\Windows\SoftwareDistribution\Download", "C:\Windows\System32\FNTCACHE.DAT")
foreach ($folder in $folders) {Remove-Item $folder -force -recurse -ErrorAction SilentlyContinue}
exit 0
