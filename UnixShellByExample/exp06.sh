#!/bin/bash

print_title() {
    declare wide=65
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
}

print_title 'exp06'

print_title "awk -F : '{print \$1}' /etc/passwd"
awk -F ':' '{print $1}' /etc/passwd

print_title "df | awk '\$3 > 200'"
df | awk '$3 > 200'

print_title "date | awk '{print \"Month: \" \$2 \"\\\\nYear: \" \$6}'"
date | awk '{print "Month: " $2 "\nYear: " $6}'

print_title "awk 'BEGIN{FS=\":\"}/gengs/{print \"\\\\tHave a nice day, \" \$1 \"!\"}' /etc/passwd"
awk 'BEGIN{FS=":"}/gengs/{print "\tHave a nice day, " $1 "!"}' /etc/passwd

print_title "awk 'BEGIN{OFMT=\"%.2f\";OFS=\" <-> \"; print 1.2456789, 12E-2}'"
awk 'BEGIN{OFMT="%.2f";OFS=" <-> "; print 1.2456789, 12E-2}'

print_title "awk 'BEGIN{FS=":"}{printf \"The name is: %-18s  Home is:%s\\\\n\", \$1, \$6}' /etc/passwd"
awk 'BEGIN{FS=":"}{printf "The name is: %-18s  Home is:%s\n", $1, $6}' /etc/passwd

print_title "awk '/^[na]/{print \$1}' datafile"
awk '/^[na]/{print $1}' datafile

print_title " awk '\$5 ~ /\.[7-9]+/' datafile"
awk '$5 ~ /\.[7-9]+/' datafile

print_title "awk '{print \"Number of fields: \" NF}' datafile2"
awk '{print "Number of fields: " NF}' datafile2

print_title "awk -F: '{print \"Number fo fields: \" NF}' datafile2"
awk -F: '{print "Number fo fields: " NF}' datafile2

print_title "awk -F\"[ :]\" '{print \$1\"<=>\"\$2,\$3}' datafile2"
awk -F"[ :]" '{print $1"<=>"$2,$3}' datafile2

print_title "awk -f nawk.scl datafile"
awk -f nawk.scl datafile

echo -e "\n\e[0;33m++++ sed 和 awk 范围操作符的差别 ++++\e[0m"

print_title "awk '/Joel/,/Joel/' datafile"
awk '/Joel/,/Joel/' datafile
print_title "sed -n '/Joel/,/Joel/p' datafile"
sed -n '/Joel/,/Joel/p' datafile

print_title "awk '\$6 > .9' datafile"
awk '$6 > .9' datafile

print_title "awk '\$3 ~ /^Susan/{print \"Percentage: \" \$6 + .2 \" Volume: \" \$8}' datafile"
awk '$3 ~ /^Susan/{print "Percentage: " $6 + .2 " Volume: " $8}' datafile

print_title "awk '$3 == \"Chris\"{\$3 = \"Christian\"; print}' datafile"
awk '$3 == "Chris"{$3 = "Christian"; print}' datafile

print_title "awk '\$3 ~ /Val/ {wage = \$5 \* \$7; print wage}' datafile"
awk '$3 ~ /Val/ {wage = $5 * $7; print wage}' datafile

print_title "awk  -F: '\$1 == \"Sheri Watson\"{print NR, \$1, \$2, \$NF}' datafile2"
awk  -F: '$1 == "Sheri Watson"{print NR, $1, $2, $NF}' datafile2

print_title "awk '{print \$3, \$4 | \"sort -r +1 -2 +0 -1\"}' datafile"
awk '{print $3, $4 | "sort -r +1 -2 +0 -1"}' datafile

print_title "awk '/^north/{count++;}END{print \"Total : \" count}' datafile"
awk '/^north/{count++;}END{print "Total : " count}' datafile

print_title "awk -f awk.sc3 datafile"
awk -f awk.sc3 datafile

print_title "awk '{if (\$8 >= 20) print \$1 \" Too high\"; else print \"OK\"}' datafile"
awk '{if ($8 >= 20) print $1 " Too high"; else print "OK"}' datafile

print_title "awk '{if (\$8 >= 20) {count++; print \$1 \" Too high\";}else{print \$2 \" is OK\"}}END{print \"Totle : \" count}' datafile"
awk '{if ($8 >= 20) {count++; print $1 " Too high";}else{print $2 " is OK"}}END{print "Totle : " count}' datafile

print_title "awk '{if (\$1 ~ /Susan/) print; else next; print \"Found Susan!\"}' datafile2"
awk '{if ($1 ~ /Susan/) print; else next; print "Found Susan!"}' datafile2

echo -e "\n\e[0;33m++++ 数组 ++++\e[0m"

print_title "awk '{name[x++] = \$4} END{for (i = 0; i < NR; i++) print i, name[i]}' datafile"
awk '{name[x++] = $4} END{for (i = 0; i < NR; i++) print i, name[i]}' datafile

print_title "awk 'BEGIN{OFS=\"\\\\t\"}{location[\$4] = \$1} END{for (l in location) print l, location[l]}' datafile"
awk 'BEGIN{OFS="\t"}{location[$4] = $1} END{for (l in location) print l, location[l]}' datafile

print_title "awk '{count[\$7]++} END{for (n in count) print n, count[n]}' datafile"
awk '{count[$7]++} END{for (n in count) print n, count[n]}' datafile

print_title "awk 'BEGIN{split(\"25/6/2012\", date, \"/\"); print \"Year : \" date[3]}' datafile"
awk 'BEGIN{split("25/6/2012", date, "/"); print "Year : " date[3]}' datafile

print_title "awk 'BEGIN{srand()};{print int(rand() * 10)}' datafile"
awk 'BEGIN{srand()};{print int(rand() * 10)}' datafile

print_title "awk 'BEGIN{FS = \"\\n\"; RS = \"\"; ORS = \"\\n\\n\"}{print NR, \$1, \$2, \$3, \$4}' checkbook"
awk 'BEGIN{FS = "\n"; RS = ""; ORS = "\n\n"}{print NR, $1, $2, $3, $4}' checkbook

print_title "awk 'BEGIN{\"date\" | getline d; split(d, mon); print mon[2]}' datafile"
awk 'BEGIN{"date" | getline d; split(d, mon); print mon[2]}' datafile