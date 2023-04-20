#!/bin/bash
# DESC: nmap multi thread script for mass scanning

DHOSTS=$(cat domain.com.ip)

for DHOST in $DHOSTS; do
   NMAP=$(pgrep -f nmap | wc -l)
   while [ $NMAP -gt 12 ]
   do
      sleep 30
      NMAP=$(pgrep -f nmap | wc -l)
   done
   echo ------------- $DHOST --------------- > nmap_$DHOST.txt
   nmap -PN -T1 -sA -sV -O -sU --host-timeout 60m $DHOST >> nmap_$DHOST.txt &
   clear
   echo -------------------- Now Im Scanning this targets --------------------
   ps -ef | grep nmap | grep -v grep
done
