#!/bin/bash
### BEGIN INIT INFO
# Provides:          load_wifi
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     1 2 3 4
# Default-Stop:      0 6
# Short-Description: Load Wifi
# Description:       Load the MT7630E WiFi driver
### END INIT INFO
cd /usr/local/MT7630E
insmod /lib/modules/$(uname -r)/kernel/drivers/misc/eeprom/eeprom.ko
insmod /lib/modules/$(uname -r)/kernel/drivers/misc/eeprom/eeprom_93cx6.ko
insmod /lib/modules/$(uname -r)/kernel/lib/crc-ccitt.ko
insmod /lib/modules/$(uname -r)/kernel/net/wireless/cfg80211.ko
insmod /lib/modules/$(uname -r)/kernel/net/mac80211/mac80211.ko
insmod ./rt2x00lib.ko;
insmod ./rt2x00pci.ko;
insmod ./rt2x00mmio.ko;
insmod ./rt2800lib.ko;
insmod ./rt2800pci.ko;

