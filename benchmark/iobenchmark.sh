#!/bin/bash

timeout $1 ./disk.sh $2 > /dev/null 2>&1
exit 0

