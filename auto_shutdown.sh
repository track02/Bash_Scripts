#!/bin/bash
#Basic Script to automatically shutdown machine after x minutes
#Executes on Weekdays only, no shutdown on user-defined "Weekend"

#Time until shutdown in minutes
shutdown_time=180

#First day of "weekend" no shutdowns will be made starting from this day until Sunday
#Set to 8 if shutdown is required every day
no_shutdown_start_day=5

#Format date, to return day of the week (1-7)
day=$(date +%u) 

#Execution H:M
hour=$(date +%H)
minute=$(date +%M)

#Shutdown H:M
shutdown_hour=$(($hour + ($shutdown_time / 60)))
shutdown_minute=$(($minute + ($shutdown_time % 60)))


if [ $day -lt $no_shutdown_start_day ] 
then
	echo "$(date) - Shutdown in $shutdown_time minutes at $shutdown_hour:$shutdown_minute"
	/sbin/shutdown -h $shutdown_time
else
	echo "$(date) - No Shutdown Today"
fi
