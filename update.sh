#!/bin/bash

TICKER='📈 1 bitcoin = %P (%C)\n📈 1 BTC = %P (%C)\n📈 1 Bitcoin = %P (%C)\n📈 bitcoin = %P (%C)\n📈 BTC = %P (%C)\n📈 Bitcoin = %P (%C)'
INTERVAL=15
IFACE=wlan0
SSIDPATH=/tmp/bitcoin-ssid-ticker.txt

iw dev $IFACE interface add mon0 type monitor && ifconfig mon0 up

echo . > $SSIDPATH
mdk3 mon0 b -s 500 -m -a -c 11 -h -f $SSIDPATH &

while :
do
  echo "Updating bitcoin ticker..."
  TICKER="$TICKER" ./ticker.sh | tee $SSIDPATH
  sleep $INTERVAL
done

