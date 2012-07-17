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

print_title "打印所有的电话号码" 18
print_cmd "awk -F: '{print \$2}' lab3.data"
awk -F: '{print $2}' lab3.data

print_title "打印 Dan 的电话号码" 19
print_cmd "awk -F: '/^Dan /{print \$2}' lab3.data"
awk -F: '/^Dan /{print $2}' lab3.data

print_title "打印 Susan 的姓名和电话号码" 27
print_cmd "gawk -F: '/^\<Susan\>/{print \$1, \$2}' lab3.data"
gawk -F: '/^\<Susan\>/{print $1, $2}' lab3.data

print_title "打印所有以 D 开头的姓氏" 23
print_cmd "gawk -F: '{split(\$1, name, \" \");if (name[2] ~ /^D/) print name[2]}' lab3.data"
gawk -F: '{split($1, name, " ");if (name[2] ~ /^D/) print name[2]}' lab3.data

print_title "打印所有以 D 或者 E 开头的名字" 30
print_cmd "awk '\$1 ~ /^(C|E)/{print \$1}' lab3.data"
awk '$1 ~ /^(C|E)/{print $1}' lab3.data

print_title "打印所有只包含 4 个字符的名字" 29
print_cmd "awk --posix '\$1 ~ /^.{4}\$/{print \$1}' lab3.data"
awk --posix '$1 ~ /^.{4}$/{print $1}' lab3.data

print_title "打印所有区号为 916 的人的名字" 29
print_cmd "awk -F: '\$2 ~ /^\(916\)/{split(\$1, name, \" \");print name[1]}' lab3.data"
awk -F: '$2 ~ /^\(916\)/{split($1, name, " ");print name[1]}' lab3.data

print_title "打印 Mike 的资助金额" 20
print_cmd "awk -F: '\$1 ~ /^Mike/{printf \"\$%d \$%d \$%d\\\\n\", \$3, \$4, \$5}' lab3.data"
awk -F: '$1 ~ /^Mike/{printf "$%d $%d $%d\n", $3, $4, $5}' lab3.data

print_title "打印所有的姓，后面跟一个逗号和名" 32
print_cmd "awk -F: '{print \$1}' lab3.data | awk 'BEGIN{OFS=\",\"}{print \$2, \$1}'"
awk -F: '{print $1}' lab3.data | awk 'BEGIN{OFS=","}{print $2, $1}'

print_title "awk 脚本" 8
print_cmd "awk -f facts.awk lab3.data"
awk -f facts.awk lab3.data