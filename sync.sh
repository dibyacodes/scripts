#!/bin/bash

echo "Starting up syncing her photos..."

copyLocation="/run/media/dibyacodes/SANDISK/.her/"

echo "Running ADB..."
adb devices

echo "
Files in Phone - .her : $(adb ls /sdcard/DCIM/.her | wc -l) Files In the phone."

echo "

Pulling Photos from .her folder to /tmp/...
"
adb pull /sdcard/DCIM/.her/ /tmp/

echo "
Syncing it to your pendrive - $copyLocation "
rsync -avvh --update /tmp/.her/ $copyLocation
# ls -a $copyLocation

echo "
Verifying Actions...
"

echo "SANDISK : $(ls $copyLocation | wc -l) files
/tmp/.her : $(ls /tmp/.her/ | wc -l) files
"

echo "
rm -rf /tmp/.her/ ? (y/n)"
read rmrf

if [[ "$rmrf" == "y" ]];then
    rm -rf /tmp/.her
    echo "Files Removed : $(ls /tmp/.her)"
elif [[ "$rmrf" == "n" ]];then
    echo "
    File /tmp/.her/ preserved"
    exit 0
else
    echo " $rmrf is invalid"
fi