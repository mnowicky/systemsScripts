$logs = get-eventlog -list | foreach {$_.log}
foreach ($l in $logs) {
    limit-eventlog -logname $l -MaximumSize 40MB
}
get-eventlog -list
exit 0
