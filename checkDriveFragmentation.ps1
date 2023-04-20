$version = (Get-WmiObject Win32_OperatingSystem).Version
$major = $version.split(".")[0]
$minor = $version.split(".")[1]
if ($major -gt 6 -or ($major -eq 6 -and $minor -gt 1)) {
	Optimize-Volume $pwd.drive.name -Analyze -verbos
} Else {
	Write-Output "Operating system is not supported."
}
