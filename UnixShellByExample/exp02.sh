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

print_title 'Chapter 2 shell 编程快速入门' 28
print_cmd "echo '\$#' = \$#; echo '\$*' = \$*"
echo '$#' = $#
echo '$*' = $*

print_cmd "set word1 word2 word3; echo '\$1' = \$1; shift; echo '\$1' = \$1"
set word1 word2 word3
echo '$1' = $1
shift
echo '$1' = $1

print_cmd "today=\`date\`; echo '\$today' = \$today"
today=`date`
echo '$today' = $today

print_cmd "n=\`expr 5 + 4\`; echo '\$n' = \$n"
n=`expr 5 + 4`
echo '$n' = $n

print_cmd "while ((\$n != 0)); do echo '\$n' = \$n; n=\`expr \$n - 1\`; done"
while (($n != 0))
do
    echo '$n' = $n
    n=`expr $n - 1`
done

print_title "for 循环" 8
dir=/tmp/
for file in $(ls $dir); do
    if [ -f $dir$file ]
    then
        echo $file is a file
    elif [ -d $dir$file ]
    then
        echo $file is a directory
    fi
done

print_title "数组"
declare -a array=(gengs changxy xuejj gonglx)
echo ${array[2]}
echo ${#array[*]}

for ((i=0; i<${#array[*]}; i++)); do
    echo Name: ${array[i]}
done