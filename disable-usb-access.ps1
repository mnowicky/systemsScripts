Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR" -Name "Start" -Value "4"
# Restart-Computer # Uncomment this line to automatically restart the computer
