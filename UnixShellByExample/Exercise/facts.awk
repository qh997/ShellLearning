BEGIN {
    FS = ":";
    result1 = "Savage:\n";
    result2 = "Chet:\n";
    result3 = "1st >= 250:\n";
}
{
    split($1, name, " ");
    if (name[2] == "Savage") {
        result1 = result1"  "$1" "$2"\n";
    }

    if (name[1] == "Chet") {
        result2 = result2"  $"$3" $"$4" $"$5"\n";
    }

    if ($3 >= 250) {
        result3 = result3"  "$1"\n";
    }
}
END {printf "%s%s%s", result1, result2, result3}