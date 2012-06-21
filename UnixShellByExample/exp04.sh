#!/bin/bash

print_title() {
    declare wide=45
    declare str_len=$(expr length "$1")
    declare line_w=$[$[wide - str_len] / 2]

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

        echo -e '\e[1;31m'$line' ''\e[0;36m'$1'\e[1;31m'' '$line_l'\e[0m'
    fi
}

print_title 'exp04'

print_title "ps -ef | grep '^root.*[^]0-9]$'"
ps -ef | grep '^root.*[^]0-9]$'
echo '$? = '$?

print_title "ps -ef | egrep '^([[:graph:]]+[[:space:]]+){5}[^?]'"
ps -ef | egrep '^([[:graph:]]+[[:space:]]+){5}[^?]'

print_title "ps -ef | grep -E '^([[:graph:]]+)\>.*\1'"
ps -ef | grep -E '^([[:graph:]]+)\>.*\1'

print_title "ps -ef | grep -nivE '[esd]'"
ps -ef | grep -nivE '[esd]'

print_title "ps -ef | grep -nivE '[esd]'"
ps -ef | grep -cvi '[esd]'

print_title "ps -ef | egrep '(kw|pu)'"
ps -ef | egrep '(kw|pu)'

print_title "ps -ef | grep 're\b'"
ps -ef | grep 're\b'

print_title "ps -ef | egrep '\w+v\b'"
ps -ef | egrep '\w+v\b'

print_title "egrep -1 -e '- ' *"
egrep -1 -e '-x ' *
