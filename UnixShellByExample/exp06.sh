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

print_title 'exp06'

print_title "awk -F : '{print \$1}' /etc/passwd"
awk -F ':' '{print $1}' /etc/passwd

print_title "df | awk '\$3 > 200'"
df | awk '$3 > 200'

print_title "date | awk '{print \"Month: \" \$2 \"\\\\nYear: \" \$6}'"
date | awk '{print "Month: " $2 "\nYear: " $6}'

print_title "awk 'BEGIN{FS=\":\"}/gengs/{print \"\\\\tHave a nice day, \" \$1 \"!\"}' /etc/passwd"
awk 'BEGIN{FS=":"}/gengs/{print "\tHave a nice day, " $1 "!"}' /etc/passwd

print_title "awk 'BEGIN{OFMT=\"%.2f\";OFS=\" <-> \"; print 1.2456789, 12E-2}'"
awk 'BEGIN{OFMT="%.2f";OFS=" <-> "; print 1.2456789, 12E-2}'

print_title "awk 'BEGIN{FS=":"}{printf \"The name is: %-18s  Home is:%s\\\\n\", $1, $6}' /etc/passwd"
awk 'BEGIN{FS=":"}{printf "The name is: %-18s  Home is:%s\n", $1, $6}' /etc/passwd