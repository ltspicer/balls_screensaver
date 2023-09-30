#!/bin/bash

killall -9 balls.bin

export LD_PRELOAD=/usr/lib64/libstdc++.so.6
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6

./balls.bin /c
