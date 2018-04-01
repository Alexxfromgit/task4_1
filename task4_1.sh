#!/bin/bash

output_file=`dirname $0`"/task4_1.out"
exec 1>$output_file

echo "--- Hardware ---"
echo "CPU: `cat /proc/cpuinfo | grep "model name" -m1 | cut -c14- || echo 'Unknown'`" 
echo "RAM: `cat /proc/meminfo | grep MemTotal | awk '{print $2$3}' || echo 'Unknown'`" 
echo "Motherboard: `dmidecode -s baseboard-product-name || echo 'Unknown'`"
echo "System Serial Number: `dmidecode -s system-serial-number || echo 'Unknown'`"

echo "--- System ---"
echo "OS Distribution: `lsb_release -d --short || echo 'Unknown'`"
echo "Kernel version: `uname -r || echo 'Unknown'`"
echo "Installation date: `ls -clt / | tail -n 1 | awk '{ print $6, $7, $8 }' || echo 'Unknown'`"
echo "Hostname: `hostname || echo 'Unknown'`"
echo "Uptime: `uptime -p | cut -c4- || echo 'Unknown'`"
echo "Processes running: `ps -e | wc -l || echo 'Unknown'`"
echo "Users logged in: `uptime | cut -d "," -f 2 | cut -d " " -f 3`"

echo "--- Network ---"
for Iface in $(ip addr list | grep "UP" | awk '{print $2}' | cut -d ":" -f 1 | cut -d "@" -f 1)
    do
	IP=`ip addr list $Iface | grep "inet " | awk '{print $2}'`
	echo "$Iface: $IP"
    done
