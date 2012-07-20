#!/bin/echo Warning: this library should be sourced!

function ostype {
    local osname=$(uname -s)
    OSTYPE="UNKNOW"
    case $osname in
        "FreeBSD") OSTYPE="FREEBSD";;
        "Linux") OSTYPE="LINUX";;
    esac
    return 0
}

function evenodd {
    local last_digit=$(echo $1 | sed 's/.*\(.\)$/\1/')
    case $last_digit in
        0|2|4|6|8) return 0;;
        *) return 1;;
    esac
}

function isalive {
    local node=$1
    ping -c 3 $node >/dev/null 2>&1
}