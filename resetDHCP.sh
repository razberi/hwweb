#!/bin/bash

# write new configuration out to config file
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

EOF


# restart the iface
ifdown eth0 && ifup eth0

echo "{\"status\":\"complete\"}"