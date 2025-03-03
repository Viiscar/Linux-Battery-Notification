#!/bin/bash

battery_level=$(acpi -b |cut -d "," -f2| sed 's/%//g') 
# in fedora
#battery_level=$(acpi -b |cut -d "," -f2| sed 's/%//g'| sed '1d')
		 
set -- $battery_level
#echo $1
#notify-send -i "/home/viscar/.battery-notification/battery-low.png" "Test." "Level: $1";

#If the charger is plugged in, acpi shows "charging" 
#and if it's not plugged in, it shows "discharging". 
#if acpi -b shows charging, "grep -c" will return 1 
#else it will return 0 
ac_power=$(acpi -b|grep -c "Charging") 
#echo $ac_power

#when the battery is charged up to 100% 
if [[ $1 -eq 100 ]]
then
export DISPLAY=:0.0 
notify-send -i "/home/viscar/Linux-Battery-Notification/battery-full.png" "Battery is full." "Level: $1% ";

fi

#when the battery is not charging 
#and it goes below 30% 
if [[ $ac_power -eq 0 && $1 -lt 31 ]] 
then
export DISPLAY=:0.0 
notify-send -u critical -i "/home/viscar/Linux-Battery-Notification/battery-low.png" "Battery is Low." "Level: $1% ";

fi

#*/10 * * * * sudo -u viscar DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /home/viscar/Linux-Battery-Notification/battery-notification.sh
