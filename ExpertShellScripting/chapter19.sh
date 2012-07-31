#!/bin/bash

old_stty_settings=$(stty -g)
stty -icanon

theta=0

while true; do
    keypress=$(head -c1)
    echo

    case $keypress in
        [xXqQ]) 
            echo "The End!"
            break
            ;;
        j|J) 
            if [[ $theta != 0 ]]; then
                theta=$(($theta - 1))
            else
                theta=90
            fi

            echo "Theta : $theta"
            ;;
        k|K)
            if [[ $theta != 90 ]]; then
                theta=$(($theta + 1))
            else
                theta=0
            fi

            echo "Theta : $theta"
            ;;
    esac
done

stty "$old_stty_settings"
exit 0