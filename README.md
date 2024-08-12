# test-temp
## This is test-temp for test temp

# Code:

'''

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


'''
