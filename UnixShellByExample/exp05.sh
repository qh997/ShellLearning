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

print_title 'exp05'

print_title "sed -n '/xy/p' *"
sed -n '/xy/p' *

print_title "ps | sed '1,3d'"
ps | sed '1,3d'

print_title "sed -e '30,$d' -e 's/^ *//' -e 's/ *$//' -e '/^$/d' exp04.sh"
sed -e '30,$d' -e 's/^ *//' -e 's/ *$//' -e '/^$/d' exp04.sh

print_title "date | sed -n 's/[0-9][0-9]*/[&]/gp'"
date | sed -n 's/[0-9][0-9]*/[&]/gp'

print_title "sed -n '/^echo/,/^print_title /s/$/** EVE **/p' exp04.sh"
sed -n '/^echo/,/^print_title /s/$/** EVE **/p' exp04.sh

print_title "sed -n -e '/^echo/{h; d;}' -e '/kw/{G;p;}' exp04.sh"
sed -n -e '/^echo/{h; d;}' -e '/kw/{G;p;}' exp04.sh

print_title "sed -e '$aEND' -e '1iSTART' -e '/[wly]/d' -e '/game/cGAME' -e '/[mM]/s/$/ ***/' /etc/passwd"
sed -e '$aEND' -e '1iSTART' -e '/[wly]/d' -e '/game/cGAME' -e '/[mM]/s/$/ ***/' /etc/passwd

print_title "sed '/^man/s/\(\([a-zA-Z0-9]*:\)\{3\}\)[0-9]*/\1[000]/p' -n /etc/passwd"
sed '/^man/s/\(\([a-zA-Z0-9]*:\)\{3\}\)[0-9]*/\1[000]/p' -n /etc/passwd