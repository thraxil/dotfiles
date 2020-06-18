#!/bin/sh

date=$(date +'%Y-%m-%d %H:%M:%S')

# IFACE=wlp2s0
IFACE=wlp0s20f3

iwconfig $IFACE 2>&1 | grep -q no\ wireless\ extension && {
    echo wired $date
    exit 0
}

essid=$(iw dev $IFACE info | grep ssid | cut -d' ' -f2)
quality=$(iwconfig $IFACE | grep Quality | cut -d'=' -f2 | cut -d' ' -f1)

BATTERY="/org/freedesktop/UPower/devices/battery_BAT0"
# TODO: parse output
# upower -i $BATTERY

echo "[$essid $quality]" $date
