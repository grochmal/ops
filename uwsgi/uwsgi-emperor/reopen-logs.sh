#!/bin/sh

RUNDIR=/run/uwsgi

echo l > "$RUNDIR/emperor.efifo"
for vfifo in $RUNDIR/*.fifo
do
    echo r > "$vfifo"
done

