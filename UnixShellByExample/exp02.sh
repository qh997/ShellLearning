#!/bin/bash

print_title() {
    wide=45
    str_len=`expr length $1`
    echo $str_len
    syb=`expr $wide - $str_len`
    echo $syb
    syb=`expr $syb / 2`
    line=
    echo $syb

    while [ $syb -gt 0 ]
    do
        line=$line'-'
        syb=`expr $syb - 1`
    done

    echo $line
}

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
for file in `ls $dir`
do
    if [ -f $dir$file ]
    then
        echo $file is a file
    elif [ -d $dir$file ]
    then
        echo $file is a directory
    fi
done