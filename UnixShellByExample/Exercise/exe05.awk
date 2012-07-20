#!/usr/bin/awk -f

BEGIN {
    FS = ":";
    printf "\n%53s\n", "***CAMPAIGN 1998 CONTRIBUTIONS***";
    for (i = 0; i < 75; i++) {printf "%s", "-";}
    printf "\n";
    printf "%s\n", "NAME                PHONE            Jan  |  Feb  |  Mar  |  Total Donated";
    for (i = 0; i < 75; i++) {printf "%s", "-";}
    printf "\n";
    total = 0;
    highest = 0;
    lowest = -1;
}
{
    line_total = $3 + $4 + $5;
    total += line_total;
    highest = highest < $3 ? $3\
            : highest < $4 ? $4\
            : highest < $5 ? $5\
            : highest;
    lowest = lowest < 0 ? $3 : lowest;
    lowest = lowest > $3 ? $3\
           : lowest > $4 ? $4\
           : lowest > $5 ? $5\
           : lowest;
    printf "%-20s%s%8.2f%8.2f%8.2f%9.2f\n", $1, $2, $3, $4, $5, line_total;
}
END {
    for (i = 0; i < 75; i++) {printf "%s", "-";}
    printf "\n";
    printf "%40s\n", "SUMMARY";
    for (i = 0; i < 75; i++) {printf "%s", "-";}
    printf "\n";
    printf "The campaign received a total of $%.2f for this quarter.\n", total;
    printf "The average donation for the %d contributors was $%.2f.\n", NR, total/NR;
    printf "The highest contribution was $%.2f.\n", highest;
    printf "The lowest contribution was $%.2f.\n", lowest;
    printf "\n";
}