#!/bin/bash

#Results writing to the file
output_file=`dirname $0`"/task4_1.out"
exec 1>$output_file

BaseBoard1=`dmidecode -s baseboard-manufacturer`
BaseBoard2=`dmidecode -s baseboard-product-name`
BaseBoard=$BaseBoard1$BaseBoard2

echo "--- Hardware ---"
echo "CPU: `cat /proc/cpuinfo | grep "model name" -m1 | cut -c14-`" 
echo "RAM: `cat /proc/meminfo | grep MemTotal | awk '{print $2$3}'`" 
echo "Motherboard: $BaseBoard"
echo "System Serial Number: `dmidecode -s system-serial-number`"

echo "--- System ---"
echo "OS Distribution: `lsb_release -d --short`"
echo "Kernel version: `uname -r`"
echo "Installation date: `ls -clt / | tail -n 1 | awk '{ print $6, $7, $8 }'`"
echo "Hostname: `hostname`"
echo "Uptime: `uptime -p | cut -c4-`"
echo "Processes running: `ps -e | wc -l`"
echo "Users logged in: `uptime | cut -d "," -f 3 | cut -d " " -f 3`"

echo "--- Network ---"
for Iface in $(ip addr list | grep "UP" | awk '{print $2}' | cut -d ":" -f 1 | cut -d "@" -f 1)
   do
	IP=`ip addr list $Iface | grep "inet " | awk '{print $2}'`
	echo "$Iface: $IP"
   done
