#!/bin/bash

function print_title {
    wide=72
    str_len=${2:-$(expr length "$1")}
    line_w=$(((wide - str_len) / 2))

    echo
    if (($line_w <= 0))
    then
        echo -e '\e[1;31m'- '\e[0;36m'$1'\e[1;31m' -'\e[0m'
    else
        declare line_l
        while (($line_w > 0))
        do
            line_l=$line_l'-'
            line_w=$[line_w - 1]
        done

        declare line=$line_l
        if (($[$[wide - str_len] % 2] > 0))
        then
            line=$line'-'
        fi

        echo -e "\e[1;31m${line} \e[0;36m${1}\e[1;31m ${line_l}\e[0m"
    fi
}

function print_cmd {
    echo
    echo -e "\e[0;35mCOMMAND > \e[1;32m${1}\e[0;35m <\e[0m"
}

print_title 'Chapter 4 grep 家族'

print_cmd "ps -ef | grep '^root.*[^]0-9]$'; echo '\$? = '\$?"
ps -ef | grep '^root.*[^]0-9]$'
echo '$? = '$?

print_cmd "ps -ef | egrep '^([[:graph:]]+[[:space:]]+){5}[^?]'"
ps -ef | egrep '^([[:graph:]]+[[:space:]]+){5}[^?]'

print_cmd "ps -ef | grep -E '^([[:graph:]]+)\>.*\1'"
ps -ef | grep -E '^([[:graph:]]+)\>.*\1'

print_cmd "ps -ef | grep -nivE '[esd]'"
ps -ef | grep -nivE '[esd]'

print_cmd "ps -ef | grep -cvi '[esd]'"
ps -ef | grep -cvi '[esd]'

print_cmd "ps -ef | egrep '(kw|pu)'"
ps -ef | egrep '(kw|pu)'

print_cmd "ps -ef | grep 're\\\\b'"
ps -ef | grep 're\b'

print_cmd "ps -ef | egrep '\w+v\\\\b'"
ps -ef | egrep '\w+v\b'

print_cmd "egrep -1 -e '-x ' *"
egrep -1 -e '-x ' *