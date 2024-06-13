#!/usr/bin/env bash

UPSTREAM_IFACE=${1:-en0} # "en0" is my internet, yours probably will be the same, until you finish reading this. Jinx.
USB_IFACE='en1' # change "en1" to your Pwnpal "ifconfig" in terminal to find out.
USB_IP=${2:-192.168.0.1} # change IP to match Pwnpal. 10.0.0.1 = default. 

for i in $(ifconfig -lu); do
  if ifconfig "$i" | grep -q "${USB_IP}" ; then USB_IFACE=$i; fi;
done

if [ -z "$USB_IFACE" ]
then
  echo "can't find usb interface with ip $USB_IP"
  exit 1
fi

echo "sharing connecting from upstream interface $UPSTREAM_IFACE to usb interface $USB_IFACE ..."

sysctl -w net.inet.ip.forwarding=1
pfctl -e
echo "nat on ${UPSTREAM_IFACE} from ${USB_IFACE}:network to any -> (${UPSTREAM_IFACE})" | pfctl -f -
