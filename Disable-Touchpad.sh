#!/bin/bash

# Listen for keyboard inputs & disable touchpad for 1s. 


while :
do
	# read -t 1 -n 1 key 
	key=$(xinput --query-state 11 | grep 'down')
	
	if [[ $key ]] 
	then
		xinput set-prop 12 "Device Enabled" 0	
		sleep 1
		xinput set-prop 12 "Device Enabled" 1
	fi
done


# Ideas taken from various sources. Thanks Obama! 
