#!/bin/bash
### BEGIN INIT INFO
# Provides:          load_bt
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     1 2 3 4
# Default-Stop:      0 6
# Short-Description: Load the bluetooth driver
# Description:       Load the MT7630E bluetooth driver
### END INIT INFO
cd /usr/local/MT7630E
insmod ./mt76xx.ko
