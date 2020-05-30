#!/bin/bash


function badInput {
    echo "ERROR: Syntax: $0 192.168.1."
    exit 1
}

function sweep {
    echo -e "Starting...\n"
    for ((i=1; i < 255; i++)); do
        ping -c 1 $1.$i | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
    done
    #wait should default to tracking the completion of ping process for '254'
    wait
    echo -e "\nDone!"
}

#Check if a parameter was provided, and run
[ -z "$1" ] && badInput || sweep $1
