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

print_title 'Chapter 5 流编辑器 sed' 23

print_cmd "sed -n '/xy/p' *"
sed -n '/xy/p' *

print_cmd "ps | sed '1,3d'"
ps | sed '1,3d'

print_cmd "sed -e '4,\$d' -e 's/^ *//' -e 's/ *\$//' -e '/^\$/d' -e 's/  */ /g' datafile"
sed -e '4,$d' -e 's/^ *//' -e 's/ *$//' -e '/^$/d' -e 's/  */ /g' datafile

print_cmd "date | sed -n 's/[0-9][0-9]*/[&]/gp'"
date | sed -n 's/[0-9][0-9]*/[&]/gp'

print_cmd "sed -n '/^southern/,/^eastern/s/\$/** EVE **/p' datafile"
sed -n '/^southern/,/^eastern/s/$/** EVE **/p' datafile

print_cmd "sed -e '/WE/{h; d;}' -e '/CT/{G;}' datafile"
sed -e '/WE/{h; d;}' -e '/CT/{G;}' datafile

print_cmd "sed -e '\$aEND' -e '1iSTART' -e '/[wly]/d' -e '/game/cGAME' -e '/[mM]/s/\$/ ***/' /etc/passwd"
sed -e '$aEND' -e '1iSTART' -e '/[wly]/d' -e '/game/cGAME' -e '/[mM]/s/$/ ***/' /etc/passwd

print_cmd "sed -n '/^man/s/\(\([a-zA-Z0-9]*:\)\{3\}\)[0-9]*/\1[000]/p' /etc/passwd"
sed -n '/^man/s/\(\([a-zA-Z0-9]*:\)\{3\}\)[0-9]*/\1[000]/p' /etc/passwd