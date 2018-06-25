#!/bin/bash
#
# Simple script for comining multiple evasion techniques into 1 script. 
# Firwall evasion will become necessary in almost every corporate environment,
# making such scans useful.
#
echo "\nEnter the IP to scan:"
read IP
echo "\n[+] Starting fragmented packet scan of $IP\n"
nmap -f $IP
echo "\n[+] Starting firewall-bypass built-in scirpt scan of $IP"
nmap --script firewall-bypass $IP

# MTU scan; must be a multiple of 8, alter at your preference.
echo "\n[+] Starting Maximum Transmision Unit scan of $IP\n"
nmap --mtu 24 $IP

# Decoy scan; we use random number here which is easiest, could have the user specify 
echo "\n[+] Starting decoy scan; random # of decoys will be used\n"
nmap -D RND:10 $IP

# Source port spoofing alter; script to submit custom
echo "\n[+] Scanning with spoofed source-port; default 53, alter for custom\n"
#read SOURCEPORT
nmap --souce-port 53 $IP

# Append random data of specified length
echo "\n[+] Scanning with appended data of length 27; alter for custom\n"
nmap --data-length 27 $IP

