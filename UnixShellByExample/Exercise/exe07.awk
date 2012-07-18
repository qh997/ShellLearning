BEGIN {
    printf "Please input a month : ";
    getline input < "/dev/tty";

    FS = ":";
}
{
    for (i = 3; i <= NF; i ++) {
        total[i - 2] = total[i - 2] + $i;
    }
    max_month = max_month < NF ? NF : max_month;
}
END {
    ave_value = -1;
    for (i = 1; i <= max_month; i++) {
        if (input == i\
            || toupper(input) == toupper(strftime("%b", mktime("2012 "i" 01 00 00 00")))\
            || toupper(input) == toupper(strftime("%B", mktime("2012 "i" 01 00 00 00")))) {
            ave_value = average(i);
            month_name = strftime("%B", mktime("2012 "i" 01 00 00 00"));
        }
    }

    if (ave_value < 0) {
        print "Wrong input."
    }
    else {
        printf "The average donation for %s is $%.2f.\n", month_name, ave_value;
    }
}

function average (mon) {
    return total[mon] / NR;
}