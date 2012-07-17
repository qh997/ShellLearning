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

print_title "awk 练习" 8

print_title "打印第二个月捐款超过 100 美元的人的姓和名" 41
print_cmd "awk -F: '\$4 > 100{split(\$1, name, \" \");print name[2], name[1]}' lab3.data"
awk -F: '$4 > 100{split($1, name, " ");print name[2], name[1]}' lab3.data

print_title "打印最后一个月捐款数少于 85 美元的人的姓名和电话" 48
print_cmd "awk -F: '$NF < 85{print \$1, \$2}' lab3.data"
awk -F: '$NF < 85{print $1, $2}' lab3.data

print_title "打印第一个月捐款数在 75～180 美元之间的人" 41
print_cmd "awk -F: '\$3 >= 75 && \$3 <= 180{print \$1}' lab3.data"
awk -F: '$3 >= 75 && $3 <= 180{print $1}' lab3.data

print_title "打印这三个月捐款总额超过 800 美元的人" 37 
print_cmd "awk -F: '(\$3 + \$4 + \$5) >= 800{print \$1}' lab3.data"
awk -F: '($3 + $4 + $5) >= 800{print $1}' lab3.data

print_title "打印月均捐款额大于 200 美元的人的姓名和电话" 43
print_cmd "awk -F: '(\$3 + \$4 + \$5) / 3 >= 200{print \$1, \$2}' lab3.data"
awk -F: '($3 + $4 + $5) / 3 >= 200{print $1, $2}' lab3.data

print_title "打印不在 916 区的人的姓" 23
print_cmd "awk -F: '\$2 !~ /\(916\)/{print \$1}' lab3.data | awk '{print \$2}'"
awk -F: '$2 !~ /\(916\)/{print $1}' lab3.data | awk '{print $2}'

print_title "打印每条记录并加上其记录号" 26
print_cmd "awk '{print FNR":"\$0}' lab3.data"
awk '{print FNR", "$0}' lab3.data

print_title "打印每个人的姓名以及捐款总额" 28
print_cmd "awk -F: '{print \$1", "\$3+\$4+\$5}' lab3.data"
awk -F: '{print $1", "$3+$4+$5}' lab3.data

print_title "把 Chet 第二个月的捐款数加上 10" 31
print_cmd "awk -F: '\$1 ~ /^Chet\\>/{\$4 += 10; print \$0}' lab3.data"
awk -F: '$1 ~ /^Chet\>/{$4 += 10; print $0}' lab3.data

print_title "把 Nancy McNeil 改为 Louise Mclnnes" 35
print_cmd "awk -F: '\$1 == \"Nancy McNeil\"{\$1 = \"Louise Mclnnes\"; print \$0}' lab3.data"
awk -F: '$1 == "Nancy McNeil"{$1 = "Louise Mclnnes"; print $0}' lab3.data