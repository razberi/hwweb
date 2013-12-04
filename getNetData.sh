#!/bin/bash
ipAddy=`ifconfig | grep Bcast | sed -r "s/.*inet addr:([0-9.]+).*/\1/"`

echo "{ipAddy:$ipAddy}";
