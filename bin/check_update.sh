#!/bin/sh

UPDATE=$(apt-get -s upgrade | grep actualizados | awk '{print $1}')

if [ "UPDATE" > 0 ]; then
	echo "%{F#2495e7} %{F#ffffff}"$(apt-get -s upgrade | grep actualizados | awk '{print $1}')
else
	 echo "%{F#2495e7} %{F#ffffff} 0"
fi
