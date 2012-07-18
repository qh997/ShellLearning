BEGIN {
    FS = ":";

    lowest = -1;
    cal = 500;
}
{
    person_total = $3 + $4 + $5;
    if (person_max["donate"] < person_total) {
        person_max["donate"] = person_total;
        person_max["name"] = $1;
    }

    width["name"] = width["name"] < length($1)+1 ? length($1)+1 : width["name"];
    width["phone"] = width["phone"] < length($2)+1 ? length($2)+1 : width["phone"];
    width["month"] = width["month"] < length($3)+5 ? length($3)+5 : width["month"];
    width["month"] = width["month"] < length($4)+5 ? length($4)+5 : width["month"];
    width["month"] = width["month"] < length($5)+5 ? length($5)+5 : width["month"];
    width["total"] = width["total"] < length(person_total)+5 ? length(person_total)+5 : width["total"];

    total += person_total;
    for (i = 1; i <= NF; i++) {main[NR, i] = $i;}
    main[NR, NF + 1] = person_total;

    if (person_total >= cal) {
        over500[++oi] = $1"--"$2;
    }
}
END {
    title = "***CAMPAIGN 2004 CONTRIBUTIONS***";
    tail = "SUMMARY";

    head_strfmt = "%-"width["name"]"s%-"width["phone"]"s%-"width["month"]"s|%-"width["month"]-1"s|%-"width["month"]-1"s|%"width["total"]"s";
    main_strfmt = "%-"width["name"]"s%"width["phone"]"s%"width["month"]".2f%"width["month"]".2f%"width["month"]".2f%"width["total"]".2f\n";

    title_str = sprintf(head_strfmt,
        get_center_space("NAME", width["name"])"NAME",
        get_center_space("NAME", width["name"])"PHONE",
        get_center_space("Jan", width["month"])"Jan",
        get_center_space("Feb", width["month"])"Feb",
        get_center_space("Mar", width["month"])"Mar",
        get_center_space("Total Donated", width["total"])"Total Donated");

    width["row"] = length(title_str) + 5;

    split(person_max["name"], thksname, " ");
    thanks_str = "***THANKS "thksname[1]"***";
    sort_500(over500, oi);

    print get_center_space(title, width["row"])title;
    print_line(width["row"]);
    print title_str;
    print_line(width["row"]);
    for (i = 1; i <= NR; i++) {
        printf main_strfmt, main[i, 1], main[i, 2], main[i, 3], main[i, 4], main[i, 5], main[i, 6];
    }
    print_line(width["row"]);
    print get_center_space(tail, width["row"])tail;
    print_line(width["row"]);
    printf "The campaign received a total of $%.2f for this quarter.\n", total;
    printf "The average donation for the %d contributors was $%.2f.\n", NR, total/NR;
    printf "The highest total contribution was $%.2f made by %s.\n", person_max["donate"], person_max["name"];
    printf "%s\n", get_center_space(thanks_str, width["row"])thanks_str;

    printf "The Following people donated over $%d to the campaign.\n", cal;
    printf "They are eligible for the quarterly drawing!!\n";
    printf "Listed are their names(sorted by last names) and phone numbers:\n"
    for (i = 1; i <= oi; i++) {
        printf "    %s\n", over500[i];
    }
    printf "        thanks to all of your continued support!!\n"
}

function print_line (wth) {
    while (wth > 0) {
        printf "-";
        wth--;
    }
    printf "\n"
}

function get_center_space (str, wth) {
    str_len = length(str);
    if (str_len >= wth) {
        return " ";
    }
    else {
        space_num = int((wth - str_len) / 2);
        space = "";
        while (space_num > 0) {
            space = space" ";
            space_num--;
        }
        return space;
    }
}

function sort_500 (names, num_eles, i, j, iname, jname, tmp) {
    for (i = 1; i <= num_eles; i++) {
        split(names[i], iname, " ");
        for (j = i + 1; j <= num_eles; j++) {
            split(names[j], jname, " ");

            if (iname[2] > jname[2]) {
                tmp = names[j];
                names[j] = names[i];
                names[i] = tmp;
            }
        }
    }
}