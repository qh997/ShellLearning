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

print_title "sed 练习" 8

print_title "把 Jon 的名字改为 Jonathan" 26
print_cmd "sed -n 's/\bJon\b/Jonathan/p' databook"
sed -n 's/\bJon\b/Jonathan/p' databook

print_title "删除头 3 行" 11
print_cmd "sed '1,3d' databook"
sed '1,3d' databook

print_title "打印 5~10 行" 12
print_cmd "sed -n '5,10p' databook"
sed -n '5,10p' databook

print_title "删除含有 Lane 的所有的行" 24
print_cmd "sed '/Lane/d' databook"
sed '/Lane/d' databook

print_title "打印所有生日在十一月或十二月的行" 32
print_cmd "sed -n '/:1[12]\/[[:digit:]]*\/[[:digit:]]*:/p' databook"
sed -n '/:1[12]\/[[:digit:]]*\/[[:digit:]]*:/p' databook

print_title "在以 Fred 开头的各行末尾加上三颗星" 34
print_cmd "sed '/^Fred/s/$/***/p' databook"
sed '/^Fred/s/$/***/p' databook

print_title "将所有包含 Jose 的行替换为 JOSE HAS RETIRED" 43
print_cmd "sed '/Jose/s/.*/JOSE HAS RETIRED/' databook"
sed '/Jose/s/.*/JOSE HAS RETIRED/' databook

print_title "把 Popeye 的生日改为 11/14/46" 29
print_cmd "sed -n '/^Popeye/s/:[0-9]\{1,\}\/[0-9]\{1,\}\/[0-9]\{1,\}:/:11\/14\/46:/p' databook"
sed -n '/^Popeye/s/:[0-9]\{1,\}\/[0-9]\{1,\}\/[0-9]\{1,\}:/:11\/14\/46:/p' databook

print_title "sed 脚本"
print_cmd "sed -f exe02_10.sed databook"
sed -f exe02_10.sed databook