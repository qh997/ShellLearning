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
    #eval $1
}

print_title "常用的 UNIX/Linux 实用程序" 26

print_cmd "apropos bash"
apropos bash

print_cmd "banner \"Hello BASH!\""
banner "Hello BASH!"

print_cmd "basename \"/usr/local/bin/repo\""
basename "/usr/local/bin/repo"

print_cmd "echo \"scale=5; 997 / 113\" | bc"
echo "scale=5; 997 / 113" | bc

print_cmd "echo \"(\$(date +%s) / (3600 * 24)) % 5\" | bc"
echo "($(date +%s)/(3600 * 24))%5" | bc

print_cmd "date \"+%Y-%m-%d %T\""
date "+%Y-%m-%d %T"

