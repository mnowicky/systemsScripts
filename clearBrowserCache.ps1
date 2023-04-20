Write-Host -ForegroundColor Green "SECTION 1: Getting the list of users"
# Write Information to the screen
Write-Host -ForegroundColor Black "Exporting the list of users to c:\users\%username%\users.csv"
# List the users in c:\users and export to the local profile for calling later
dir C:\Users | select Name | Export-Csv -Path C:\users\$env:USERNAME\users.csv -NoTypeInformation
$list=Test-Path C:\users\$env:USERNAME\users.csv
""
"-------------------"
Write-Host -ForegroundColor Green "SECTION 2: Beginning Script..."
"-------------------"
if ($list) {
    "-------------------"
    #Clear Mozilla Firefox Cache
    Write-Host -ForegroundColor Green "SECTION 3: Clearing Mozilla Firefox Caches"
    "-------------------"
    Write-Host -ForegroundColor Black "Clearing Mozilla caches"
    Write-Host -ForegroundColor cyan
    Import-CSV -Path C:\users\$env:USERNAME\users.csv -Header Name | foreach {
        Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\* -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\*.* -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache2\* -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache2\*.* -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\thumbnails\* -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cookies.sqlite -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\webappsstore.sqlite -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\chromeappsstore.sqlite -Recurse -Force -EA SilentlyContinue -Verbose
	}
    Write-Host -ForegroundColor Black "Clearing Mozilla caches"
    Write-Host -ForegroundColor Black "Done..."
    ""
    "-------------------"
    # Clear Google Chrome
    Write-Host -ForegroundColor Green "SECTION 4: Clearing Google Chrome Caches"
    "-------------------"
    Write-Host -ForegroundColor Blue "Clearing Google caches"
    Write-Host -ForegroundColor Black
    Import-CSV -Path C:\users\$env:USERNAME\users.csv -Header Name | foreach {
        Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache2\entries\*" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Media Cache" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies-Journal" -Recurse -Force -EA SilentlyContinue -Verbose
        # Comment out the following line to remove the Chrome Write Font Cache too.
        # Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\ChromeDWriteFontCache" -Recurse -Force -EA SilentlyContinue -Verbose
	}

    Write-Host -ForegroundColor Blue "Done..."
    ""
    "-------------------"
    # Clear Internet Explorer
    Write-Host -ForegroundColor Green "SECTION 5: Clearing Internet Explorer Caches"
     "-------------------"
    Write-Host -ForegroundColor Green "Clearing Google caches"
    Write-Host -ForegroundColor Black
    Import-CSV -Path C:\users\$env:USERNAME\users.csv | foreach {
        Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\WER\*" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Temp\*" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "C:\Windows\Temp\*" -Recurse -Force -EA SilentlyContinue -Verbose
        Remove-Item -path "C:\`$recycle.bin\" -Recurse -Force -EA SilentlyContinue -Verbose
	}

    Write-Host -ForegroundColor Red "Done..."
    ""
    Write-Host -ForegroundColor Black "All Tasks Done!"
    Remove-Item C:\users\$env:USERNAME\users.csv
    Write-Host -ForegroundColor Black "User file removed"
	exit 0
} else {
    Write-Host -ForegroundColor Black "Session Cancelled"
    Remove-Item C:\users\$env:USERNAME\users.csv
    exit 0
}
