#!/bin/bash
/usr/share/aircrackgui-m4/aircrack-GUI
while read file
do
MASS=($(cat /proc/$file/stat))
if [ "${MASS[3]}" = "1" ]
then
    kill -9 $file
fi
done <<< "$(ps -ax|grep airodump-ng|awk '{print $1}')"
