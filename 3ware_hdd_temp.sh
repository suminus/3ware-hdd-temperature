#!/bin/bash
# read out drive temperatures in all connected 3ware raid contollers

CONTR=$( tw_cli show | grep c | cut -d " " -f1 | sed 's/^/\//' | tr '\n' ' ' )

for CON in  $CONTR
do
PORT=$( /usr/sbin/tw_cli ${CON} show | cut -d " " -f1 | grep p )
        for POR in $PORT
        do
        /usr/sbin/tw_cli ${CON}/${POR} show all | grep Temp
        done
done

exit
