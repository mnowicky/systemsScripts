$result = Get-WMIObject -Query "Select * FROM Win32_LogicalDisk WHERE DriveType=3"
$disk_count = 0
foreach ($r in $result){ $disk_count += 1}
if ($disk_count -lt 2) { # Edit this line to match the number of disks you expect to have
    Write-host ("The attached HDD count is less than expected. Current disk count is " + $disk_count)
    exit 1
} else {
    Write-host ("The attached HDD count is: " + $disk_count)
    exit 0
}
