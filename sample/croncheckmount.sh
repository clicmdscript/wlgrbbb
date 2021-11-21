#!/bin/bash

df -h |
if grep -qs '/mnt/scalelite-recordings' /proc/mounts; then
        echo "It's mounted."
else
        echo "It's not mounted."
        sudo mount file.vconnect.greenlife-vn.com:/mnt/scalelite-recordings /mnt/scalelite-recordings
fi
 
