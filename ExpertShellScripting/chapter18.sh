#!/bin/bash

function timeouter {
    waitfor=5
    command=$*
    ($command >/dev/null 2>&1) &
    commandpid=$!
    (sleep $waitfor; kill -9 $commandpid >/dev/null 2>&1) &
    watchdogpid=$!
    sleeppid=$(ps $ppid $watchdogpid | awk '{print $1}')
    echo "Waitting..."
    wait $commandpid
    kill $sleeppid >/dev/null 2>&1
}

timeouter "ping" "server"
echo "Finished"