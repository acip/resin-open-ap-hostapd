#!/bin/bash

rfkill block wifi

rfkill unblock wifi

ifconfig wlan0 down
ifconfig wlan0 192.168.42.1
ifconfig wlan0 up

sleep 1

service udhcpd start
hostapd -d /etc/hostapd/hostapd.conf
