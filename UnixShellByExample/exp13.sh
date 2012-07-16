#!/bin/bash

function print_title {
    declare -i wide=85
    declare -i str_len=$(expr length "$1")
    declare -i line_w=$[$[$wide - $str_len] / 2]

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

        #echo -e '\e[1;31m'$line' ''\e[0;36m'"$1"'\e[1;31m'' '$line_l'\e[0m'
        echo -e "\e[1;31m${line} \e[0;36m$1\e[1;31m ${line_l}\e[0m"
    fi
}

print_title 'exp14'

print_title 'bash --version'
bash --version

print_title 'echo $BASH_VERSION'
echo $BASH_VERSION

print_title 'Show sh files'
for shfile in ./*.sh; do
    echo $shfile' in this dir'
done

print_title "awk -v x=2.45 -v y=3.123 'BEGIN{printf \"%.2f\\\\n\", x*y}'"
awk -v x=2.45 -v y=3.123 'BEGIN{printf "%.2f\n", x*y}'

for par in $*; do
    echo $#:$par
done

set Xuejj Changxy
for par in $*; do
    echo $#:$par
done

set 'xxx jjj rrr' 'ccc xxx yyy'

print_title "for mg in \$*; do echo $mg; done"
for mg in $*; do
    echo $mg
done

print_title "for mg in \"\$*\"; do echo $mg; done"
for mg in "$*"; do
    echo $mg
done

print_title "for mg in \$@; do echo $mg; done"
for mg in $@; do
    echo $mg
done

print_title "for mg in \"\$@\"; do echo $mg; done"
for mg in "$@"; do
    echo $mg
done

print_title "grep \"bash$\" /etc/passwd; echo \$?"
grep "bash$" /etc/passwd
echo $?

print_title "name=Tom; test \$name != Tom; echo \$?"
name=Tom
test $name != Tom
echo $?

print_title "[ \$name = Tom ]; echo \$?"
[ $name = Tom ]
echo $?

print_title "name=gengs; friend=changxy; [[ \$name == [Gg]engs ]]; echo \$?"
name=gengs; friend=changxy
[[ $name == [Gg]engs ]]
echo $?

print_title "x=2; y=3; (( x > 2 )); echo \$?"
x=2; y=3
(( x > 2 ))
echo $?

print_title "x=2; y=3; (( x <= 2 )); echo \$?"
(( x <= 2 ))
echo $?

print_title "(( x > 2 || y < 2 )); echo \$?"
(( x > 2 || y < 2 ))
echo $?

print_title "if grep -i 'changxy' /etc/passwd;"
if grep -i 'changxy' /etc/passwd; then
    echo 'Found xy'
else
    echo 'Where is xy'
fi

print_title "name=; if [ -z \$name ]; then echo 'Name is empty!'; fi"
name=
if [ -z "$name" ]; then
    echo 'Name is empty!'
fi

print_title "user=\`id | awk '{print \$1}' | awk -F'=' '{print \$2}' | sed -e 's#.*(\([^()]*\)).*#\1#'\`; echo \$user"
user=`id | awk '{print $1}' | awk -F'=' '{print $2}' | sed -e 's#.*(\([^()]*\)).*#\1#'`
echo $user

print_title "if grep 'gengs' datafile >& /dev/null; then :; else echo \"gengs not found.\"; fi"
if grep 'gengs' datafile >& /dev/null; then
    :
else
    echo "gengs not found."
fi

print_title "DATAFILE=; : ${DATAFILE:=datafile}; : ${DATAFILE:=xxxxxxxx}; echo $DATAFILE"
DATAFILE=
: ${DATAFILE:=datafile}
: ${DATAFILE:=xxxxxxxx}
echo $DATAFILE

print_title "name=cxy case \$name in"
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

print_title "names=(gengs changxy xuejj gonglx)"
print_title "for n in \$names; do echo \"Hi $n\"; done"
names=(gengs changxy xuejj gonglx)
for n in $names; do
    echo "Hi $n"
done

print_title "echo \${#names[@]}; echo \${#names[*]}"
echo ${#names[@]}
echo ${#names[*]}

print_title "for ((i=0;i<\${#names[@]};i++)); do echo \"Hello \${names[\$i]}\"; done"
for ((i=0;i<${#names[@]};i++)); do
    echo "Hello ${names[$i]}"
done

print_title "num=0; while (( \$num < 10 )); do echo -n \"\$num \"; let num+=1; done; echo \$num"
num=0
while (( $num < 10 )); do
    echo -n "$num "
    let num+=1
done
echo $num

#print_title "PS3=\"Select a program to execute: \"; select program in 'ls -F' pwd date break; do $program; done"
#PS3="Select a program to execute: "
#select program in 'ls -F' pwd date break; do
#    $program
#    REPLY=
#done

print_title "set a b c d e f g; while [[ \$# -gt 0 ]]; do echo \$*; shift; done"
set a b c d e f g
while [[ $# -gt 0 ]]; do
    echo $*
    shift
done

print_title "set \$(date); while ((\$# > 0)); do echo \$1; shift; done"
set $(date)
while (($# > 0)); do
    echo $1
    shift
done

print_title "count=1; cat datafile | while read line; do echo -e \$count\"\\\\t\"\$line; ((count++)); done"
count=1
cat datafile | while read line; do
    echo -e $count"\t"$line
    ((count++))
done

print_title "names=changxy:xuejj:guon:li.t; oldifs=\$IFS; IFS=\":\"; for person in \$names; do echo Hi \$person; done; IFS=\$oldifs"
names=changxy:xuejj:guon:li.t
oldifs=$IFS
IFS=":"
for person in $names; do
    echo Hi $person
done
IFS=$oldifs

print_title "echo \$(square 5)"
function square {
    echo $1 \* $1 = $(($1 * $1))
}
square 997

print_title "fruit=peach; echo \${fruit:-plum}"
fruit=peacheachachchh
echo ${fruit:-plum}

print_title "echo \${newfruit:-plum}"
echo ${newfruit:-plum}

print_title "echo \${fruit:2}"
echo ${fruit:2}

print_title "echo \${fruit:2:1}"
echo ${fruit:2:1}

print_title "echo \${fruit%ch*}"
echo ${fruit%ch*}

print_title "echo \${fruit%%ch*}"
echo ${fruit%%ch*}

print_title "echo \${fruit#ch*}"
echo ${fruit#*ch}

print_title "echo \${fruit##ch*}"
echo ${fruit##*ch}

print_title "echo \${#fruit}"
echo ${#fruit}

print_title "echo \$(basename \$(pwd))"
echo $(basename $(pwd))

print_title "echo \$(((25 + 3) * 3))"
echo $(((25 + 3) * 3))

print_title "declare -a friends=(cxy lij xjj); echo \${#friends[*]}"
declare -a friends=(cxy lij xjj)
echo ${#friends[*]}

print_title "echo \${friends[0]}"
echo ${friends[0]}

print_title "echo \${friends[*]}"
echo ${friends[*]}

print_title "Here Documents"
cat <<END
1. xxxxxxxx
2. yyyyyyyy
  2.1 aaaa
  2.2 bbbb
3. zzzzzzzz
  3.1 IIII
  3.2 XXXX
END