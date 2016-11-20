# bitcoin-ssid-ticker

#### Real time price ticker for Bitcoin over wifi network names (SSID)

Price pulled from [BitcoinAverage](https://bitcoinaverage.com/) and broadcasted using [mdk3](http://tools.kali.org/wireless-attacks/mdk3).
Script written for Openwrt, but likely to work elsewhere. Ideal for a [portable router](https://wiki.openwrt.org/toh/tp-link/tl-mr3040),
send over-the-air bitcoin graffiti anywhere you go!

This is how this looks:

![example](https://github.com/shesek/bitcoin-ssid-ticker/raw/master/example.png)

### Dependencies (openwrt):

    opkg install curl bash http://downloads.openwrt.org/barrier_breaker/14.07/ar71xx/generic/packages/oldpackages/mdk3_v6-2_ar71xx.ipk

### Scripts:

- `./ticker.sh [format]`: grabs price, outputs list of wifi network names according to [format]

- `./update.sh`: starts mdk3 and periodically updates the price (by default, every 15s)

### Configuration:

Stored in `update.sh`:

- `TICKER` - ticker string format. `%P` is replaced with current (rounded) price, `%C` is replaced with the 24h price change. Multiple network names can be separated with `\n`.
    Network names are limited to 32 bytes.

    default: `📈 1 bitcoin = %P (%C)\n📈 1 BTC = %P (%C)\n📈 1 Bitcoin = %P (%C)\n📈 bitcoin = %P (%C)\n📈 BTC = %P (%C)\n📈 Bitcoin = %P (%C)`

- `INTERVAL` - interval for pulling data from BitcoinAverage, in seconds.

    default: 15 seconds

- `IFACE` - the network interface to use (monitor mode should be supported and will automatically be activated)

    default: wlan0

- `SSIDPATH` - temporary file to write network names to.

    defailt: /tmp/bitcoin-ssid-ticker.txt

