#!/bin/bash
freeMem=`cat /proc/meminfo | grep MemFree | sed -r "s/MemFree:.* ([0-9]+) kB/\1/"`
cpuUse=`top -b -n1 | grep Cpu | sed -re "s/.*:[ ]+([0-9.]*)%us,.*/\1/"`
uptime=$(</proc/uptime)
uptime=${uptime%%.*}
seconds=$(( uptime%60 ))
minutes=$(( uptime/60%60 ))
hours=$(( uptime/60/60%24 ))
days=$(( uptime/60/60/24 ))
hdd=`df | grep "/$" | awk '{print $3}'`
#diskUse=`df | grep "/$"`
echo "{\"freeMem\":\"$freeMem\",\"cpuUse\":\"$cpuUse\",\"uptime\":\"$days days, $hours hours, $minutes minutes, $seconds seconds\",\"hdd\":\"$hdd\"}"
