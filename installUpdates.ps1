Write-Host "Checking for Windows updates"
$UpdateCollection = New-Object -ComObject Microsoft.Update.UpdateColl
$Searcher = New-Object -ComObject Microsoft.Update.Searcher
$Session = New-Object -ComObject Microsoft.Update.Session

$Searcher = New-Object -ComObject Microsoft.Update.Searcher
$results = $searcher.search("Type='software' AND IsInstalled = 0 AND IsHidden = 0 AND AutoSelectOnWebSites = 1")

# Install Update
if ($results.Updates.Count -eq 0) {
    Write-Host "No updates found"
    # no updates.
} else {
    # setup update collection
    foreach ($update in $results.Updates){
        $UpdateCollection.Add($update) | out-null
    }

    # download update items
    Write-Host "Downloading updates"
    $Downloader = $Session.CreateUpdateDownloader()
    $Downloader.Updates = $UpdateCollection
    $Downloader.Download()

    # install update items
    Write-Host "Installing updates"
    $Installer = New-Object -ComObject Microsoft.Update.Installer
    $Installer.Updates = $UpdateCollection
    $InstallationResult = $Installer.Install()
    # Check Result
    if ($InstallationResult.ResultCode -eq 2){
        Write-Host "Updates installed successfully"
    } else {
        Write-Host "Some updates could not be installed"
    }
    if ($InstallationResult.RebootRequired){
        Write-Host "System needs to reboot"
        # uncomment the following line to automatically reboot the system if a reboot is required after the updates are installed
        #shutdown -r -f -t 300 -c "Rebooting in 5 minutes to apply Windows updates"
    }
}
