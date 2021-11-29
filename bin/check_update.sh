#!/bin/sh

UPDATE=$(apt list --upgradable 2>/dev/null | wc -l)

if [ "$UPDATE" = "1" ]; then
	echo "%{F#2495e7} %{F#ffffff}0"
else
	 echo "%{F#2495e7} %{F#ffffff}"$UPDATE
fi
