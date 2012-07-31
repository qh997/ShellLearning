#!/bin/bash

process_list=$(ps -ef | sed -e '1d' | awk 'BEGIN{OFS=":"}{print $2, $3, $8}')

function find_process_tree {
    local proc_id=$1
    local space=$2

    local sub_proc_count=$(echo "$process_list" | awk 'BEGIN{FS=":";CNT=0}{if ($2 == '$proc_id') CNT++}END{printf "%d", CNT}')

    for line in $process_list; do
        local line_pid=${line%%:*}
        local line_ppid=${line#*:}
        local line_ppid=${line_ppid%%:*}
        local line_cmd=${line#*:*:}

        if (($line_ppid == $proc_id)); then
            ((sub_proc_count--))
            if (($sub_proc_count)); then
                echo "${space}|\\"
                echo "${space}| $line_pid $line_cmd"
                find_process_tree $line_pid "${space}| "
            else
                echo "${space} \\"
                echo "${space}  $line_pid $line_cmd"
                find_process_tree $line_pid "${space}  "
            fi
        fi
    done
}

if [[ $1 -gt 0 ]]; then
    proc=$1
else
    proc=0
fi

echo $proc $(echo "$process_list" | awk 'BEGIN{FS=":"}{if ($1 == '$proc') printf "%s", $3}')
find_process_tree $proc