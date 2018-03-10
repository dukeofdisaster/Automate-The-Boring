#!/bin/bash
# Rationale: 
#	The need for this script arose while trying to crack a VM on HTB.
#	Normal nmap scans were useless and wouldn't detect any of the ports
#	even though the machine had almost every port open and filtered. I
# 	worked backwards, scanning ranges of different sizes, until finally
#	I hit the sweet spot with 20.
#
#	Other methods were suggested, including nmap -sT --min-rate 5000 --max-retries 1 -p- 
#
#	However I found the above scan to be ineffective for me. This script isn't
#	as robust as it could be, but it's a decent starting point for anyone that
#	wants to develop it further. There may have been an easier way to accomplish
#	what I was trying to do, but nonentheless, this one gets the job done and it
#	was a good, albeit semi-frustrating lesson in bash scripting. 
#
#

echo "Enter an IP address to scan: "
read IP

lower=1
upper=20
finished=0 
while [ $finished -eq 0 ]
do 
    if [ $upper -gt 1500 ];then 	
		finished=1
    fi 
    echo "scanning range $lower to $upper"
    nmap -sS -T5 $IP -p$lower-$upper >> results.txt
    sleep 2
    lower=$((lower+20)) 
    upper=$((upper+20))
done 

