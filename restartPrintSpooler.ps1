Restart-Service Spooler
$printer = Get-CimInstance win32_printer -Filter "Default = 1"
$printer
Invoke-CimMethod -MethodName PrintTestPage -InputObject $printer
exit 0
