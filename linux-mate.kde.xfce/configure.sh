#!/bin/bash

###############################
#   Bildschirmschoner  V1.4   #
#    von Daniel Luginbuehl    #
#         (C) 2023            #
#  webmaster@ltspiceusers.ch  #
#                             #
###############################

startername="balls"

killall -9 balls.bin 2>/dev/null

export LD_PRELOAD=/usr/lib64/libstdc++.so.6
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6

while true; do
    ./balls.bin /c

    read -p"Testen?/Test it? (Y/n)" response
    if [[ "$response" == "n" ]]; then
        exit
    fi

    /usr/lib/xscreensaver/$startername

    read -p"Behalten?/Keep? (Y/n)" response
    if [[ "$response" != "n" ]]; then
        exit
    fi
done
