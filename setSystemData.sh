#!/bin/sh
ip1=$1
ip2=$2

sub1=$3
sub2=$4

gateway=$5

dns1=$6
dns2=$7


# write new configuration out to config file
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
metric 0
address $ip1
netmask $sub1
gateway $gateway
dns-nameservers $dns1 $dns2

EOF

# if secondary ip is set write that out also
if [ $ip2 != 0 ]; then
cat << EOF >> /etc/network/interfaces
auto eth0:0
iface eth0:0 inet static
address $ip2
netmask $sub2
EOF
fi

# restart the iface
ifdown eth0 && ifup eth0

# restart the secondary iface
if [ $ip2 != 0 ]; then
  ifdown eth0:0 && ifup eth0:0
fi

echo "{\"status\":\"complete\"}"
