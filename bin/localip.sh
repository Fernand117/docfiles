#!/bin/sh

IFACE=$(ifconfig wlo1 | grep "inet" | awk '{print $2}')

if [ -z "$IFACE" ]; then
    echo "%{F#2495e7} %{F#ffffff} Desconectado"
else
    echo "%{F#2495e7} %{F#ffffff} $(ifconfig wlo1 | grep "inet" | awk '{print $2}')%{u-}"
fi