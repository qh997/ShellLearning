#!/bin/bash

function init {
    ARGS=$(getopt -o xvd: --long debug-level: -n "$0" -- "$@")
    if [ $? != 0 ]; then
        exit 1
    fi
    eval set -- "$ARGS"

    while true ; do
        case "$1" in
            -x) set -x; shift;;
            -v) set -v; shift;;
            -d|--debug-level) DEBUG=$2; shift 2;;
            --) shift; break;;
            *) echo "Internal error!"; exit 1;;
        esac
    done

    : ${DEBUG:=0}
}

function debug {
    if [[ -z $@ ]]; then
        return 0
    elif [[ $# == 2 ]]; then
        local debug_level=$1
        shift
    fi
    : ${debug_level:=1}

    local print_time=$(date +%H:%M:%S.%N | sed 's/[[:digit:]]\{6\}$//')

    if [ $debug_level -le $DEBUG ]; then
        echo "[DebugMessage $print_time $debug_level] $1"
    fi
}

init $@

echo -n "Can you write device drivers? "
answer=$(awk 'BEGIN{srand(); if (int(rand()*10) % 2) printf "Y"; else printf "N";}')
echo $answer
debug 1 "answer = $answer"
answer=$(echo $answer | tr [a-z] [A-Z])
if [ $answer = 'Y' ]; then
    echo "Wow, you must be very skilled!"
else
    echo "Neither can I."
fi

debug "set +xv"
set +xv

debug 2 "END"