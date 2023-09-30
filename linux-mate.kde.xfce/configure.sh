#!/bin/bash

###############################
#   Bildschirmschoner  V1.4   #
#    von Daniel Luginbuehl    #
#         (C) 2023            #
#  webmaster@ltspiceusers.ch  #
#                             #
###############################

killall -9 balls.bin

export LD_PRELOAD=/usr/lib64/libstdc++.so.6
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6

./balls.bin /c
