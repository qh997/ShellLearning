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

print_title "grep 练习" 9

print_title "打印所有包含字符串 San 的行" 27
print_cmd "grep 'San' databook"
grep 'San' databook

print_title "打印所有名字以 J 开头的行" 25
print_cmd "grep '^J' databook"
grep '^J' databook

print_title "打印所有以 700 结尾的行" 23
print_cmd "grep '700\$' databook"
grep '700$' databook

print_title "打印所有不包含 834 的行" 23
print_cmd "grep -v '834' databook"
grep -v '834' databook

print_title "打印所有生日在 December 的行" 28
print_cmd "egrep ':12/[0-9]+/[0-9]+:' databook"
egrep ":12/[0-9]+/[0-9]+:" databook

print_title "打印所有电话号码区号为 408 的行" 31
print_cmd "egrep ':408(-[0-9]{3}){2}[0-9]:' databook"
egrep ':408(-[0-9]{3}){2}[0-9]:' databook

print_title "打印所有一个大写字母＋4个小写字母＋逗号＋空格＋一个大写字母的行" 63
print_cmd "egrep -n '[[:upper:]][[:lower:]]{4}, [[:upper:]]' databook"
egrep '[[:upper:]][[:lower:]]{4}, [[:upper:]]' databook

print_title "打印所有最后一个名字以 K 或 k 开始的行" 38
print_cmd "egrep '^\w+ +[Kk]\w+' databook"
egrep '^\w+ +[Kk]\w+' databook

print_title "打印所有薪水为 6 位数的行，前导是一个行号" 41
print_cmd "egrep -n ':[[:digit:]]{6}$' databook"
egrep -n ':[[:digit:]]{6}$' databook