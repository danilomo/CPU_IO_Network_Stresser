#!/bin/bash

SRC=source.test
DST=dest.test

rm $SRC $DST

[ ! -f $SRC ] && dd if=/dev/zero of=$SRC bs=524288000 count=1
[ -f $DST ] && rm $DST

while :
do
    sync # flush dirty buffers to disk
    sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"

    if [ "$1" -eq -1 ]
    then
        rsync --progress $SRC $DST
    else
        rsync --progress --bwlimit=$1 $SRC $DST
    fi

done
