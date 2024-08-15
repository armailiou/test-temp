#!/bin/bash

temp() {
	dir_logs=/home/root
	logname="Test_`date '+%Y%m%d_%H%M%S'`.log"
	cycle=0

	while true; do
		((cycle++))
		sleep 5

		temperature=$(tail /sys/class/thermal/thermal_zone0/temp)
        	temperature_rounded=$(echo "scale=2; $temperature/1000" | bc)
        	printf "Cycle $cycle, time: `date`, temperature $temperature_rounded\n"
        	printf "Cycle $cycle, time: `date`, temperature $temperature_rounded\n" >> $dir_logs/$logname
        done
}

temp

wpa_supplicant -B -Dnl80211 -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf

dhclient wlan0 # use udhcpc -i wlan0 if dhclient is not present

if ping -c 1 google.com &> /dev/null; then
    echo "Connection exists."
else
    echo "No connection."
fi
