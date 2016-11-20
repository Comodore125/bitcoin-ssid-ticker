# bitcoin-ssid-ticker

#### Openwrt script to broadcast a bitcoin price ticker over wifi ssid names

Price pulled from [BitcoinAverage](https://bitcoinaverage.com/) and broadcasted using [mdk3](http://tools.kali.org/wireless-attacks/mdk3).

This is how this looks:

![example](https://github.com/shesek/bitcoin-ssid-ticker/raw/master/example.png)

### Depdendencies:

    opkg install curl bash http://downloads.openwrt.org/barrier_breaker/14.07/ar71xx/generic/packages/oldpackages/mdk3_v6-2_ar71xx.ipk

### Files:

- `ticker.sh`: grabs price, outputs newline-delimited list of wifi network names

- `update.sh`: starts mdk3 and periodically updates the price (by default, every 15s)

### Configuration:

Stored in `update.sh`:

- `TICKER` - ticker string format. `%P` is replaced with current (rounded) price, `%C` is replaced with the 24h price change. Multiple wifi names can be separated with `\n`.

    default: `📈 1 bitcoin = %P (%C)\n📈 1 BTC = %P (%C)\n📈 1 Bitcoin = %P (%C)\n📈 bitcoin = %P (%C)\n📈 BTC = %P (%C)\n📈 Bitcoin = %P (%C)`

- `INTERVAL` - interval for pulling data from BitcoinAverage, in seconds.

    default: 15 seconds

- `IFACE` - the network interface to use (monitor mode should be supported and will automatically be activated)

    default: wlan0

- `SSIDPATH` - temporary file to write network names to.

    defailt: /tmp/bitcoin-ssid-ticker.txt

### Running:

Configure and run:

    ./update.sh
