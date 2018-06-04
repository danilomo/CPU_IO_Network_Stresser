#!/bin/bash

if [ "$2" -eq -1 ]
then
    iperf -c $3 -t $1
else
    iperf -c $3 -b "$2m" -t $1
fi
