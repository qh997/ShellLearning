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
};

print_title 'exp02'
echo '$#' = $#
echo '$*' = $*

set word1 word2 word3
echo '$1' = $1
shift
echo '$1' = $1

today=`date`
echo '$today' = $today

n=`expr 5 + 4`
echo '$n' = $n

while [ $n != 0 ]
do
    echo '$n' = $n
    n=`expr $n - 1`
done

print_title 'for'
dir=/tmp/
for file in $(ls $dir)
do
    if [ -f $dir$file ]
    then
        echo $file is a file
    elif [ -d $dir$file ]
    then
        echo $file is a directory
    fi
done

print_title 'array'
declare -a array=(gengs changxy xuejj gonglx)
echo ${array[2]}
echo "Today is $(date)"
