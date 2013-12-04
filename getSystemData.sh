#!/bin/bash
cpuName=`cat /proc/cpuinfo | grep "model name" | sed "s/model name.: //"`
cpuName=`echo $cpuName | sed "s/\r\n//"`
totalMem=`cat /proc/meminfo | grep MemTotal | sed -r "s/MemTotal:.* ([0-9]+) kB/\1/"`
compName=`hostname`
osName=`uname -v`
#multiple hard drive support
hdd=`df | grep "/$" | awk '{print $2}'`
procType=`uname -p`
ipAddy1=`ifconfig | grep Bcast | sed -r "s/.*inet addr:([0-9.]+).*/\1/"`
ipAddy2=" "
numIps=`ifconfig | grep Bcast | sed -r "s/.*inet addr:([0-9.]+).*/\1/" | wc -l`
if [ $numIps -ge 2 ]
then
ipAddy2=`ifconfig | grep Bcast | sed -r "s/.*inet addr:([0-9.]+).*/\1/" | head -n2 | tail -n1`
ipAddy1=`ifconfig | grep Bcast | sed -r "s/.*inet addr:([0-9.]+).*/\1/" | head -n1 | tail -n1`
fi
lastBoot=`who -b | sed -r 's/.* ([0-9-]* [0-9:]*)/\1/'`
mask1=`ifconfig | grep Bcast | sed -r "s/.*Mask:([0-9.]+$)/\1/"`
mask2=" "
numMasks=`ifconfig | grep Bcast | sed -r "s/.*Mask:([0-9.]+$)/\1/" | wc -l`
if [ $numMasks -ge 2 ]
then
mask2=`ifconfig | grep Bcast | sed -r "s/.*Mask:([0-9.]+$)/\1/" | head -n2 | tail -n1`
mask1=`ifconfig | grep Bcast | sed -r "s/.*Mask:([0-9.]+$)/\1/" | head -n1 | tail -n1`
fi
gateway=`ip route show | head -n1 | sed -r "s/.* ([0-9.]+) .*/\1/"`
numDNS=`cat /etc/resolv.conf | grep nameserver | wc -l`
DNS1=`cat /etc/resolv.conf | grep nameserver | head -n1 | tail -n1 | sed -r "s/nameserver ([0-9.]+)/\1/"`
DNS2=" "
if [ $numDNS -eq 2 ]
then
DNS2=`cat /etc/resolv.conf | grep nameserver | head -n1 | tail -n1 | sed -r "s/nameserver ([0-9.]+)/\1/"`
fi
echo "{\"cpuName\":\"$cpuName\",\"procType\":\"$procType\",\"osName\":\"$osName\",\"totalMem\":\"$totalMem\",\"hostName\":\"$compName\",\"ipAddy1\":\"$ipAddy1\",\"ipAddy2\":\"$ipAddy2\",\"mask1\":\"$mask1\",\"mask2\":\"$mask2\",\"gateway\":\"$gateway\",\"DNS1\":\"$DNS1\",\"DNS2\":\"$DNS2\",\"lastBoot\":\"$lastBoot\",\"hdd\":\"$hdd\"}"
