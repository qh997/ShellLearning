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

print_title "Chapter 14 bash shell 编程" 26

print_cmd "echo \$BASH_VERSION"
echo $BASH_VERSION

print_title "算术运算" 8

print_cmd "declare -i num; num=(2+3)*7; echo \$num"
declare -i num
num=(2+3)*7
echo $num

print_cmd "unset num; num=(2+3)*7; echo \$num"
unset num
num=(2+3)*7
echo $num

print_cmd "let \"num = 5\"; let \"num = num * 9\" echo \$num"
let "num = 5"
let "num = num * 9"
echo $num

print_title "浮点运算" 8

print_cmd "num=\$(echo \"scale=3; 997 / 113\" | bc); echo \$num"
num=$(echo "scale=3; 997 / 113" | bc)
echo $num

print_cmd "product=\$(awk -v x=2.25 -v y=3.133 'BEGIN{printf\"%.2f\\\\n\", x * y}'); echo $product"
product=$(awk -v x=2.25 -v y=3.133 'BEGIN{printf"%.2f\n", x * y}')
echo $product

print_title "位置参量和命令行参数" 20

print_cmd "echo \$#; echo \$0"
echo $#
echo $0

print_title "set 命令与位置参量" 18

print_cmd "set cxy xjj gun; echo \$*; echo \$#"
set cxy xjj gun
echo $*
echo $#

print_cmd "for gl in \$*; do echo \$gl; done"
for gl in $*; do
    echo $gl
done

print_cmd "set \"c xi ye\" \"x ja ji\""
set "c xi ye" "x ja ji"

print_cmd "for i in \$*; do echo $i; done"
for i in $*; do
    echo $i
done

print_cmd "for i in \"\$*\"; do echo $i; done"
for i in "$*"; do
    echo $i
done

print_cmd "for i in \$@; do echo $i; done"
for i in $@; do
    echo $i
done

print_cmd "for i in \"\$@\"; do echo $i; done"
for i in "$@"; do
    echo $i
done

print_title "test 命令" 9

print_cmd "name=qiuqing; [[ \"\$name\" =~ ^qiu.*ing ]]; echo \$?"
name="qiuqing xuejiajia"
[[ $name =~ ^qiu.*ing ]]
echo $?

print_cmd "[[ \$name =~ (jia)+ ]]; echo \$?"
[[ $name =~ (jia)+ ]]
echo $?

print_title "let 命令" 8

print_cmd "x=2; y=3"
x=2; y=3

print_cmd "((x > 2)); echo \$?"
((x > 2))
echo $?

print_cmd "((x == 2 && y == 3)); echo \$?"
((x == 2 && y == 3))
echo $?

print_cmd "((x > 2 || y < 3)); echo \$?"
((x > 2 || y < 3))
echo $?

print_title "if 命令 null 命令" 17

print_cmd "if grep 'gengs' datafile >& /dev/null; then :; else echo \"gengs not found.\"; fi"
if grep 'gengs' datafile >& /dev/null; then
    :
else
    echo "gengs not found."
fi

print_cmd "DATAFILE=; : \${DATAFILE:=datafile}; : \${DATAFILE:=xxxxxxxx}; echo \$DATAFILE"
DATAFILE=
: ${DATAFILE:=datafile}
: ${DATAFILE:=xxxxxxxx}
echo $DATAFILE

print_title "case 命令" 9

print_cmd "name=cxy; case \$name in gs) echo \$name:master;; ?[Xx][Yy]) echo \$name:salver;; esac"
name=cxy
case $name in
    gs)
    echo $name:master
    ;;

    ?[Xx][Yy])
    echo $name:salver
    ;;

    *)
    echo "Don't know"
    ;;
esac

print_title "for 命令" 8

print_cmd "names=\"gengs changxy xuejj gonglx\""
names="gengs changxy xuejj gonglx"

print_cmd "for n in \$names; do echo \"Hi $n\"; done"
for n in $names; do
    echo "Hi $n"
done

print_cmd "names=(gengs changxy xuejj gonglx)"
names=(gengs changxy xuejj gonglx)

print_cmd "for n in \${names[*]}; do echo \"Hi $n\"; done"
for n in ${names[*]}; do
    echo "Hi $n"
done

print_cmd "names=(\"geng shuang\" \"chang xing ye\" \"xue jia jia\" \"gong li xin\")"
names=("geng shuang" "chang xing ye" "xue jia jia" "gong li xin")

print_cmd "for n in \"\${names[@]}\"; do echo \"Hi \$n\"; done"
for n in "${names[@]}"; do
    echo "Hi $n"
done

print_title "while 命令 shift 命令" 21

print_cmd "set a b c d e f g; while [[ \$# -gt 0 ]]; do echo \$*; shift; done"
set a b c d e f g
while [[ $# -gt 0 ]]; do
    echo $*
    shift
done

print_title "IO 重定向" 9

print_cmd "cat datafile | while read line; do echo -e \$((++count))\"\\\\t\"\$line; done"
cat datafile | while read line; do
    echo -e $((++count))"\t"$line
done

print_cmd "for i in 7 9 2 11 3 15 6; do echo \$i; done | sort -n"
for i in 7 9 2 11 3 15 6; do
    echo $i
done | sort -n

print_title "IFS 和循环" 10

print_cmd "names=changxy:xuejj:guon:li.t; oldifs=\$IFS; IFS=\":\"; for person in \$names; do echo Hi \$person; done; IFS=\$oldifs"
names='changxy:xuejj:guon:li.t'
oldifs=$IFS
IFS=":"
for person in $names; do
    echo Hi $person
done
IFS=$oldifs

print_title "函数" 4

print_cmd "square 997"
function square {
    echo $(($1 * $1))
}
echo $(square 997)