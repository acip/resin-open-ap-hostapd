#!/bin/bash

rfkill unblock wifi

ifconfig wlan0 192.168.42.1
ifconfig wlan0 down
iwconfig wlan0 mode managed
ifconfig wlan0 up

sleep 1

wpa_supplicant -B -Dwext -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf

hostapd -B -d /etc/hostapd/hostapd.conf

service udhcpd start

dropbear -E -F
