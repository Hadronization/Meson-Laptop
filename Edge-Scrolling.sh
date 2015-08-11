#!/bin/bash

mousemove=(0,0,0) 
touchedge=0

while :
do
	for (( i=0; i<3; i++ ))
	do
		mousex=$(xinput --query-state 12 | awk -F "=" '/valuator\[0\]/ {print $2}') 
		mousey=$(xinput --query-state 12 | awk -F "=" '/valuator\[1\]/ {print $2}') 
		touchedge=$mousex
		mousemove[i]=$mousey 
		sleep 0.01 
	done 
	
	if [ "$touchedge" -gt 1300 ]
	then
		if [ "${mousemove[0]}" -lt "${mousemove[1]}" ] && [ "${mousemove[1]}" -lt "${mousemove[2]}" ]
		then
			xdotool click 5 
			xdotool click 5 
			xdotool click 5 
		fi 
		if [ "${mousemove[0]}" -gt "${mousemove[1]}" ] && [ "${mousemove[1]}" -gt "${mousemove[2]}" ]
		then
			xdotool click 4 
			xdotool click 4 
			xdotool click 4 
		fi
	fi 	
done

# NOTE: Existing touchpad driver is unable to report absolute positions! 
# Listens for mouse inputs & scrolls the window where cursor is located. 
# This script requires the package(s) "sudo apt-get install xdotool evtest". 



