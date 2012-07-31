#!/bin/bash

# bash 中的管道最后一个命令是在子shell中运行的
# 所以以下循环中的变量在原环境中无效
cat datafile | while read line; do
    all="Only in while."
done
echo "all = $all"

# bash 中的解决方案
the_file=$(cat datafile)
while read line; do
    all="Double in while and outer."
done <<EOF
$the_file
EOF
echo "all = $all"

echo a b | read foo bar
echo "foo = $foo; bar = $bar"

set -- $(echo a b); foo=$1 bar=$2
echo "foo = $foo; bar = $bar"

set "@"$(echo a b); foo=$1 bar=$2
foo=$(echo $foo | cut -c2-)
echo "foo = $foo; bar = $bar"